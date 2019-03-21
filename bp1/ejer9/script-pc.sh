#!/bin/bash

echo "Ejecutando tiempo secuencial"
for ((N=16384;N<67108865;N=N*2))
do 
	/home/d3vcho/Escritorio/Uni/AC/bp1/ejer6/SumaVectores $N
done

echo "Ejecutando tiempo paralelo (for)"
for ((N=16384;N<67108865;N=N*2))
do 
	/home/d3vcho/Escritorio/Uni/AC/bp1/ejer7/SumaVectoresC-OMP $N
done

echo "Ejecutando tiempo paralelo (sections)"
for ((N=16384;N<67108865;N=N*2))
do 
	/home/d3vcho/Escritorio/Uni/AC/bp1/ejer8/SumaVectoresC-OMP2 $N
done