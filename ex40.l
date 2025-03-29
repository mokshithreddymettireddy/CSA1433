%{
#include <stdio.h>
%}

%%
[a-zA-Z]+ {
    printf("Word: %s\n", yytext);
}

(<=|>=|==|!=|<|>) {
    printf("Relational Operator: %s\n", yytext);
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
