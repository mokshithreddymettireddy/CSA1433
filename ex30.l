%{
#include <stdio.h>
#include <ctype.h>

int numbers = 0, words = 0;
%}

%%
[0-9]+ { 
    printf("Number: %s\n", yytext);
    numbers++;
}
[a-zA-Z]+ { 
    printf("Word: %s\n", yytext);
    words++;
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter a statement: ");
    yylex();
    printf("Total Numbers: %d\n", numbers);
    printf("Total Words: %d\n", words);
    return 0;
}

int yywrap() {
    return 1;
}
