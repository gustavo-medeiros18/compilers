%{
#include <stdio.h>

char isCompatible(char A, char B);
char sum(char A, char B);
char sub(char A, char B);
char multiply(char A, char B);
char divide(char A, char B);
%}


%token NEWLINE
%token ID
%token EQ
%token ADD
%token SUB
%token MUL
%token DIV
%token LPAREN
%token RPAREN
%token NUM
%token DEC

%%

line: ID EQ expression NEWLINE {
  printf("Variable type: int\n");
  printf("Expression type: %s\n", ($3 == 'i') ? "int" : "float");
  printf("%s\n", (isCompatible('i',$3) == 'T') ? "Are compatible" : "Aren't compatible");
}
| NEWLINE;

expression: expression ADD term {
  $$ = sum($1,$3);
}
| expression SUB term {
  $$ = sub($1,$3);
}
| term {
  $$ = $1;
};

term: term MUL factor {
  $$ = multiply($1,$3);
}
| term DIV factor {
  $$ = divide($1,$3);
}
| factor {
  $$ = $1;
};

factor: LPAREN expression RPAREN {
  $$ = $2;
}
| NUM {
  $$ = 'i';
}
| DEC {
  $$ = 'f';
}
| ID {
  $$ = 'i';
};

%%
int main() {
  yyparse();
  return 0;
}

int yyerror(const char* msg) {
  printf("Erro de sintaxe: %s\n", msg);
  return 0;
}

char isCompatible(char A, char B) {
  char result;

  if (A == B)
    result = 'T';
  else
    result = 'F';

  return result;
}

char sum(char A, char B) {
  char result;

  if (A == 'f' && B == 'i')
    result = 'f';
  else if (A == 'i' && B == 'f')
    result = 'f';
  else if (A == 'i' && B == 'i')
    result = 'i';
  else
    result = 'f';

  return result;
}

char sub(char A, char B) {
  char result;

  if (A == 'f' && B == 'i')
    result = 'f';
  else if (A == 'i' && B == 'f')
    result = 'f';
  else if (A == 'i' && B == 'i')
    result = 'i';
  else
    result = 'f';

  return result;
}

char multiply(char A, char B) {
  char result;

  if (A == 'f' && B == 'i')
    result = 'f';
  else if (A == 'i' && B == 'f')
    result = 'f';
  else if (A == 'i' && B == 'i')
    result = 'i';
  else
    result = 'f';

  return result;
}

char divide(char A, char B) {
  return 'f';
}
