%{
#include <stdio.h>
%}

%option noyywrap

%%

[0-9]+\.[0-9]+      { printf("Floating-point number: %s\n", yytext); }
[0-9]+              { printf("Integer number: %s\n", yytext); }
[ \t\n]        {  /*  Ignore whitespace  */  };
.                   { printf("Invalid character: %s\n", yytext); }


%%

int main() {

    yylex();
    return 0;
}

