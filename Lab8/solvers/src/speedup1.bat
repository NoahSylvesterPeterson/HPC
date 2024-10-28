#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=9
#SBATCH --time=00:01:00
#SBATCH --partition=amilan
#SBATCH --output=cases.out

module purge
module load intel impi
rm  *.plt 
rm solvers
mpicxx solvers.cpp -g -o solvers -std=c++11 -fopenmp

mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 10 -nCelly 10 -solver cg > cgSpeed