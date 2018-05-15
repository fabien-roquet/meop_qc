%% examples of editing commands

Mqc=remove_tag(info_deployment,'ct14-113-06');
Mqc=remove_profiles(info_deployment,'ct8-Aspasia-05','index',153);
Mqc=remove_profiles(info_deployment,'ct8-Busen-05','date_max',70);
Mqc=remove_profiles(info_deployment,'ct8-Undine-05','Pmax',1100);
Mqc=remove_Sprofiles(info_deployment,'ct8-Soern-05');
Mqc=remove_Sprofiles(info_deployment,'ct8-26626-05','date_max',50);
Mqc=remove_Sprofiles(info_deployment,'ct14-105-06','P-S+',[20 34.35]);

