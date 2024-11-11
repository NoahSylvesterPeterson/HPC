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
#SBATCH --time=00:59:00
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
echo "src"
cd src
rm solvers
mpicxx solvers.cpp -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 96 -nCelly 96 -solver cg -nl sa -c0 1. -tau 5. -r .1 > dat.out
cp dat.out ../SUP/orig1.out
echo "src1"
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 48 -nCelly 48 -solver cg -nl sa -c0 1. -tau 5. -r .1 > dat.out
cp dat.out ../SUP/orig4.out
echo "src4"
mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 32 -nCelly 32 -solver cg -nl sa -c0 1. -tau 5. -r .1 > dat.out
cp dat.out ../SUP/orig9.out
echo "src9"
cd ..


cd src_Modified
echo "mod"
rm solvers
mpicxx solvers.cpp -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 96 -nCelly 96 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 4 > dat.out
cp dat.out ../SUP/Mod1.out
echo "mod1"
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 48 -nCelly 48 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 4 > dat.out
cp dat.out ../SUP/Mod4.out
echo "mod4"
mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 32 -nCelly 32 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 4 > dat.out
cp dat.out ../SUP/Mod9.out
echo "mod9"
cd ..


echo "=="
echo "||"
echo "|| Execution of ert in slurm batch script complete."
echo "||"
echo "=="