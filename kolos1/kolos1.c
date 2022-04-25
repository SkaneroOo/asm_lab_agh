#include <stdio.h>

int main() {
    int tab[15] = {6, 4, -3, 3, -5, 9, 7, 1, -2, 8, -3, 5, 9, -1, 2};
    int sum = 0;
    int negcnt = 0;
    int number = 410066;
    for (int i = 0; i < 15; i++) {
        sum += tab[i];
        if (tab[i] < 0) {
            negcnt++;
        }
    }
    printf("Suma = %d,  elementow <0 = %d\n", sum, negcnt);
    printf("Krzysztof Majerczyk-Marchewka nr %d\n", number);
}