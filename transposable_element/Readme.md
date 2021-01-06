## dnaPipeTE
Analysis of transposable elements using dnaPipeTE

## This sbatch script can run dnaPipeTE on the Harvard Cannon cluster


# #!/bin/bash

#SBATCH -J dnapipemoa7                               # Job name
#SBATCH -o dnapipemoa7.%A.out                     # File to which stdout will be written
#SBATCH -n 16
#SBATCH -p edwards
#SBATCH --mem-per-cpu 20000                       # Memory for all cores in Mbytes (--mem-per-cpu for MPI jobs)
#SBATCH --time=0-23:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sedwards@fas.harvard.edu

module load gcc/7.1.0-fasrc01 R/3.5.1-fasrc02
module load python/3.6.3-fasrc02
module load bowtie2/2.3.2-fasrc02
module load jellyfish/2.2.5-fasrc01


python3 /n/home06/sedwards/moa/dnaPipeTE/dnaPipeTE.py -input /n/holylfs/LABS/edwards_lab/sedwards/moa/mapping/mapped/bowtie2_L_aligned.gz -output /n/holylfs/LABS/edwards_lab/sedwar$
