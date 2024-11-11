#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=9
#SBATCH --time=00:10:00
#SBATCH --partition=amilan
#SBATCH --output=cases.out

module purge
module load intel impi
ml intel/2022.1.2
ml advisor/2022.0.0

mpicxx solvers.cpp -g -o solvers -std=c++11 -fopenmp -I /curc/sw/install/intel/2022.1.2/advisor/2022.0.0/include -ldl

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 1.0 -tau 1.0 -r 0.5 > cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 2.0 -tau 1.0 -r 0.5 >> cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 5.0 -tau 1.0 -r 0.5 >> cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 1.0 -tau 3.0 -r 0.5 >> cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 2.0 -tau 5.0 -r 0.5 >> cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 1. -tau 1. -r .1 >> cg_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl sa -c0 1.0 -tau 1.0 -r 0.8 >> cg_sa.out

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 1.0 -tau 1.0 -r 0.5 > jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 2.0 -tau 1.0 -r 0.5 >> jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 5.0 -tau 1.0 -r 0.5 >> jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 1.0 -tau 3.0 -r 0.5 >> jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 2.0 -tau 5.0 -r 0.5 >> jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 1. -tau 1. -r .1 >> jacobi_sa.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl sa -c0 1.0 -tau 1.0 -r 0.8 >> jacobi_sa.out

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 1.0 -tau 1.0 -r 0.5 > cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 2.0 -tau 1.0 -r 0.5 >> cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 5.0 -tau 1.0 -r 0.5 >> cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 1.0 -tau 3.0 -r 0.5 >> cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 2.0 -tau 5.0 -r 0.5 >> cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 1. -tau 1. -r .1 >> cg_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver cg -nl nr -c0 1.0 -tau 1.0 -r 0.8 >> cg_nr.out

mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 1.0 -tau 1.0 -r 0.5 > jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 2.0 -tau 1.0 -r 0.5 >> jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 5.0 -tau 1.0 -r 0.5 >> jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 1.0 -tau 3.0 -r 0.5 >> jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 2.0 -tau 5.0 -r 0.5 >> jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 1. -tau 1. -r .1 >> jacobi_nr.out
mpirun -n 1 ./solvers -nPEx 1 -nPEy 1 -nCellx 40 -nCelly 40 -solver jacobi -nl nr -c0 1.0 -tau 1.0 -r 0.8 >> jacobi_nr.out