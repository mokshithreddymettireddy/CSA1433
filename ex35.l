%{
#include <stdio.h>
#include <stdlib.h>

int result = 0;
%}

%%
[0-9]+ { 
    printf("Number: %s\n", yytext);
}
\+ { 
    printf("Operator: + (Addition)\n");
}
\- { 
    printf("Operator: - (Subtraction)\n");
}
\* { 
    printf("Operator: * (Multiplication)\n");
}
\/ { 
    printf("Operator: / (Division)\n");
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter a mathematical expression: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
