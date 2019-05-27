#include <stdlib.h>
#include <stdio.h>
#include <time.h>

struct {
	int a;
	int b;
} s[5000];

int main(int argc, char** argv) {
	int i, ii, X1, X2;
	int R[40000];
	struct timespec cgt1, cgt2;
    double tiempo;

    for(i=0; i<5000;i+=4)  {
		s[i].a = i;
		s[i+1].a = i+1;
		s[i+2].a = i+2;
		s[i+3].a = i+3;
		s[i].b = i;
		s[i+1].b = i+1;
		s[i+2].b = i+2;
		s[i+3].b = i+3;
    }

	clock_gettime(CLOCK_REALTIME, &cgt1);

	for (ii=0; ii<40000;ii++) {

		X1=0; X2=0;

		for(i=0; i<5000;i++){
			X1+=2*s[i].a+ii;
		}
		for(i=0; i<5000;i++){
			X2+=3*s[i].b-ii;
		}

		if (X1<X2)
			R[ii]=X1;
		else
			R[ii]=X2;
	}

	clock_gettime(CLOCK_REALTIME, &cgt2);
	tiempo = (double) (cgt2.tv_sec - cgt1.tv_sec)+ (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));
	printf("a: %i - b: %i", R[5000], s[4999].a);
	printf(" Tiempo(seg.): %11.9f\n", tiempo);
}
