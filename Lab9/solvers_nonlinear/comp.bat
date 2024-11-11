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
#SBATCH --ntasks=16
#SBATCH --time=00:05:00
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
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 24 -nCelly 24 -solver cg -nl sa -c0 1. -tau 5. -r .1 > dat.out
cd ..
cp src/phi_sa_cg_0_0.plt comp/orig0.plt
cp src/phi_sa_cg_1_0.plt comp/orig1.plt
cp src/phi_sa_cg_2_0.plt comp/orig2.plt
cp src/phi_sa_cg_3_0.plt comp/orig3.plt

cd src_Modified
rm solvers
mpicxx solvers.cpp -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 20 -nCelly 20 -solver cg -nl sa -c0 1. -tau 5. -r .1 -nTH 4 > dat.out
cd ..
cp src_Modified/phi_sa_cg_0_0.plt comp/Mod0.plt
cp src_Modified/phi_sa_cg_1_0.plt comp/Mod1.plt
cp src_Modified/phi_sa_cg_2_0.plt comp/Mod2.plt
cp src_Modified/phi_sa_cg_3_0.plt comp/Mod3.plt

echo "=="
echo "||"
echo "|| Execution of ert in slurm batch script complete."
echo "||"
echo "=="