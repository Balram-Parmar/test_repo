%{
#include <stdio.h>

// int yywrap(void) {
//     return 1;P.vscode/mcp.json
// }


%}
%option noyywrap


%%{
.       { printf("Unknown character: %s\n", yytext); }
int|float|char     { printf("Its a valid Keyword: %s with length %d\n", yytext, yyleng); }
if                 { printf("Recognized 'if' statement: %s\n", yytext); }



%%}




int main() {
    yylex();
    return 0;
}
