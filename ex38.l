%{
#include <stdio.h>
#include <string.h>

char target_word[100];
int count = 0;
%}

%%
[a-zA-Z]+ {
    if (strcmp(yytext, target_word) == 0) {
        count++;
    }
}
. {/* Ignore other characters */}
%%

int main() {
    printf("Enter the target word: ");
    scanf("%s", target_word);
    printf("Enter a sentence: ");
    yylex();
    printf("Frequency of '%s': %d\n", target_word, count);
    return 0;
}

int yywrap() {
    return 1;
}
