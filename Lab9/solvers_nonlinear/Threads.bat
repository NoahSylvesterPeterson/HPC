#!/bin/bash

# -
# |
# | This is a batch script for running a MPI parallel job on Alpine
# |
# | (o) To submit this job, enter:  sbatch slurm.bat 
# | (o) To check the status of this job, enter: squeue -u <username>
# |
# -

# -
# |
# | Part 1: Directives
# |
# -

#SBATCH --nodes=1
#SBATCH --ntasks=36
#SBATCH --time=00:30:00
#SBATCH --partition=amilan
#SBATCH --output=slurm.out

# -
# |
# | Part 2: Loading software
# |
# -

module purge
module load intel
module load impi
module load python
ml advisor

# -
# |
# | Part 3: User scripting
# |
# -

echo "=="
echo "||"
echo "|| Begin Execution of ert in slurm batch script."
echo "||"
echo "=="


cd src_Modified
rm solvers
mpicxx solvers.cpp -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 96 -nCelly 96 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 36 > dat.out
cp dat.out ../Trds/Mod1.out
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 48 -nCelly 48 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 9 > dat.out
cp dat.out ../Trds/Mod4.out
mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 36 -nCelly 36 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 1 > dat.out
cp dat.out ../Trds/Mod9.out
cd ..


echo "=="
echo "||"
echo "|| Execution of ert in slurm batch script complete."
echo "||"
echo "=="