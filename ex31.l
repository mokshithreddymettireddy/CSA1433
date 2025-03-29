%{
#include <stdio.h>

int positive_numbers = 0, negative_numbers = 0;
%}

%%
[-][0-9]+ { 
    printf("Negative Number: %s\n", yytext);
    negative_numbers++;
}
[0-9]+ { 
    printf("Positive Number: %s\n", yytext);
    positive_numbers++;
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter a series of numbers: ");
    yylex();
    printf("Total Positive Numbers: %d\n", positive_numbers);
    printf("Total Negative Numbers: %d\n", negative_numbers);
    return 0;
}

int yywrap() {
    return 1;
}
