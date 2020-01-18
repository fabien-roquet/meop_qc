#!/bin/bash

screen -L log_file

filename=log_mirounga_diags_$(date +"%Y%m%d_%H%M%S")
vncserver :2
matlab -nosplash -nodesktop -logfile $filename -display :2 -r 'try, mirounga_diags; catch; end; quit;'

