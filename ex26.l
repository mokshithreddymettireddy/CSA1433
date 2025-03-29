%{
#include <stdio.h>
%}

%%
^[6-9][0-9]{9}$ { printf("Valid mobile number: %s\n", yytext); }
^[0-9]+$        { printf("Invalid mobile number: %s (should be 10 digits and start with 6-9)\n", yytext); }
.|\n            { /* Ignore any other characters */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }

    yylex();  // Start the lexical analysis

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}

int yywrap() {
    return 1;
}