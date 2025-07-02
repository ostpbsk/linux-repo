#include "headerfile.h"
#include <stdio.h>

int foo1() {
    int recievedval = CONSTANT;
    printf("file 1 has been compiled, the constant value is: %d", recievedval);
    return recievedval;
}