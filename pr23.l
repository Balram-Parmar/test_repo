%{
int  word_count = 0;
%}

%%

[a-zA-Z0-9]+ { word_count++; }


%%

int main() {
    yylex();
   
    printf("Total number of Words: %d\n", word_count);
 
    return 0;
}

int yywrap() {
    return 1;
}
