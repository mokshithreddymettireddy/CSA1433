%{
#include <stdio.h>
#include <stdlib.h>

int comment_count = 0;
FILE *output_file;
%}

%%

\/\/.*                { comment_count++; /* Ignore single-line comments */ }
\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\/  { comment_count++; /* Ignore multi-line comments */ }
.|\n                  { fprintf(output_file, "%s", yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <input_file.c> <output_file.c>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror(argv[1]);
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (!output_file) {
        perror(argv[2]);
        fclose(input_file);
        return 1;
    }

    yyin = input_file;

    yylex();

    fclose(input_file);
    fclose(output_file);

    printf("Number of comment lines: %d\n", comment_count);

    return 0;
}

int yywrap() {
    return 1;
}
