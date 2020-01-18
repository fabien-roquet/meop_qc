#!/bin/bash

matlab -nosplash -nodesktop -r "try, mirounga_diags('global_diagnostics'); catch; end; quit;"
