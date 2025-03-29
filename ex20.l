%{
#include <stdio.h>
#include <stdlib.h>

int line_number = 1;
%}

%%

\n        { printf("%d: %s", line_number++, yytext); }
.|\t      { printf("%s", yytext); }
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

    return 0;
}

int yywrap() {
    return 1;
}
