%{
#include <stdio.h>

// int yywrap(void) {
//     return 1;P.vscode/mcp.json
// }


%}
%option noyywrap


%%{
.       { printf("Unknown character: %s\n", yytext); }
int  { printf("Its a valid Keyword: %s with length %d\n", yytext, yyleng); }




%%}




int main() {
    yylex();
    return 0;
}
