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

# read ncfiles
#  read_ncfile(smru_name,depl='',qf='hr1')
#  read_list_data_in_MEOP(filename_pkl='list_meop.pkl')
#  read_list_deployment(filename_list='list_deployment.csv')

        


#-----------------------------------   read nc   --------------------------------------------#
# read a netCDF ARGO file and return a xarray dataset structure
def read_ncfile(smru_name,depl='',qf='hr1'):
    
    pathfile = meop.fname_prof(smru_name,depl,qf='hr1')
    if pathfile.is_file():
        ds = xr.open_dataset(pathfile)
        for dim in ds.dims:
            ds[dim] = ((dim), ds[dim])
            ds.set_coords([dim])
        ds['N_TEMP'] = (('N_PROF'),meop.N_PARAM(ds,'TEMP'))
        ds['N_PSAL'] = (('N_PROF'),meop.N_PARAM(ds,'PSAL'))
        if 'N_CHLA' in ds.variables:
            ds['N_CHLA'] = (('N_PROF'),meop.N_PARAM(ds,'CHLA'))
        if 'N_DOXY' in ds.variables:
            ds['N_DOXY'] = (('N_PROF'),meop.N_PARAM(ds,'DOXY'))
    else:
        print('No file: ',pathfile)
        return None
    return ds
    
    
