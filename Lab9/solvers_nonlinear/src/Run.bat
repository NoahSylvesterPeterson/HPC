#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=9
#SBATCH --time=00:02:00
#SBATCH --partition=amilan
#SBATCH --output=cases.out

module purge
module load intel impi
ml intel/2022.1.2
ml advisor/2022.0.0

mpicxx solvers.cpp -g -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 1. -tau 5. -r .1 > cg_sa.out