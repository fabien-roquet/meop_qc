# matlab.engine must be imported first
import matlab.engine

from pathlib import Path
import os
import xarray as xr
import pandas as pd
import numpy as np
import csv
import gsw
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import netCDF4
import meop

# list functions

#  update_metadata(table_meta = meop.processdir / 'table_meta.csv', EXP='',one_smru_name=''):


#--------------------  MATLAB  ----------------------------#

# pointer to matlab engine
eng = []

def start_matlab():
    # Start matlab iif not already started
    global eng
    try:
        eng.eval("disp('matlab already started')",nargout=0)
        print('matlab already started')
        print('PWD:',eng.pwd())
    except:
        eng = matlab.engine.start_matlab()
        print('matlab started')
        print('PWD:',eng.pwd())
    return

def stop_matlab():
    global eng
    eng.quit()
    eng = []
    return
    

def print_matlab(namevar):
    with io.StringIO() as out:
        eng.eval(namevar,nargout=0,stdout=out,stderr=out)
        print(out.getvalue())
    
def run_command(cmd,verbose=True):
    # execute a matlab command
    with io.StringIO() as out, io.StringIO() as err:
        try:
            print(cmd)
            eng.eval(cmd,nargout=0,stdout=out,stderr=err)
            if verbose:
                print(out.getvalue())
            return True
        except:
            if verbose:
                print(err.getvalue())
            return False
        
# init mirounga and load conf
def init_mirounga():
    eng.addpath(str(meop.processdir))
    conf = eng.eval("init_config();",nargout=1)
    run_command("conf = init_mirounga;")
    return conf

def load_info_deployment(EXP='',one_smru_name=''):
    init_mirounga()
    eng.workspace['EXP'] = EXP
    eng.workspace['one_smru_name'] = one_smru_name
    eng.eval("info_deployment=load_info_deployment(conf,EXP,one_smru_name);",nargout=0)

def process_single_deployment(EXP=''):
    load_info_deployment(EXP=EXP)
    if eng.eval("isfield(info_deployment,'invalid_code')") and eng.eval("info_deployment.invalid_code"):
        return False
    if not run_command("remove_deployment(conf,EXP);"):
        return False
    if not run_command("create_ncargo(conf,EXP);"):
        return False
    if not run_command("create_fr0(conf,EXP);"):
        return False
    if not run_command("update_metadata(conf,EXP);"):
        return False
    if not run_command("apply_adjustments(conf,EXP);"):
        return False
    if not run_command("apply_tlc(conf,EXP);"):
        return False
    if not run_command("apply_tlc_fr(conf,EXP);"):
        return False
    if not run_command("create_hr2(conf,EXP);"):
        return False
    return True

def process_single_tag(one_smru_name=''):
    load_info_deployment(one_smru_name=one_smru_name)
    if eng.eval("isfield(info_deployment,'invalid_code')") and eng.eval("info_deployment.invalid_code"):
        return False
    if not run_command("create_ncargo(conf,EXP,one_smru_name);"):
        return False
    if not run_command("create_fr0(conf,EXP,one_smru_name);"):
        return False
    if not run_command("update_metadata(conf,EXP,one_smru_name);"):
        return False
    if not run_command("apply_adjustments(conf,EXP,one_smru_name);"):
        return False
    if not run_command("apply_tlc(conf,EXP,one_smru_name);"):
        return False
    if not run_command("apply_tlc_fr(conf,EXP,one_smru_name);"):
        return False
    if not run_command("create_hr2(conf,EXP,one_smru_name);"):
        return False
    return True



# update metadata
def update_metadata(EXP='',one_smru_name=''):

    path_meta = meop.processdir / 'table_meta.csv'
    if not path_meta.exists():
        print(f'Warning: File {path_meta} not found. Metadata not updated.')
        return
    
    df_meta = pd.read_csv(path_meta).set_index('smru_platform_code')

    if one_smru_name in df_meta.index:
        df_meta = df_meta.loc[[one_smru_name],:]
    elif EXP:
        df_meta['EXP'] = df_meta.index
        df_meta['EXP'] = df_meta.EXP.str.split('-').apply(lambda x: x[0])
        df_meta = df_meta.loc[df_meta.EXP == EXP,:]

    modes = ['lr0','lr1','hr0','hr1','fr0','fr1']
    for tag in df_meta.index:

        meta_row = df_meta.loc[tag,:].dropna()

        for qf in modes:

            name_prof = meop.fname_prof(tag,qf=qf)        
            if Path(name_prof).exists():

                with netCDF4.Dataset(name_prof,'a') as f:
                    for col in meta_row.keys():
                        if f.location != meta_row[col]:
                            f.location = meta_row[col]

    return



# # publish meop-ctd data in 
# def create_tag_plots(folder_public):

#     list_profiles, list_tags, list_deployments = meop.read_list_profiles(rebuild=False,verbose=False,public=True,Tdata=False)

#     for COUNTRY in list_tags_public.COUNTRY.unique():
        
#         print(COUNTRY)
#         folder_plots = folder_public / COUNTRY / 'PLOTS'
#         folder_plots.mkdir(parents=True, exist_ok=True)

#         list_profiles_country, list_tags_country, list_deployments_country = meop.filter_country(country, list_profiles, list_tags, list_deployments)
#         for tag in list_tags_country.SMRU_PLATFORM_CODE.unique():
#             print(tag)
#             if meop.fname_prof(tag,qf='hr2').is_file():
#                 with meop.read_ncfile(tag,qf='hr2') as ds:
#                     ds = ds.assign_coords(pressure=("N_LEVELS", ds.PRES[0,:]))
#                     ds['SIG0_ADJUSTED'] = (('N_PROF','N_LEVELS'),gsw.sigma0(ds.PSAL_ADJUSTED,ds.TEMP_ADJUSTED))
#                     depl = meop.EXP_from_SMRU_CODE(tag)
#                     namefig = folder_plots / (tag+'_data_description.png')
#                     if not namefig.exists():
#                         meop.plot_data_tags(ds,namefig=namefig)
#                         plt.close()

                
# Execute in terminal command line
if __name__ == "__main__":

    import argparse
    
    # create parser
    parser = argparse.ArgumentParser()

    # add arguments to the parser
    parser.add_argument("--smru_platform_code", default ='', help = "Process only SMRU PLATFORM CODE. Value of DEPLOYMENT_CODE not considered.")
    parser.add_argument("--deployment_code", default ='', help = "Process all tags in DEPLOYMENT_CODE")
    parser.add_argument("--update_metadata", help = "Update metadata", action='store_true')
    
    # parse the arguments
    args = parser.parse_args()

    smru_platform_code = args.smru_platform_code
    deployment_code = args.deployment_code
    
    start_matlab()
    conf = init_mirounga()
    
    if args.update_metadata:        
        update_metadata(table_meta = table_meta, EXP=deployment_code,one_smru_name=smru_platform_code)
        
    stop_matlab()

        
