#!/bin/bash

function="try, sc_process_new_deployments; catch; end; quit;"
echo $function
filename=log_process_function_$(date +"%Y%m%d_%H%M%S").txt

vncserver :2
matlab -nosplash -nodesktop -logfile $filename -display :2 -r "${function}"

exit;

