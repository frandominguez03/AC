#!/bin/bash
export OMP_DYNAMIC=FALSE

echo "Tamaño 100"
for ((N=1;N<5;N++))
do 
	export OMP_NUM_THREADS=N
 	./pmm-OpenMP 100
done

echo "Tamaño 1500"
for ((N=1;N<5;N++))
do 
	export OMP_NUM_THREADS=N
 	./pmm-OpenMP 1500
done