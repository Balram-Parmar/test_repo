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
    node *current = head;
    while (current != NULL) {
        if (strcmp(current->id, id) == 0) {
            return;
        }
        current = current->next;
    }
    node *newNode = (node *)malloc(sizeof(node));
    newNode->id = strdup(id);
    newNode->next = head;
    head = newNode;
}

void displayST() {
    node *current = head;
    while (current != NULL) {
        printf("Identifier: %s\n", current->id);
        current = current->next;
    }
}

int yywrap(void)
{
    return 1;
}
%}

%%
int|char|float|double|void|short|long|signed|unsigned|if|else|switch|case|default|for|while|do|break|continue|goto|auto|extern|register|static|const|volatile|struct|union|enum|sizeof|typedef|return  { }
[a-zA-Z_][a-zA-Z0-9_]*  { insertST(yytext); }
\n  { printf("\nCurrent Symbol Table:\n"); displayST(); }
.   { }
%%

int main()
{
    yylex();
    return 0;
}