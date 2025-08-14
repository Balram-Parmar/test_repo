%{
    #include <stdio.h>
int char_count = 0, word_count = 0, line_count = 0;
%}

%%

\n          { line_count++; char_count++; }
[ \t]+      {}  
[a-zA-Z0-9]+ { word_count++; char_count += yyleng; }
.           { char_count++; }

%%

int main() {
    yylex();
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);
    return 0;
}

int yywrap() {
    return 1;
}
