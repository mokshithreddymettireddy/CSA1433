%{
#include <stdio.h>

int yywrap() {
    return 1;
}
%}

%%
[0-3][0-9][-\/][0-1][0-9][-\/][0-9]{4} {
    printf("Valid DOB: %s\n", yytext);
}
.|\n {
    /* Ignore other characters */
}
%%

int main() {
    yylex();
    return 0;
}
