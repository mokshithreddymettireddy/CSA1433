%{
#include <stdio.h>
%}

%%
[0-9]+ { 
    printf("Digit: %s\n", yytext);
}
[a-zA-Z]+ { 
    printf("Not a digit: %s\n", yytext);
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
