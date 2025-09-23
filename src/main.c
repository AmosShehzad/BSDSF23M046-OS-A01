#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main(void) {
    printf("--- Testing String Functions ---\n");

    const char* s = "hello world";
    int len = mystrlen(s);
    printf("mystrlen(\"%s\") = %d\n", s, len);

    char a[100];
    int rc = mystrcpy(a, s);
    printf("mystrcpy: return=%d, dest=\"%s\"\n", rc, a);

    char b[100];
    rc = mystrncpy(b, "short", 8);
    printf("mystrncpy: return=%d, dest=\"%s\"\n", rc, b);

    rc = mystrcat(a, "!!!");
    printf("mystrcat: return=%d, dest=\"%s\"\n", rc, a);

    printf("\n--- Testing File Functions ---\n");
    /* create sample file for testing */
    FILE* f = fopen("sample.txt", "w+");
    if (!f) { perror("fopen"); return 1; }
    fprintf(f, "Hello world\n");
    fprintf(f, "This is a test line\n");
    fprintf(f, "search me\n");
    fprintf(f, "another search me line\n");
    fflush(f);
    rewind(f);

    int lines = 0, words = 0, chars = 0;
    if (wordCount(f, &lines, &words, &chars) == 0) {
        printf("wordCount: lines=%d words=%d chars=%d\n", lines, words, chars);
    } else {
        printf("wordCount failed\n");
    }

    rewind(f);
    char** matches = NULL;
    int mcount = mygrep(f, "search", &matches);
    if (mcount >= 0) {
        printf("mygrep found %d matches:\n", mcount);
        for (int i = 0; i < mcount; ++i) {
            printf("%s", matches[i]); /* matches include newline */
            free(matches[i]);
        }
        free(matches);
    } else {
        printf("mygrep failed\n");
    }

    fclose(f);
    remove("sample.txt");
    return 0;
}

