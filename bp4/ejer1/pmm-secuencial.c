#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char **argv)  {
   int i, j, k;
   double t1, total;

   if(argc < 2){
      fprintf(stderr,"Falta tamaño de la matriz (debe de ser cuadrada)\n");
      exit(-1);
    }

    // Tamaño de la matriz pasado por parámetro
    unsigned int tam = atoi(argv[1]);

    if(tam < 2){
    	fprintf(stderr, "El tamaño no puede ser menor a 2");
    	exit(-1);
    }

    // Declaramos con memoria dinámica
    double **m1, **m2, **m3;

    m1 = (double**) malloc(tam*sizeof(double*));
    m2 = (double**) malloc(tam*sizeof(double*));
    m3 = (double**) malloc(tam*sizeof(double*));


    // Reservamos memoria ahora para las componentes de las matrices
    for(i=0; i<tam; i++){
    	m1[i] = (double*) malloc(tam*sizeof(double));
        m2[i] = (double*) malloc(tam*sizeof(double));
        m3[i] = (double*) malloc(tam*sizeof(double));
    }

    // Inicializamos la matriz y los vectores
    for(i=0; i<tam; i++){
    	for(j=0; j<tam; j++){
            m1[i][j] = 0;
            m2[i][j] = 2;
            m3[i][j] = 2;
    	}
    }

    // Inicializamos la primera variable de tiempo
    t1 = omp_get_wtime();

    // Calculamos el producto m1 = m2*m3
    for(i=0; i<tam; i++){
    	for(j=0; j<tam; j++){
            for(k=0; k<tam; k++){
                m1[i][j] += (m2[i][k]*m3[k][j]);
            }
    	}
    }

    // Obtenemos el tiempo total transcurrido
    total = omp_get_wtime() - t1;

    // Para tamaños pequeños (hasta tam=11), imprimimos todas las componentes del vector resultante
    // y el tiempo de ejecución
    if(tam <= 11){
    	printf("Tamaño matriz: %i\n Tiempo de ejecución: %f\n", tam, total);

    	for(i=0; i<tam; i++){
            for(j=0; j<tam; j++){
                printf("m1[%i][%i] = %f\n", i, j, m1[i][j]);
            }
    	}
    }

    // Para tamaños superiores, imprimimos el tiempo de ejecución y la primera y última componente del vector
    else{
    	printf("Tamaño vectores: %i\n Tiempo de ejecución: %f\n Primera componente: %f\n Última componente: %f\n",
        tam, total, m1[0][0], m1[tam-1][tam-1]);
    }

    // Liberamos memoria
    for(i=0; i<tam; i++){
    	free(m1[i]);
        free(m2[i]);
        free(m3[i]);
    }

    free(m1);
    free(m2);
    free(m3);

    return 0;
}

