#!/bin/bash
#SBATCH -n 16                # Number of cores
#SBATCH -t 7-00:00           # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p bigmem            # Partition to submit to
#SBATCH --mem=250G           # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -J flye              # job name
#SBATCH -o flye_cyan_%j.out  # File to which STDOUT will be written, %j inserts jobid
#SBATCH -e flye_cyan_%j.err  # File to which STDERR will be written, %j inserts jobid
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=smorzechowski@g.harvard.edu  # Email to which notifications will be sent
#SBATCH --account=oeb275r

module load python

#I had set up a Conda environment that I installed flye in. Change name as needed
source activate flye

#Replace with path to basecalled reads in FASTQ format
prom_reads="/n/boslfs02/LABS/informatics/sequencing/published/Nanopore/Orzechowski/20201112_1723_2G_PAG06271_bb6b2097/20201112_1723_2G_PAG06271_bb6b2097.pass.fastq.gz"
min_reads="/n/boslfs02/LABS/informatics/sequencing/published/Nanopore/Orzechowski/20201027_SOrzec/SOrzec_Cyan_204-1380-EB-27Aug/20201027_1344_MN27108_FAL43695_8b972900/20201027_1344_MN27108_FAL43695_8b972900.pa$

#--nano-raw: indicates uncorrected Nanopore reads. Options for corrected reads.
#-g: Approximate genome size.
#-o: path where assembly will be output
#--threads: number of threads used for assembly
flye --nano-raw $prom_reads $min_reads -g 1g -o /n/holyscratch01/edwards_lab/smorzechowski/meliphagid/analysis/2020-12-16/cyan_flye --threads 16 --resume
