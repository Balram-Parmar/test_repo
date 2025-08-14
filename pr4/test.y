%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%union {
    int num;
}

%token <num> NUMBER
%type <num> expression
%left '+' '-'
%left '*' '/'

%%

program    : expression              { printf("Result: %d\n", $1); }
           ;



%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    return yyparse();
}
