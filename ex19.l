%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

"<"[^>]+">"  { printf("%s\n", yytext); }

.            { /* Ignore all other characters */ }

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
