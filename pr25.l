%{
#include <stdio.h>
#include <string.h>

char output[100000] = ""; 
%}
%option noyywrap

%%

"//".*\n    { }
"/*"([^*] | \*+ [^*/])* \*+"/"  {  }

.|\n    { strcat(output, yytext); }  

%%

int main() {
  yylex();
 
  printf("Filtered code:\n%s", output);
 
  return 0;
}
