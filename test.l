%{
#include <stdio.h>

// int yywrap(void) {
//     return 1;
// }




%}
%option noyywrap


%%{

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("Its a valid Keyword: %s with length %d\n", yytext, yyleng); }
.       { ECHO;}



%%}




int main() {
    yylex();
    return 0;
}
