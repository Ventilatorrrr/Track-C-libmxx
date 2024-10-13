#include "../inc/libmx.h"

char *mx_strnew(const int size) {
    if (size < 0) {
        return NULL;
    }

    char *c = (char *)malloc(size + 1); // +1 для '\0'
    if (c == NULL) {
        return NULL;
    }

    for (int i = 0; i <= size; i++) {
        c[i] = '\0'; 
    }

    return c;
}

