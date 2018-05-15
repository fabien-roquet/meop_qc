%% load data

%% visualization of TS plots
% conf_wod.woddir=woddir;
% conf_wod.lon=argo_qc.LONGITUDE;
% conf_wod.lat=argo_qc.LATITUDE;
% argo_clim=load_WOD(conf_wod);
% 
% %%
% 
% list_tag=7;
% for kk=list_tag,
%     conf=[];
%     conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; 
%     conf.calib_coeff=getfield(calib_coeff,EXP);
%     conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
%     conf.list_tag=kk;
%     conf.hfig=1;
%     conf.nomfig=sprintf('%s%s/calibration_%02d.png',plotdir,EXP,kk);
%     TS_diags_comparison(conf);
% end
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=[1 9];
% conf.lim=[-62 -60 -50 -45];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_01a.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=[7 11];
% conf.lim=[-70 -68 -85 -80];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07a.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=7;
% conf.lim=[-70.7 -70.5 -95 -94.2];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_%02db.png',plotdir,EXP,conf.list_tag);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=7;
% conf.lim=[-60.2 -59 -60 -54];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07c.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=[11 7];
% conf.lim=[-66 -63 -65 -55];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07d.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=[1 9 10 7];
% conf.lim=[-63 -60 -54 -50];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07e.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=7;
% conf.lim=[-58 -54 -38 -35];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_%02df.png',plotdir,EXP,conf.list_tag);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=[11 7];
% conf.lim=[-70 -68 -80 -74];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07g.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=7;
% conf.lim=[-72 -54 -100 -35];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07h.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% %%
% conf=[]; 
% conf.argo_qc=argo_qc; conf.argo_clim=argo_clim; conf.calib_coeff=getfield(calib_coeff,EXP);
% conf.list_tag=7;
% conf.lim=[-60 -57 -60 -50];
% conf.Tlim=[-2 6]; conf.Slim=[33.5 35];
% conf.nomfig=sprintf('%s%s/calibration_07i.png',plotdir,EXP);
% TS_diags_comparison(conf);
% 
% 





