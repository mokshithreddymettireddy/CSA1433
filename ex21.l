%{
#include <stdio.h>
#include <stdlib.h>

int char_count = 0;
int line_count = 0;
int word_count = 0;
%}

%%

[a-zA-Z0-9]+ { word_count++; char_count += yyleng; }
\n           { line_count++; char_count++; }
.            { char_count++; }

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

    printf("Number of characters: %d\n", char_count);
    printf("Number of lines: %d\n", line_count);
    printf("Number of words: %d\n", word_count);

    return 0;
}

int yywrap() {
    return 1;
}
