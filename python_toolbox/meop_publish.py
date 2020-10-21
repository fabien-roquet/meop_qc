from pathlib import Path
import os
import shutil
import xarray as xr
import pandas as pd
import numpy as np
import csv
import gsw
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
from importlib import reload
import meop
import meop_plot_data

# list functions

#  get_folder_public_name(config='jupyter_froqu_pc207_linux')
#  create_ncfile_all(smru_name,folder_out)
#  create_tag_plots(fname,folder_out,prefix_name)
#  publish_meop_ctd(folder_public, publish=True, genplots=True)




# get the name of folder where to publish in the congs.json file
def get_folder_public_name(config='jupyter_froqu_pc207_linux'):
    path = pd.read_json(meop.processdir / 'configs.json').configs[config]['public']
    folder = pd.read_json(meop.processdir / 'configs.json').version.CTDnew
    return Path(path) / folder
    

# create a netcdf file combining data on original levels and interp data
def create_ncfile_all(smru_name,folder_out):
    
    # copy lr1 in all
    ncfile_in = meop.fname_prof(smru_name,qf='lr1')
    ncfile_out = folder_out / meop.fname_prof(smru_name,qf='all').name

    if ncfile_in.is_file():
        
        shutil.copyfile(ncfile_in,ncfile_out)

        # copy ADJUSTED values in hr1 in INTERP variables
        ncfile_add = meop.fname_prof(smru_name,qf='hr1')
        meop.copy_netcdf_variable(ncfile_add,'PRES_ADJUSTED',('N_PROF', 'N_LEVELS'),\
                                  ncfile_out,'PRES_INTERP',('N_PROF', 'N_INTERP'))
        meop.copy_netcdf_variable(ncfile_add,'TEMP_ADJUSTED',('N_PROF', 'N_LEVELS'),\
                                  ncfile_out,'TEMP_INTERP',('N_PROF', 'N_INTERP'))
        meop.copy_netcdf_variable(ncfile_add,'PSAL_ADJUSTED',('N_PROF', 'N_LEVELS'),\
                                  ncfile_out,'PSAL_INTERP',('N_PROF', 'N_INTERP'))
    
    return ncfile_out


# publish meop-ctd data in 
def create_tag_plots(fname,folder_out,prefix_name,var_suffix):

    with meop.read_ncfile(fname) as ds:
        namefig = folder_out / (prefix_name+'_data_description.png')
        if not namefig.exists():
            meop_plot_data.plot_data_tags(ds,namefig=namefig,var_suffix=var_suffix)
            plt.close()

    return


# publish meop-ctd data in 
def publish_meop_ctd(folder_public, publish=True, genplots=True):

    folder_public = Path(folder_public)
    folder_public.mkdir(parents=True, exist_ok=True)
    if len(os.listdir(folder_public)):
        print(f'Warning: the public directory where to store public data {folder_public} is not empty. Risk of data corruption.')
    
    list_profiles, list_tags, list_deployments = meop.read_list_profiles(rebuild=False,verbose=False,public=True,Tdata=False)

    for COUNTRY in list_deployments.COUNTRY.unique():
        
        print(COUNTRY)
        folder_country = folder_public / COUNTRY
        folder_country.mkdir(parents=True, exist_ok=True)
        folder_data = folder_country / 'DATA'
        folder_data.mkdir(parents=True, exist_ok=True)
        folder_plots = folder_public / COUNTRY / 'PLOTS'
        folder_plots.mkdir(parents=True, exist_ok=True)
        
        list_profiles_country, list_tags_country, list_deployments_country = \
            meop.filter_country(COUNTRY, list_profiles, list_tags, list_deployments)
        
        for tag in list_tags_country.SMRU_PLATFORM_CODE.unique():
            
            
            # copy ncfile: 'fr1 'if exists, otherwise 'all' with both low res and interp data
            is_done = (folder_data / meop.fname_prof(tag,qf='fr1').name).is_file() or \
                (folder_data / meop.fname_prof(tag,qf='all').name).is_file()
            if not is_done:
                print(tag)
                fname = meop.fname_prof(tag,qf='fr1')
                if fname.exists():
                    shutil.copyfile(fname,folder_data / fname.name)
                else:
                    fname = create_ncfile_all(tag,folder_data)
            
            # create a plot for the tag
            namefig = folder_plots / (tag+'_data_description.png')
            if not namefig.is_file():
                # figure based on fr1 if possible. Otherwise based on adjusted profiles
                fname = folder_data / meop.fname_prof(tag,qf='fr1').name
                if fname.is_file():
                    create_tag_plots(fname,folder_plots,tag,'_ADJUSTED')
                else:
                    fname = folder_data / meop.fname_prof(tag,qf='all').name
                    if fname.is_file():
                        create_tag_plots(fname,folder_plots,tag,'_INTERP')
        
    return



# Execute in terminal command line
if __name__ == "__main__":

    import argparse
    
    # create parser
    parser = argparse.ArgumentParser()

    # add arguments to the parser
    parser.add_argument("--path_public", help = "Provide path to public folder")
    parser.add_argument("--config_name", help = "Provide config name (see configs.json for a list). Not used if PATH_PUBLIC is provided.")
    parser.add_argument("--publish", help = "Publish data", action='store_true')
    parser.add_argument("--genplots", help = "Generate plots", action='store_true')
    
    # parse the arguments
    args = parser.parse_args()

    if args.path_public:
        folder_public = args.path_public
    else:
        if args.config_name:
            folder_public = get_folder_public_name(args.config_name)
        else:
            folder_public = get_folder_public_name()
            
    publish_meop_ctd(folder_public, publish=args.publish, genplots=args.genplots)
        
