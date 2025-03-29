%{
#include <stdio.h>
%}

%%

"int"       { printf("KEYWORD: %s\n", yytext); }
"float"     { printf("KEYWORD: %s\n", yytext); }
"return"    { printf("KEYWORD: %s\n", yytext); }
"if"        { printf("KEYWORD: %s\n", yytext); }
"else"      { printf("KEYWORD: %s\n", yytext); }
"while"     { printf("KEYWORD: %s\n", yytext); }
"for"       { printf("KEYWORD: %s\n", yytext); }
"char"      { printf("KEYWORD: %s\n", yytext); }
"double"    { printf("KEYWORD: %s\n", yytext); }
"void"      { printf("KEYWORD: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }

[0-9]+      { printf("INTEGER CONSTANT: %s\n", yytext); }
[0-9]+\.[0-9]+ { printf("FLOAT CONSTANT: %s\n", yytext); }
\"([^"]*)\" { printf("STRING LITERAL: %s\n", yytext); }

"+"         { printf("OPERATOR: %s\n", yytext); }
"-"         { printf("OPERATOR: %s\n", yytext); }
"*"         { printf("OPERATOR: %s\n", yytext); }
"/"         { printf("OPERATOR: %s\n", yytext); }
"="         { printf("OPERATOR: %s\n", yytext); }
"=="        { printf("OPERATOR: %s\n", yytext); }
"!="        { printf("OPERATOR: %s\n", yytext); }
"<"         { printf("OPERATOR: %s\n", yytext); }
">"         { printf("OPERATOR: %s\n", yytext); }
"<="        { printf("OPERATOR: %s\n", yytext); }
">="        { printf("OPERATOR: %s\n", yytext); }

"{"         { printf("SPECIAL SYMBOL: %s\n", yytext); }
"}"         { printf("SPECIAL SYMBOL: %s\n", yytext); }
"("         { printf("SPECIAL SYMBOL: %s\n", yytext); }
")"         { printf("SPECIAL SYMBOL: %s\n", yytext); }
";"         { printf("SPECIAL SYMBOL: %s\n", yytext); }
","         { printf("SPECIAL SYMBOL: %s\n", yytext); }

"//".*      { printf("COMMENT: %s\n", yytext); }
"/*"([^*]|(\*+[^*/]))*"*/" { printf("COMMENT: %s\n", yytext); }

[ \t\n]+    ; // Ignore whitespace and newlines

.           { printf("UNKNOWN TOKEN: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }

    yylex(); // Start the lexical analysis

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}

int yywrap() {
    return 1;
}