%{
#include <stdio.h>

// int yywrap(void) {
//     return 1;
// }




%}
%option noyywrap


%%


"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Identifier: %s\n", yytext); }
[0-9]+                     { printf("Number: %s\n", yytext); }
.                          { printf("Unknown character: %s\n", yytext); }


%%




int main() {
    yylex();
    return 0;
}
