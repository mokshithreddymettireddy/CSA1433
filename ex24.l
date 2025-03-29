%{
#include <stdio.h>
#include <stdlib.h>

int valid_email = 0;
%}

%%

[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4} { valid_email = 1; }

.|\n    { /* Ignore all other characters */ }

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            return 1;
        }
        yyin = file;
    } else {
        yyin = stdin;
    }

    yylex();

    if (valid_email) {
        printf("Valid email address found.\n");
    } else {
        printf("No valid email address found.\n");
    }

    return 0;
}

int yywrap() {
    return 1;
}
