%{
#include <stdio.h>
#include <string.h>

int keywords = 0, identifiers = 0;
char *keyword_list[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double", "else", "enum", "extern", "float", "for", "goto", "if", "inline", "int", "long", "register", "restrict", "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};

int is_keyword(char *word) {
    for (int i = 0; i < 32; i++) {
        if (strcmp(word, keyword_list[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext)) {
        printf("Keyword: %s\n", yytext);
        keywords++;
    } else {
        printf("Identifier: %s\n", yytext);
        identifiers++;
    }
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter code snippet: ");
    yylex();
    printf("Total Keywords: %d\n", keywords);
    printf("Total Identifiers: %d\n", identifiers);
    return 0;
}

int yywrap() {
    return 1;
}
