%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    char *id;
    struct node *next;
} node;

node *head = NULL;

void insertST(char *id) {

    node *newNode = (node *)malloc(sizeof(node));
    newNode->id = strdup(id);
    newNode->next = NULL;

    if (head == NULL) {
        head = newNode;

    } else {
        // Check if the identifier already exists
        node *temp = head;
        int exists = 0;
        
        while (temp != NULL) {
            if (strcmp(temp->id, id) == 0) {
                exists = 1;
                break;
            }
            temp = temp->next;
        }
        
        // Add only if it's a new identifier
        if (!exists) {
            temp = head;
            while (temp->next != NULL) {
                temp = temp->next;
            }
            temp->next = newNode;
        } else {
        
        }
    }
}
%}

%option noyywrap

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"  { printf("=> Keyword %s\n", yytext); }
[0-9]+                    { printf("=> Number %s\n", yytext); }
"+"|"-"|"*"|"/"|"^"|"="   { printf("=> Operator %s\n", yytext); }
"("|")"                   { printf("=> Parenthesis %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*    { insertST(yytext);  }
[ \t\n]+                  { /* Skip whitespace */ }
"{"|"}"|";"|","|":"|"."|"["|"]"   { printf("=> Delimiter %s\n", yytext); }
.                         { printf("=> Unknown %s\n", yytext); }

%%

int main() {
    yylex();  

//print link list
    node *temp = head;
    while (temp != NULL) {
        printf("Identifier: %s\n", temp->id);
        temp = temp->next;
    }

    return 0;
}
