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
import meop


# list functions

# utils
#  central_longitude(ds)

# plot diags
#  plot_data_tags(ds,namefig=None)
#  plot_map_deployments(list_data,namefig=None)
#  plot_data_deployments(list_ds,namefig=None)
#  plot_map_stereo_south(list_ds,namefig=None)

# functions to show matlab-generated plots
#  show_png(figname='')
#  show_plots_depl(EXP,suffix='_hr2')
#  show_plots_tag(one_smru_name,suffix='_hr2')
#  scroll_descriptive_plots_depl(list_files)
#  scroll_calibration_plots_depl(list_files)


#-----------------------------------     utils   --------------------------------------------#
# compute the value of central_longitude in order to create a map, based on the distribution of longitudes
def central_longitude(ds):
    # ds can be a xarray dataset, a list of ds or a dictionary of ds
    if isinstance(ds, list):
        ds2 = []
        for dsi in ds:
            ds2.append(dsi['LONGITUDE'])
        lon = xr.concat(ds2, dim="N_PROF")
    elif isinstance(ds, dict):
        ds2 = []
        for tag in ds.keys():
            ds2.append(ds[tag]['LONGITUDE'])
        lon = xr.concat(ds2, dim="N_PROF")
    else:
        lon = ds['LONGITUDE']
        
    if (lon.max()-lon.min()>180) & (np.abs(lon)>90).all():
        return 180
    else:
        return 0
        
        

#-----------------------------------  plot diags   --------------------------------------------#
def plot_data_tags(ds,namefig=None):

    from cycler import cycler
    cmap = plt.get_cmap('viridis',ds.dims['N_PROF'])
    custom_cycler = cycler(color=cmap.colors)

    fig = plt.figure(figsize=(12,9))
    gs = fig.add_gridspec(2,3)

    ax={}
    ax['T'] = fig.add_subplot(gs[1, 0])
    ax['S'] = fig.add_subplot(gs[1, 1])
    ax['D'] = fig.add_subplot(gs[1, 2])
    ax['TS'] = fig.add_subplot(gs[0, 2:])
    ax['xy'] = fig.add_subplot(gs[0, :2],projection=ccrs.PlateCarree(central_longitude=central_longitude(ds)))
    for key in ax:
        ax[key].set_prop_cycle(custom_cycler)

    # T profiles
    ds.TEMP_ADJUSTED.plot.line(ax = ax['T'], y='pressure',yincrease=False,hue='N_PROF',add_legend=False,linewidth=.6)
    ax['T'].set_title(f"TEMP: {np.sum((ds.N_TEMP)>0).data} T-profiles")

    # S profiles
    ds.PSAL_ADJUSTED.plot.line(ax = ax['S'], y='pressure',yincrease=False,hue='N_PROF',add_legend=False,linewidth=.6)
    ax['S'].set_title(f"PSAL: {np.sum((ds.N_PSAL)>0).data} S-profiles")

    # sig0 profiles
    ds.SIG0_ADJUSTED.plot.line(ax = ax['D'], y='pressure',yincrease=False,hue='N_PROF',add_legend=False,linewidth=.6)
    ax['D'].set_title(f"SIG0: {np.sum((ds.N_PSAL*ds.N_TEMP)>0).data} TS-profiles")

    # TS-diagram
    for pp in ds.N_PROF:
        ax['TS'].plot(ds.PSAL_ADJUSTED.sel(N_PROF=pp),ds.TEMP_ADJUSTED.sel(N_PROF=pp),linewidth=.6)
    x0,x1 = ax['TS'].get_xlim()
    y0,y1 = ax['TS'].get_ylim()
    X,Y = np.meshgrid(np.linspace(x0,x1),np.linspace(y0,y1))
    D = gsw.sigma0(X,Y)
    ax['TS'].set_aspect((x1-x0)/(y1-y0))
    ax['TS'].contour(X,Y,D,colors='k')

    # map
    h=ds.plot.scatter(ax=ax['xy'],x='LONGITUDE',y='LATITUDE',hue='N_PROF',hue_style='continuous',
                      cmap=cmap,add_guide=False,transform=ccrs.PlateCarree())
    gl = ax['xy'].gridlines(crs=ccrs.PlateCarree(), draw_labels=True,
              linewidth=1, color='gray', alpha=0.5)
    gl.top_labels = False
    gl.right_labels = False
    ax['xy'].stock_img()
    ax['xy'].coastlines()

    # main title
    start_date = ds.JULD.min()
    end_date = ds.JULD.max()
    num_days = (end_date-start_date).dt.days
    ax['xy'].set_title(f"{ds.smru_platform_code}: from {start_date.dt.strftime('%Y-%m-%d').data} to {end_date.dt.strftime('%Y-%m-%d').data} ({num_days.data} days)")

    # finitions
    plt.tight_layout()

    # save figure
    if namefig:
        plt.savefig(namefig,dpi=300)

    return fig, ax

def plot_map_deployments(ds,namefig=None,groupby='SMRU_PLATFORM_CODE',title='',legend=True):

    ds = ds.reset_index()
    list_group = sorted(ds[groupby].unique())
    prop_cycle = plt.rcParams['axes.prop_cycle']
    colors = prop_cycle.by_key()['color']
    dict_cmap = {list_group[i]: colors[i%len(colors)] for i in range(len(list_group))}
    if 'SMRU_PLATFORM_CODE' not in groupby:
        groupby = [groupby,'SMRU_PLATFORM_CODE']
    
    fig = plt.figure(figsize=(10, 10))
    ax = fig.add_subplot(1, 1, 1, projection=ccrs.PlateCarree(central_longitude=central_longitude(ds)))

    grouped = ds.groupby(groupby)
    dict_label = {}
    for name,group in grouped:
        if len(name) == 2:
            name_group = name[0]
        else:
            name_group = name
        if name_group in dict_label:
            label = ''
        else:
            label = name_group
            dict_label[name_group] = 1
        lon = np.where(np.abs(group['LONGITUDE'].diff())>100,np.nan,group['LONGITUDE'])
        lat = group['LATITUDE']
        ax.plot(lon,lat,transform=ccrs.PlateCarree(),color=dict_cmap[name_group],label=label)

    gl = ax.gridlines(crs=ccrs.PlateCarree(), draw_labels=True,
              linewidth=2, color='gray', alpha=0.5, linestyle='--')
    #ax.set_extent([-90, -25, -60, -30], ccrs.PlateCarree())
    ax.stock_img()
    ax.coastlines()
    ax.gridlines(xlocs=ax.get_xticks(),ylocs=ax.get_yticks())
    if legend:
        ax.legend(bbox_to_anchor=(1.05, 1.0), loc='upper left')
    if title:
        ax.set_title(title)

    plt.tight_layout()
    if namefig:
        plt.savefig(namefig,dpi=300,bbox_inches='tight')

    return fig, ax


def plot_map_stereo_south(ds,namefig=None,groupby='SMRU_PLATFORM_CODE',title='',legend=True):

    ds = ds.reset_index()
    list_group = sorted(ds[groupby].unique())
    prop_cycle = plt.rcParams['axes.prop_cycle']
    colors = prop_cycle.by_key()['color']
    dict_cmap = {list_group[i]: colors[i%len(colors)] for i in range(len(list_group))}
    if 'SMRU_PLATFORM_CODE' not in groupby:
        groupby = [groupby,'SMRU_PLATFORM_CODE']
    
    fig = plt.figure(figsize=(10, 10))
    ax = fig.add_subplot(1, 1, 1, projection=ccrs.SouthPolarStereo())

    # Compute a circle in axes coordinates, which we can use as a boundary
    # for the map. We can pan/zoom as much as we like - the boundary will be
    # permanently circular.
    import matplotlib.path as mpath
    theta = np.linspace(0, 2*np.pi, 100)
    center, radius = [0.5, 0.5], 0.5
    verts = np.vstack([np.sin(theta), np.cos(theta)]).T
    circle = mpath.Path(verts * radius + center)
    ax.set_boundary(circle, transform=ax.transAxes)

    grouped = ds.groupby(groupby)
    dict_label = {}
    for name,group in grouped:
        if len(name) == 2:
            name_group = name[0]
        else:
            name_group = name
        if name_group in dict_label:
            label = ''
        else:
            label = name_group
            dict_label[name_group] = 1
        lon = np.where(np.abs(group['LONGITUDE'].diff())>100,np.nan,group['LONGITUDE'])
        lat = group['LATITUDE']
        ax.plot(lon,lat,transform=ccrs.PlateCarree(),color=dict_cmap[name_group],label=label)

    ax.set_extent([-180, 180, -90, -30], ccrs.PlateCarree())
    ax.stock_img()
    ax.coastlines()
    ax.gridlines(xlocs=ax.get_xticks(),ylocs=ax.get_yticks())
    if legend:
        ax.legend(bbox_to_anchor=(1.05, 1.0), loc='upper left')
    if title:
        ax.set_title(title)

    plt.tight_layout()
    if namefig:
        plt.savefig(namefig,dpi=300,bbox_inches='tight')

    return fig, ax

    

def plot_data_deployments(list_ds,namefig=None):
    
    cmap = plt.get_cmap('viridis',len(list_ds))

    fig = plt.figure(figsize=(12,9))
    gs = fig.add_gridspec(2,3)
    
    ax={}
    ax['T'] = fig.add_subplot(gs[1, 0])
    ax['S'] = fig.add_subplot(gs[1, 1])
    ax['D'] = fig.add_subplot(gs[1, 2])
    ax['TS'] = fig.add_subplot(gs[0, 2:])
    ax['xy'] = fig.add_subplot(gs[0, :2],projection=ccrs.PlateCarree(central_longitude=central_longitude(list_ds)))
    for key in ax:
        ax[key].set_prop_cycle(custom_cycler)

    for kk,tag in enumerate(list_ds.keys()):

        ds = list_ds[tag]
        ds.TEMP_ADJUSTED.plot.line(ax = ax['T'], y='pressure',hue='N_PROF',color=cmap.colors[kk],yincrease=False,add_legend=False,linewidth=.6)
        ds.PSAL_ADJUSTED.plot.line(ax = ax['S'], y='pressure',hue='N_PROF',color=cmap.colors[kk],yincrease=False,add_legend=False,linewidth=.6)
        ds.SIG0_ADJUSTED.plot.line(ax = ax['D'], y='pressure',hue='N_PROF',color=cmap.colors[kk],yincrease=False,add_legend=False,linewidth=.6)
        for pp in ds.N_PROF:
            ax['TS'].plot(ds.PSAL_ADJUSTED.sel(N_PROF=pp),ds.TEMP_ADJUSTED.sel(N_PROF=pp),color=cmap.colors[kk],linewidth=.6)

        # map
        h=ds.plot.scatter(ax=ax['xy'],x='LONGITUDE',y='LATITUDE',
                          color=cmap.colors[kk],add_guide=False,transform=ccrs.PlateCarree())


    ds = list_ds[next(iter(list_ds))]
    ax['T'].set_title(f"TEMP: {np.sum((ds.N_TEMP)>0).data} T-profiles")
    ax['S'].set_title(f"PSAL: {np.sum((ds.N_PSAL)>0).data} S-profiles")
    ax['D'].set_title(f"SIG0: {np.sum((ds.N_PSAL*ds.N_TEMP)>0).data} TS-profiles")

    x0,x1 = ax['TS'].get_xlim()
    y0,y1 = ax['TS'].get_ylim()
    ax['TS'].set_aspect((x1-x0)/(y1-y0))
    X,Y = np.meshgrid(np.linspace(x0,x1),np.linspace(y0,y1))
    D = gsw.sigma0(X,Y)
    ax['TS'].contour(X,Y,D,colors='k')

    gl = ax['xy'].gridlines(crs=ccrs.PlateCarree(), draw_labels=True,
          linewidth=1, color='gray', alpha=0.5)
    gl.top_labels = False
    gl.right_labels = False
    ax['xy'].stock_img()
    ax['xy'].coastlines()

    # main title
    start_date = ds.JULD.min()
    end_date = ds.JULD.max()
    num_days = (end_date-start_date).dt.days
    ax['xy'].set_title(f"{ds.smru_platform_code}: from {start_date.dt.strftime('%Y-%m-%d').data} to {end_date.dt.strftime('%Y-%m-%d').data} ({num_days.data} days)")

    # finitions
    plt.tight_layout()

    # save figure
    if namefig:
        plt.savefig(namefig,dpi=300)
    
    return fig, ax




#--------------------------------------------------------------------------------------------#
# functions to show matlab-generated plots
from IPython.display import display,Image
from ipywidgets import interact, interactive, fixed, interact_manual
import ipywidgets as widgets
from ipywidgets import HBox

# display a single png figure
def show_png(figname=''):
    figname = Path(figname)
    if figname.exists():
        image = widgets.widgets.Image(value=open(figname, 'rb').read())
        display(HBox([image]))
    else:
        print('File not found:',str(figname))
     
    
# display overview plots for a deployment
def show_plots_depl(EXP,suffix='_hr2'):
    mode = ['_recapARGO','_histoARGO']
    figname_mode0 = Path(meop.processdir,'plots',EXP,EXP+suffix+'_recapARGO_adj.png')
    figname_mode1 = Path(str(figname_mode0).replace(mode[0], mode[1]))
    if figname_mode0.exists() and figname_mode1.exists():
        imageA = widgets.widgets.Image(value=open(figname_mode0, 'rb').read())
        imageB = widgets.widgets.Image(value=open(figname_mode1, 'rb').read())
        display(HBox([imageA, imageB]))
    return


# display overview plots for a tag
def show_plots_tag(one_smru_name,suffix='_hr2'):
    mode = ['_diags_TS','_transect']
    EXP = meop.EXP_from_SMRU_CODE(one_smru_name)
    figname_mode0 = Path(meop.processdir,'plots',EXP,one_smru_name+suffix+'_diags_TS_adj.png')
    figname_mode1 = Path(str(figname_mode0).replace(mode[0], mode[1]))
    if figname_mode0.exists() and figname_mode1.exists():
        imageA = widgets.widgets.Image(value=open(figname_mode0, 'rb').read())
        imageB = widgets.widgets.Image(value=open(figname_mode1, 'rb').read())
        display(HBox([imageA, imageB]))
    return


# show presentation plots for a list of tag from a given deployment
def scroll_descriptive_plots_depl(list_files):

    a = widgets.BoundedIntText(
        value=0,
        min=0,
        max=len(list_files)-1,
        step=1,
        description='Figure:',
        disabled=False
    )

    b = widgets.Dropdown(
        options=[(s.stem,i) for i,s in enumerate(list_files)],
        value=0,
        description='file:',
        disabled=False
    )

    mylink = widgets.link((a, 'value'), (b, 'value'))
    mode = ['_diags_TS','_transect']

    @interact(k=a,k1=b)
    def g(k,k1):
        figname_mode0 = list_files[k]
        figname_mode1 = Path(str(figname_mode0).replace(mode[0], mode[1]))
        if figname_mode0.exists() and figname_mode1.exists():
            imageA = widgets.widgets.Image(value=open(figname_mode0, 'rb').read())
            imageB = widgets.widgets.Image(value=open(figname_mode1, 'rb').read())
            display(HBox([imageA, imageB]))
        return

    
# show calibration plots for a list of tag from a given deployment
def scroll_calibration_plots_depl(list_files):

    a = widgets.BoundedIntText(
        value=0,
        min=0,
        max=len(list_files)-1,
        step=1,
        description='Figure:',
        disabled=False
    )

    b = widgets.Dropdown(
        options=[(str(s.stem).split('_')[1],i) for i,s in enumerate(list_files)],
        value=0,
        description='file:',
        disabled=False
    )

    mylink = widgets.link((a, 'value'), (b, 'value'))
    mode = ['_0','_other_tags']

    @interact(k=a,k1=b)
    def g(k,k1):
        figname_mode0 = list_files[k]
        figname_mode1 = Path(str(figname_mode0).replace(mode[0], mode[1]))
        imageA,imageB=[],[]
        if figname_mode0.exists():
            imageA = widgets.widgets.Image(value=open(figname_mode0, 'rb').read())
            if figname_mode1.exists():
                imageB = widgets.widgets.Image(value=open(figname_mode1, 'rb').read())
                display(HBox([imageA, imageB]))
            else:
                display(HBox([imageA, imageA]))
        return
    
   

