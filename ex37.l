%{
#include <stdio.h>
#include <string.h>

int max_length = 0;
char longest_word[100];
%}

%%
[a-zA-Z]+ {
    int length = strlen(yytext);
    if (length > max_length) {
        max_length = length;
        strcpy(longest_word, yytext);
    }
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter a sentence: ");
    yylex();
    printf("Longest word: %s\n", longest_word);
    printf("Length: %d\n", max_length);
    return 0;
}

int yywrap() {
    return 1;
}