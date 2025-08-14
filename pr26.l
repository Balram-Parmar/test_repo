%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct token {
   char* type;
   char* value;
   struct token *next;
};

struct token *head = NULL;

void addToken(char* type, char* value) {
    struct token *newToken= (struct token *)malloc(sizeof(struct token));
    newToken->type = strdup(type);
    newToken->value = strdup(value);
    newToken->next = NULL;

    if (head == NULL) {
        head = newToken;
    } else {
        struct token *current = head;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = newToken;
    }
}
%}

%option noyywrap

%%

"#"[ ]*"include"[ ]*<[^>]+>     { addToken("PREPROCESSOR", yytext); }

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"  { addToken("KEYWORD", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*  { addToken("IDENTIFIER", yytext); }

[0-9]+\.[0-9]+  { addToken("FLOAT", yytext); }

[0-9]+          { addToken("INTEGER", yytext); }

\"([^\\\"])*\"    { addToken("STRING", yytext); }

\'([^\\\']|)\'     { addToken("CHARACTER", yytext); }

"<="|">="|"=="|"!="|"&&"|"\\|\\|"|"<<"|">>"|"\\+\\+"|"--"|"->"|"\."  { addToken("OPERATOR", yytext); }

[+\-*/%=<>!&|^~]  { addToken("OPERATOR", yytext); }

[()\[\];,]    { addToken("PUNCTUATION", yytext); }

"{"|"}"         { addToken("BLOCK", yytext); }

"//".*          { addToken("COMMENT", yytext); }

"/*"([^*]|\*+[^*/])*\*+\/  { addToken("COMMENT", yytext); }

[ \t\n\r]+      { }

.               { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    yylex();

    struct token *current = head;
    while (current != NULL) {
        printf("Token Type: %-12s  Value: %s\n", current->type, current->value);
        current = current->next;
    }

    return 0;
}

