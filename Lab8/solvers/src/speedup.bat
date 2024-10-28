#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --time=00:01:00
#SBATCH --partition=amilan
#SBATCH --output=cases.out

module purge
module load intel impi
rm  *.plt 
mpicxx solvers.cpp -g -o solvers -std=c++11 -fopenmp

# case 1: baseline
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 24 -nCelly 24 -solver cg > cgSpeed
# case 2
mpirun -n 4 ./solvers -nPEx 2 -nPEy 2 -nCellx 12 -nCelly 12 -solver cg >> cgSpeed
# case 3
mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 8 -nCelly 8 -solver cg >> cgSpeed
rm phi0cg.plt
rm phi1cg.plt
rm phi2cg.plt
rm phi3cg.plt
rm phi4cg.plt
rm phi5cg.plt
rm phi6cg.plt
rm phi7cg.plt
rm phi8cg.plt
cp  phi_0_0.plt phi0cg.plt
cp  phi_1_0.plt phi1cg.plt
cp  phi_2_0.plt phi2cg.plt
cp  phi_3_0.plt phi3cg.plt
cp  phi_4_0.plt phi4cg.plt
cp  phi_5_0.plt phi5cg.plt
cp  phi_6_0.plt phi6cg.plt
cp  phi_7_0.plt phi7cg.plt
cp  phi_8_0.plt phi8cg.plt
# case 4
mpirun -n 16 ./solvers -nPEx 4 -nPEy 4 -nCellx 6 -nCelly 6 -solver cg >> cgSpeed



# ========= jacobi ==========
mpirun -n 9 ./solvers -nPEx 3 -nPEy 3 -nCellx 8 -nCelly 8 -solver jacobi > jacobiSpeed