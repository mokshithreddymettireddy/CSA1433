%{
#include <stdio.h>
%}

%%
[AEIOUaeiou][a-zA-Z]* { 
    printf("Valid String (Starts with Vowel): %s\n", yytext);
}
[a-zA-Z]+ { 
    printf("Invalid String (Does not start with Vowel): %s\n", yytext);
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
