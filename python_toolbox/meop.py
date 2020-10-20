from pathlib import Path
import os
import xarray as xr
import pandas as pd
import numpy as np
import csv
import gsw
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
from importlib import reload
import netCDF4 as nc

processdir = Path.home() / 'MEOP_process'

# list functions

#  EXP_from_SMRU_CODE(smru_platform_code)
#  list_tag_EXP(EXP,qf='lr0')
#  fname_prof(smru_name,depl='',qf='hr1')
#  fname_plot_diags_matlab(smru_name,depl='',qf='hr1')
#  N_PARAM(ds,PARAM)
#  copy_file(file_name,src_dir,dst_dir)

#  read_list_profiles(rebuild=False,verbose=False,public=False,Tdata=False)
#  read_list_deployment()

#  label_regions(list_tags):
#  filter_public_data(list_profiles, list_tags, list_deployments)
#  filter_profiles_with_Tdata(list_profiles, list_tags, list_deployments)
#  filter_country(country, list_profiles, list_tags, list_deployments)

#  copy_netcdf_variable(nc_in,var_name_in,var_dims_in,nc_out,var_name_out,var_dims_out)
#  read_ncfile(ncfile_name)

#-----------------------------------   utils     --------------------------------------------#
def EXP_from_SMRU_CODE(smru_platform_code):
    return smru_platform_code.split("-")[0]

# return ncARGO filename
def fname_prof(smru_name,depl='',qf='hr1'):
    if not depl:
        depl = EXP_from_SMRU_CODE(smru_name)
    return Path(processdir,'final_dataset_prof',depl,smru_name+'_'+qf+'_prof.nc')

# return ncARGO filename
def list_tag_EXP(EXP,qf='lr0'):
    dirEXP = Path(processdir,'final_dataset_prof',EXP)
    list_tag = [ncfile for ncfile in dirEXP.glob(f'{EXP}-*_{qf}_prof.nc')]
    return list_tag

# return ncARGO filename
def fname_plot_diags_matlab(smru_name,depl='',qf='hr1'):
    if not depl:
        depl = EXP_from_SMRU_CODE(smru_name)
    return processdir / 'plots' / depl / (smru_name+'_'+qf+'_diags_TS_adj.png')

# return a DaraArray with the number of valid profile for the given PARAM
def N_PARAM(ds,PARAM):
    if PARAM+'_QC' in list(ds.variables):
        N_PARAM = np.sum((ds[PARAM+'_QC']==b'1'),axis=1)
    else:
        N_PARAM = xr.DataArray(np.zeros(ds.dims['N_PROF']), dims=['N_PROF'])
    return N_PARAM

# copy a file
def copy_file(file_name,src_dir,dst_dir):
    shutil.copyfile(Path(src_dir)/file_name,Path(dst_dir)/file_name)


# read list_deployment.csv file in processdir and return pandas dataframe
def read_list_deployment(filename_list='list_deployment.csv'):
    
    from datetime import timedelta
    if Path(processdir,filename_list).is_file():
        list_deployment = pd.read_csv(Path(processdir,filename_list))
    else:
        print('File',filename_list,'not found')
        list_deployment = None
    newnames = {}
    for var in list_deployment:
        newnames[var] = var.upper()
    
    return list_deployment.rename(columns=newnames).set_index('DEPLOYMENT_CODE')  


# build list data in MEOP, store it in pickle file and return the dataframe
def build_list_metadata():

    datadir = Path(processdir,'final_dataset_prof')

    # walk through datadir subfolderss
    list_df=[]
    for dirpath in datadir.iterdir():
        dirname = dirpath.parts[-1]
        for ncfile in dirpath.glob(f'{dirname}-*_lr0_prof.nc'):
            with xr.open_dataset(ncfile) as ds:
                data = {'DEPLOYMENT_CODE': EXP_from_SMRU_CODE(ds.smru_platform_code),
                        'SMRU_PLATFORM_CODE': ds.smru_platform_code,
                        'CYCLE_NUMBER': ds['CYCLE_NUMBER'].astype(int),
                        'JULD': ds['JULD'],
                        'LATITUDE': ds['LATITUDE'],
                        'LONGITUDE': ds['LONGITUDE'],
                        'N_TEMP' : N_PARAM(ds,'TEMP'),
                        'N_PSAL' : N_PARAM(ds,'PSAL'),
                        'N_CHLA' : N_PARAM(ds,'CHLA')}
            df = pd.DataFrame(data)
            list_df.append(df)

    # concatenate list of dataframes into one dataframe
    df_all = pd.concat(list_df)
    df_all.to_pickle(processdir / 'list_meta_lr0_prof.pkl')
    
    return df_all
    

# determine region for each tag
def label_regions(list_tags):

    # set a new columns called MASK with a regional label
    from scipy.interpolate import RegularGridInterpolator
    import regionmask

    basins = regionmask.defined_regions.ar6.all
    label = basins.names
    lon = np.arange(-179.5, 180)
    lat = np.arange(-89.5, 90)
    mask = basins.mask(lon,lat)
    f = RegularGridInterpolator((lon, lat), mask.transpose().values,method='nearest')
    list_tags["MASK"] = f(list_tags[['LONGITUDE','LATITUDE']].values)
    list_tags["MASK"] = list_tags.MASK.map(dict(enumerate(label)))
    
    map_regions = {
        'Southern-Ocean':'Southern Ocean',
        'E.Antarctica':'Southern Ocean',
        'W.Antarctica':'Southern Ocean',
        'Arctic-Ocean':'North Atlantic',
        'N.Pacific-Ocean':'North Pacific',
        'C.North-America':'North Pacific', 
        'W.North-America':'North Pacific',
        'N.E.North-America':'North Atlantic',
        'E.North-America':'North Atlantic',
        'Greenland/Iceland':'North Atlantic',
        'N.Atlantic-Ocean':'North Atlantic',
        'N.W.North-America':'North Pacific',
        'N.Europe':'North Atlantic',
        'S.Australia':'Australia',
        'N.Central-America':'North Pacific',
        'N.South-America':'Tropical Atlantic',
        'S.South-America':'South Atlantic',
        'S.Atlantic-Ocean':'South Atlantic',
    }
    list_tags['MASK'] = list_tags.MASK.map(map_regions)

    return list_tags


# select only public data
def filter_public_data(list_profiles, list_tags, list_deployments):
    
    list_tags = list_tags[list_tags.PUBLIC == 1]
    list_deployments = list_deployments[list_deployments.PUBLIC == 1]
    list_profiles = list_profiles.merge(list_tags.SMRU_PLATFORM_CODE,on='SMRU_PLATFORM_CODE')
    
    return list_profiles, list_tags, list_deployments


# select only profiles with data points
def filter_profiles_with_Tdata(list_profiles, list_tags, list_deployments):
    
    list_tags = list_tags[list_tags.N_PROF_TEMP!=0]
    list_deployments = list_deployments.merge(list_tags.DEPLOYMENT_CODE,on='DEPLOYMENT_CODE')
    list_profiles = list_profiles.loc[list_profiles.N_TEMP!=0]
    
    return list_profiles, list_tags, list_deployments


# select only profiles with data points
def filter_country(country, list_profiles, list_tags, list_deployments):
    
    list_deployments = list_deployments.loc[list_deployments.COUNTRY==country]
    list_tags = list_tags[list_tags.DEPLOYMENT_CODE.isin(list_deployments.DEPLOYMENT_CODE)]
    list_profiles = list_profiles[list_profiles.SMRU_PLATFORM_CODE.isin(list_tags.SMRU_PLATFORM_CODE)]
    
    return list_profiles, list_tags, list_deployments


# read MEOP data list from pickle file and return the dataframe.
# If filename_pkl is not found, the list file is generated.
def read_list_profiles(rebuild=False,verbose=False,public=False,Tdata=False,country=None):

    if (Path(processdir / 'list_meta_lr0_prof.pkl').is_file()) and (not rebuild):
        list_profiles = pd.read_pickle(processdir / 'list_meta_lr0_prof.pkl')
    else:
        print(f'Create metadata files in {processdir}: list_meta_lr0_prof.pkl')
        list_profiles = build_list_metadata()

    # read list of profiles
    for col in ['N_TEMP','N_PSAL','N_CHLA']:
        list_profiles[col].where(list_profiles[col]!=0,np.nan,inplace=True)
        
    list_tags = list_profiles.groupby('SMRU_PLATFORM_CODE').first()\
        .drop(['N_TEMP','N_PSAL','N_CHLA','CYCLE_NUMBER'],axis='columns')
    list_tags['N_PROF_TEMP'] = list_profiles.groupby('SMRU_PLATFORM_CODE').N_TEMP.count()
    list_tags['N_PROF_PSAL'] = list_profiles.groupby('SMRU_PLATFORM_CODE').N_PSAL.count()
    list_tags['N_PROF_CHLA'] = list_profiles.groupby('SMRU_PLATFORM_CODE').N_CHLA.count()
    
    agg_ops = {'JULD': min, 'LATITUDE': np.mean, 'LONGITUDE': np.mean, 'N_PROF_TEMP': sum,
       'N_PROF_PSAL': sum, 'N_PROF_CHLA': sum}
    list_deployments = list_tags.groupby('DEPLOYMENT_CODE').agg(agg_ops)
    list_deployments['N_TAGS'] = list_tags.groupby('DEPLOYMENT_CODE').DEPLOYMENT_CODE.count()
    list_deployments = list_deployments.merge(read_list_deployment(),on='DEPLOYMENT_CODE',how='outer')
    drop_list = ['START_DATE','END_DATE','START_DATE_JUL']
    list_deployments = list_deployments.drop(drop_list,axis='columns')
    
    list_public = list_deployments.reset_index()[['DEPLOYMENT_CODE','PUBLIC']]
    list_tags = list_tags.reset_index().merge(list_public,on='DEPLOYMENT_CODE')
    
    # add correction coefficients in list_tags
    coeff = pd.read_csv(processdir / 'table_coeff.csv')
    list_tags = list_tags.merge(coeff,left_on='SMRU_PLATFORM_CODE',right_on='smru_platform_code',how='outer')
    list_tags['comment'] = list_tags['comment'].fillna('no comment')
    tag_problem = list_tags.loc[list_tags.SMRU_PLATFORM_CODE.isnull(),:]
    if len(tag_problem.smru_platform_code):
        if verbose:
            print('List of tags with correction coefficients yet not listed in list_deployment:')
            print(tag_problem.smru_platform_code)
        message = 'tag with correction coefficient, yet no netcdf file'
        for tag in list(tag_problem.SMRU_PLATFORM_CODE):
            comment = coeff.loc[coeff.smru_platform_code == tag,'comment']            
            if message not in comment:
                if 'no comment' in comment:
                    comment = message
                else:
                    comment = comment+', '+message
                coeff.loc[coeff.smru_platform_code == tag,'comment'] = comment
                list_tags.loc[list_tags.SMRU_PLATFORM_CODE == tag,'comment'] = comment
    list_tags = list_tags.drop('smru_platform_code', axis='columns')   
    
    # add variable_offset in list_tags
    salinity_offsets = pd.read_csv(processdir / 'table_salinity_offsets.csv')
    salinity_offsets['variable_offset'] = 1
    variable_offset = salinity_offsets[['smru_platform_code','variable_offset']]
    list_tags = list_tags.merge(variable_offset,left_on='SMRU_PLATFORM_CODE',right_on='smru_platform_code',how='outer')\
        .drop('smru_platform_code', axis='columns')
    
    # add parameters from list_param.csv in list_deployments
    param = pd.read_csv(processdir / 'table_param.csv')
    list_deployments = list_deployments.reset_index().merge(param,left_on='DEPLOYMENT_CODE',right_on='deployment_code',how='outer')\
        .drop('deployment_code', axis='columns')
    
    list_deployment_hr = pd.read_csv(processdir / 'list_deployment_hr.csv', dtype={'prefix': str,'instr_id':str,'year':str})
    list_tags = list_tags.merge(list_deployment_hr,left_on='SMRU_PLATFORM_CODE',right_on='smru_platform_code',how='outer')
    list_tags['comment'] = list_tags['comment'].fillna('no comment')
    tag_problem = list_tags.loc[list_tags.SMRU_PLATFORM_CODE.isnull(),:]
    if len(tag_problem.instr_id):
        if verbose:
            print('List of instr id for tags with hr datasets but no low resolution ones:')
            print(tag_problem.instr_id)
        for tag in list(tag_problem.index):
            list_tags.drop(tag,axis=0, inplace=True)
    list_tags = list_tags.drop('smru_platform_code', axis='columns')
    
    list_tags = label_regions(list_tags)
    if 'MASK' not in list_profiles:
        list_profiles = list_profiles.merge(list_tags.set_index('SMRU_PLATFORM_CODE').MASK,on='SMRU_PLATFORM_CODE')

    if verbose:
        print(f'Update metadata files in {processdir}: list_profiles.pkl, list_tags.csv, list_deployments.csv')
    list_profiles.to_pickle(processdir / 'list_profiles.pkl')
    list_tags.to_csv(processdir / 'list_tags.csv', index=False)
    list_deployments.to_csv(processdir / 'list_deployments.csv', index=False)
    
    if public:
        list_profiles, list_tags, list_deployments = filter_public_data(list_profiles, list_tags, list_deployments)
        
    if Tdata:
        list_profiles, list_tags, list_deployments = filter_profiles_with_Tdata(list_profiles, list_tags, list_deployments)
        
    if country:
        list_profiles, list_tags, list_deployments = filter_country(country, list_profiles, list_tags, list_deployments)
        
    return list_profiles, list_tags, list_deployments


#  copy the variable var from nc_in in nc_out
def copy_netcdf_variable(nc_in,var_name_in,var_dims_in,nc_out,var_name_out,var_dims_out):
    
    with nc.Dataset(nc_in) as src, nc.Dataset(nc_out, "a") as dst:
        # copy dimensions if not already existing
        for i, name in enumerate(var_dims_out):
            if name not in dst.dimensions:
                dst.createDimension( name, src.dimensions[var_dims_in[i]].size )
            if src.dimensions[var_dims_in[i]].size - dst.dimensions[var_dims_out[i]].size != 0:
                print(f"Dimension {name} has wrong size in {nc_out}")
                return 0
        # copy variable
        if var_name_out not in dst.variables:
            var = dst.createVariable(var_name_out, src.variables[var_name_in].datatype, var_dims_out)
        # copy variable attributes all at once via dictionary
        dst[var_name_out].setncatts(src[var_name_in].__dict__)
        dst[var_name_out][:] = src[var_name_in][:]

    return 1


# read a netCDF ARGO file and return a xarray dataset structure
def read_ncfile(ncfile_name):
    
    if ncfile_name.is_file():
        ds = xr.open_dataset(ncfile_name)
        for dim in ds.dims:
            ds[dim] = ((dim), ds[dim])
            ds.set_coords([dim])
        ds['N_TEMP'] = (('N_PROF'),N_PARAM(ds,'TEMP'))
        ds['N_PSAL'] = (('N_PROF'),N_PARAM(ds,'PSAL'))
        if 'N_CHLA' in ds.variables:
            ds['N_CHLA'] = (('N_PROF'),N_PARAM(ds,'CHLA'))
        if 'N_DOXY' in ds.variables:
            ds['N_DOXY'] = (('N_PROF'),N_PARAM(ds,'DOXY'))
    else:
        print('No file: ',ncfile_name)
        return None
    return ds
    
