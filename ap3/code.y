%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
%}

%union {
    int integer;
    double floating;
    char character;
    char *string;
}

%token <integer> INTEGER
%token <floating> FLOATING
%token <character> CHARACTER
%token <string> STRING
%token TYPE OPERATOR

%type <integer> expression

%%

program:
    /* empty */
    | program statement '\n'
    | program error '\n' { yyerrok; }
    ;

statement:
    expression { printf("%d\n", $1); }
    | expression { printf("%f\n", $1); }
    | expression { printf("%c\n", $1); }
    | expression { printf("%s\n", $1); }
    ;

expression:
    INTEGER { $$ = $1; }
    | FLOATING { $$ = $1; }
    | CHARACTER { $$ = $1; }
    | STRING { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "%s\n", msg);
}