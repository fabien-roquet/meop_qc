#! /usr/bin/env python
# -*- coding: utf-8 -*-

__doc__='''
Classes (Object Oriented) to load netCDF files, using the
library *netCDF4* (http://unidata.github.io/netcdf4-python/).

Mainly loads the day of measurement, Temperature, Salinity,
and Pressure.

First creation: July 7, 2016
'''

import numpy as np
from os.path import isfile
from netCDF4 import Dataset

__author__="Romain Caneill"
__email__="romain.caneill@ens-lyon.fr"

class ARGO_load(object):
    '''
    Open oceanographic netCDF files from MEOP.
    
    Example
    -------
        ex@example ~ $cd Data
        ex@example ~/Data $ipython
        [In] 1: import ARGO_tools as o
        [In] 2: sealData = o.ARGO_load('ct84-744-12_prof.nc')
        *ct84-744-12_prof.nc* has been successfully loaded
        [In] 3: print sealData.PSAL_ADJUSTED
        [[...]]
        [In] 4: print sealData.attributes['citation']
    '''
    def __init__(self, fileName, raw = False):
        '''Initialisation
        
        Arguments
        ---------
            fileName : str
                name of the file, with the path
            raw : bool
                if *False*, remove data with bad flags
                (fill with NaN)
                if *True*, load all data without taking flags
                into account
        Vars
        ----
            self.attributes : dict
                Contains the metadata of the netCDF file
            self.LATITUDE : 1D numpy.ndarray
                Latitudes
            self.LONGITUDE : 1D numpy.ndarray
                Longitudes
            self.TEMP_ADJUSTED : 2D numpy.ndarray
                Temperature
            self.PSAL_ADJUSTED : 2D numpy.ndarray
                Practical Salinity
            self.PRES_ADJUSTED : 2D numpy.ndarray
                Pressure
            self.JULD_LOCATION : 1D numpy.ndarray
                Time (Julian Days)
            self.TEMP_QC : 2D numpy.ndarray
                Flags for temperature, 1 = good, other = bad
            self.PSAL_QC : 2D numpy.ndarray
                Flags for practical salinity, 1 = good, other = bad
        '''
        self.fileName = fileName
        if not isfile(fileName):
            raise IOError('No file named '+fileName+'founded')
        # Load the data
        self.load(raw)
        print '*{}* has been successfully loaded'.format(self.fileName)

    def load(self, raw = True):
        '''
        Loads *fileName* file.
        
        Arguments
        ---------
            fileName : string
                File name without the extension
            raw : bool
                if *False*, remove data with bad flags
                if *True*, load all data without taking flags into account
        '''
        # Load data
        oceanoData = Dataset(self.fileName)
        # Load attributes
        self.attributes = {x: oceanoData.getncattr(x) for x in oceanoData.ncattrs()}
        # Put the selected data in variables
        lats  = oceanoData.variables['LATITUDE'][:]
        lons  = oceanoData.variables['LONGITUDE'][:]
        temp = oceanoData.variables['TEMP_ADJUSTED'][:]
        psal = oceanoData.variables['PSAL_ADJUSTED'][:]
        pres = oceanoData.variables['PRES_ADJUSTED'][:]
        time = oceanoData.variables['JULD_LOCATION'][:]
        self.TEMP_QC = np.array(oceanoData.variables['TEMP_QC'][:], \
                            dtype=int)
        self.PSAL_QC = np.array(oceanoData.variables['PSAL_QC'][:], \
                            dtype=int)
        # Some data have a masked array; we take only the data
        oceano = [lats,lons,temp,psal,pres,time]
        for i in range(len(oceano)):
            if str(type(oceano[i])) == "<class 'numpy.ma.core.MaskedArray'>":
                oceano[i] = oceano[i].data
        if not raw:
            # Take the flags in account
            oceano[2] = rmFlags(oceano[2], self.TEMP_QC) # temp
            oceano[3] = rmFlags(oceano[3], self.PSAL_QC) # psal
        # Remove the number 99999 which are replaced by NaN
        for ii in (2,3,4):
            oceano[ii][oceano[ii] == 99999] = np.nan
        self.LATITUDE = oceano[0]
        self.LONGITUDE = oceano[1]
        self.TEMP_ADJUSTED = oceano[2]
        self.PSAL_ADJUSTED = oceano[3]
        self.PRES_ADJUSTED = oceano[4]
        self.JULD_LOCATION = oceano[5]
        
def rmFlags(tab, flags):
    '''
    Remove the data which have a bad flag (!=1) and replace them with
    np.nan
    '''
    (n,m) = tab.shape
    if (n,m) != flags.shape:
        # Don't compute flags
        return tab
    tab[flags != 1] = np.nan
    # Replaces with NaN values that have bad flags
    return tab
