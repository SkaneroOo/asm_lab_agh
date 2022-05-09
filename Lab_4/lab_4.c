#include <stdio.h>

void make_string(int num, char* out_str);

int main() {
    char out_str[] = "     ";
    int vector[] = {1, 4, 6, 232, 0, 434, 2, 6, 2, 5};
    for (int i = 0; i < 10; i++) {
        make_string(vector[i], out_str);
        printf("%s\n", out_str);
    }
}

void make_string(int num, char* out_str) {
    int i = 0;
    while (out_str[i] != 0) {
        out_str[i++] = ' ';
    }
    do {
        out_str[--i] = num%10+'0';
        num /= 10;
    } while (num);
}