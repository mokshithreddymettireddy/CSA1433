%{
#include <stdio.h>
#include <string.h>

char target_word[100], replacement_word[100];
%}

%%
[a-zA-Z]+ {
    if (strcmp(yytext, target_word) == 0) {
        printf("%s", replacement_word);
    } else {
        printf("%s", yytext);
    }
}
. { printf("%s", yytext); } /* Print other characters as they are */
%%

int main() {
    printf("Enter the target word: ");
    scanf("%s", target_word);
    printf("Enter the replacement word: ");
    scanf("%s", replacement_word);
    printf("Enter the text: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
