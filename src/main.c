#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char s1[50] = "Hello";
    char s2[50];
    printf("Length: %d\n", mystrlen(s1));
    mystrcpy(s2, s1);
    printf("Copied: %s\n", s2);
    mystrcat(s1, " World");
    printf("Concatenated: %s\n", s1);

    printf("\n--- Testing File Functions ---\n");
    FILE* f = fopen("test.txt", "r");
    if (f) {
        int l, w, c;
        wordCount(f, &l, &w, &c);
        printf("Lines: %d, Words: %d, Chars: %d\n", l, w, c);
        fclose(f);
    }
    return 0;
}
