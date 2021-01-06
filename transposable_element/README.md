# Analysis of transposable elements using dnaPipeTE

[dnaPipeTE](https://github.com/clemgoub/dnaPipeTE) is a *de novo* repeat finder and annotator. It brings together tools like Trinity, Jellyfish and Repeatmasker, to detect and quantify transposable elements in next-gen sequencing data. The inputs are gzipped fastq files and you can control how many reads or what fraction of the genome you sample. When installed on Cannon it requires several modeles according to the sbatch script below.

		
		#!/bin/bash 
		#SBATCH -J dnapipemoa7b             # Job name
		#SBATCH -o dnapipemoa7b.%A.out     # File to which stdout will be written
		#SBATCH -n 16
		#SBATCH -N 1
		#SBATCH -p edwards
		#SBATCH --mem-per-cpu 2000        # Memory for all cores in Mbytes (--mem-per-cpu for MPI jobs)
		#SBATCH --time=0-12:00:00
		#SBATCH --mail-type=ALL
		#SBATCH --mail-user=sedwards@fas.harvard.edu
		 
		module load gcc/7.1.0-fasrc01 R/3.5.1-fasrc02
		module load python/3.6.3-fasrc02
		module load bowtie2/2.3.2-fasrc02
		module load jellyfish/2.2.5-fasrc01
		 
		 
		python3 dnaPipeTE.py -input /n/holylfs/LABS/edwards_lab/sedwards/moa/mapping/mapped/bowtie2_R_aligned.gz /
		-output /n/holylfs/LABS/edwards_lab/sedwards/moa/moa7b_out -genome_size 1000000000  -genome_coverage 0.2 /
		-sample_number 3 -cpu 16