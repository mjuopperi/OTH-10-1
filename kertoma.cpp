#include "functions.h"
int kertoma(int n){
	if(n!=1){
		return (n * kertoma(n-1));
	}
	else return 1;
}
