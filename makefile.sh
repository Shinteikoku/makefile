#!/bin/sh

if [ "$#" -ge 1 ]; then
    echo "#include \"$1.h\"">"$1.c"
    if [ "$#" -eq 1 ] || [ "$2" != "-h" ]; then
        echo "#ifndef ${1^^}_H
#define ${1^^}_H


#endif /* !${1^^}_H */">"$1.h"
    fi
    echo "#include <assert.h>
#include <stdio.h>

#include \"$1.h\"

int main(void)
{

    return 0;
}">"main.c"

    echo "CC=gcc
CFLAGS= -Wextra -Werror -Wall -pedantic -std=c99 -g -fsanitize=address
LDFLQGS = -fsanitize=address
LDLIBS =

all: $1

$1: $1.o main.o

clean:
	\${RM} *.o
	\${RM} *.d
	\${RM} $1">"Makefile"
fi
