from pathlib import Path
import os
import xarray as xr
import pandas as pd
import numpy as np
import csv
import gsw
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import meop

# list functions

#  get_folder_public_name(config='jupyter_froqu_pc207_linux')
#  publish_meop_ctd(folder_public)


# get the name of folder where to publish in the congs.json file
def get_folder_public_name(config='jupyter_froqu_pc207_linux'):
    return pd.read_json(meop.processdir / 'configs.json').configs[config]['public']
    

# publish meop-ctd data in 
def publish_meop_ctd(folder_public):

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
        
        list_profiles_country, list_tags_country, list_deployments_country = meop.filter_country(country, list_profiles, list_tags, list_deployments)
        for tag in list_tags_country.SMRU_PLATFORM_CODE.unique():
            ncfile_in = meop.fname_prof(tag,qf='hr2')
            ncfile_out = folder_data / ncfile_in.name
            if ncfile_in.exists() and (not ncfile_out.exists()):
                shutil.copyfile(ncfile_in,ncfile_out)
        
    return


# publish meop-ctd data in 
def create_tag_plots(folder_public):

    list_profiles, list_tags, list_deployments = meop.read_list_profiles(rebuild=False,verbose=False,public=True,Tdata=False)

    for COUNTRY in list_tags_public.COUNTRY.unique():
        
        print(COUNTRY)
        folder_plots = folder_public / COUNTRY / 'PLOTS'
        folder_plots.mkdir(parents=True, exist_ok=True)

        list_profiles_country, list_tags_country, list_deployments_country = meop.filter_country(country, list_profiles, list_tags, list_deployments)
        for tag in list_tags_country.SMRU_PLATFORM_CODE.unique():
            print(tag)
            if meop.fname_prof(tag,qf='hr2').is_file():
                with meop.read_ncfile(tag,qf='hr2') as ds:
                    ds = ds.assign_coords(pressure=("N_LEVELS", ds.PRES[0,:]))
                    ds['SIG0_ADJUSTED'] = (('N_PROF','N_LEVELS'),gsw.sigma0(ds.PSAL_ADJUSTED,ds.TEMP_ADJUSTED))
                    depl = meop.EXP_from_SMRU_CODE(tag)
                    namefig = folder_plots / (tag+'_data_description.png')
                    if not namefig.exists():
                        meop.plot_data_tags(ds,namefig=namefig)
                        plt.close()

                
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
            
    if args.publish:
        publish_meop_ctd(folder_public)

    if args.genplots:
        print(2)
        create_tag_plots(folder_public)
        
