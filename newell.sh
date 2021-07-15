#!/bin/bash

#SBATCH -A br21_cann484
#SBATCH -J cufhe
#SBATCH -p newell
#SBATCH -t 5
#SBATCH -o newell_out/out.%J.log
#SBATCH -e newell_out/err.%J.log

source /etc/profile.d/modules.sh

module purge
module load cuda/10.2
module load gcc/7.4.0

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/people/cann484/cuFHE/cufhe/bin/

ulimit

echo
echo "loaded modules"
echo
module list > _modules.lis_ 2>&1
cat _modules.lis_
/bin/rm -f _modules.lis_
echo
echo limits
echo
ulimit -a
echo
echo "Environment Variables"
echo
printenv
echo
echo "ldd output"
echo
ldd /people/cann484/cuFHE/cufhe/bin/test_api_gpu
/people/cann484/cuFHE/cufhe/bin/test_api_gpu