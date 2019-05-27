#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main(int argc,char **argv) {
   unsigned int N,i,j;
   double k = 33;

   struct timespec cgt1,cgt2;
   double ncgt; //para tiempo de ejecución

   if (argc<2) {
      printf("Faltan no componentes del vector\n");
      exit(-1);
   }
   N=atoi(argv[1]);
   double *A,*B,*C;

   A=(double *) malloc(N*sizeof(double));
   B=(double *) malloc(N*sizeof(double));
   C=(double *) malloc(N*sizeof(double));

   for(i=0; i<N; i++) {
      B[i]=2;
      C[i]=3;
   }

   clock_gettime(CLOCK_REALTIME,&cgt1);

   for (i=0; i<N; i++){
      A[i]= k*B[i] + C[i];
   }

   clock_gettime(CLOCK_REALTIME,&cgt2);
   ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+ (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

   //Imprimir resultado de la suma y el tiempo de ejecución
   printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
   printf("A[0] = %f // A[N-1] = %f.\n",A[0],A[N-1]);

   free(B);
   free(C);
   free(A);
}
