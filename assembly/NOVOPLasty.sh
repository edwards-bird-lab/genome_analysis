#!/bin/sh
 
#SBATCH -p edwards
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 00-04:00:00
#SBATCH -J NOVOPlasty
#SBATCH -o NOVOPlasty_%j.out
#SBATCH -e NOVOPlasty_%j.err
#SBATCH --mail-type=ALL        # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=schmitt@fas.harvard.edu # Email to which notifications will be sent

module load GCCcore/8.2.0 Perl/5.28.0
perl NOVOPlasty-master/NOVOPlasty4.2.1.pl -c config.txt