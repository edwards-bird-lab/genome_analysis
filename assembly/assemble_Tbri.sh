#!/bin/sh

#SBATCH -p bigmem
#SBATCH -n 60
#SBATCH -N 1
#SBATCH --mem 500000
#SBATCH -t 300:00:00
#SBATCH -J assemble_Tbri
#SBATCH -o assemble_Tbri_%j.out
#SBATCH -e assemble_Tbri_%j.err
#SBATCH --mail-type=ALL

# module load centos6/allpathslg-50081
source new-modules.sh
module load gcc/4.8.2-fasrc01 allpathslg/52488-fasrc01

RunAllPathsLG PRE=/n/regal/edwards_lab/gbravo/Genomes/assemblies/Tbri/ REFERENCE_NAME=Tbri DATA_SUBDIR=data RUN=run20180228 HAPLOIDIFY=TRUE THREADS=60 OVERWRITE=TRUE 1> $Tbri_20180228.log
 
