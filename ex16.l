%{
    #include <stdio.h>
    int char_count = 0, line_count = 0, word_count = 0;
%}

%%
[ \t]+              ;  /* Ignore spaces and tabs */
\n                 { line_count++; char_count++; }
\/\*([^*]|\*+[^/])*\*\/  ;  /* Ignore block comments */
\/\/.*              ;  /* Ignore single-line comments */
[A-Za-z_][A-Za-z0-9_]*  { word_count++; char_count += yyleng; } /* Count words */
[0-9]+            { word_count++; char_count += yyleng; } /* Count numbers as words */
.                 { char_count++; } /* Count any other character */
%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error opening file");
            return 1;
        }
    }
    yylex();
    printf("Characters: %d\n", char_count);
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}
