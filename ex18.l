%{
#include <stdio.h>
#include <stdlib.h>

int macro_count = 0;
int header_count = 0;
%}

%%

"#define"   { macro_count++; }
"#include"  { header_count++; }

.           { /* Ignore all other characters */ }

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

    printf("Number of macros defined: %d\n", macro_count);
    printf("Number of header files included: %d\n", header_count);

    return 0;
}

int yywrap() {
    return 1;
}
