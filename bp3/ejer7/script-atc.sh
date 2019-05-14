#!/bin/bash
export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=12
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N pmtv-OpenMP
#Se asigna al trabajo la cola ac
#PBS -q ac   
#Se imprime información del trabajo usando variables de entorno de PBS

echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:" 
cat $PBS_NODEFILE

# FIN del trozo que deben incluir todos los scripts

export OMP_SCHEDULE="static"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="static, 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="static, 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="dynamic, 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="dynamic, 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="guided, 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360
export OMP_SCHEDULE="guided, 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

