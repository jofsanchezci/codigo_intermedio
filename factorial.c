#include <stdio.h>

int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int number;
    printf("Ingrese un Numero: ");
    scanf("%d", &number);
    
    if (number >= 0) {
        int result = factorial(number);
        printf("El factorial es %d is %d\n", number, result);
    } else {
        printf("Factorial no esta definido para negativos\n");
    }
    
    return 0;
}
