%{
#include <stdio.h>

char soma(char A, char B);
char sub(char A, char B);
char mult(char A, char B);
char div(char A, char B);
char COMPATIVEIS(char A, char B);
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
  printf("Tipo da variavel: inteiro\n") ;
  printf("Tipo da expressao: %s\n", ($3 == 'i') ? "inteiro" : "flutuante");
  printf("%s\n", (COMPATIVEIS('i',$3) == 'T') ? "Sao compativeis" : "Nao sao compativeis");
}
| NEWLINE;

expression: expression ADD term {
  $$ = soma($1,$3);
}
| expression SUB term { $$ = sub($1,$3); }
| term { $$ = $1; };

term: term MUL factor {
  $$ = mult($1,$3);
}
| term DIV factor {
  $$ = div($1,$3);
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


char soma(char A, char B) {
  char aux;

  if (A == 'f' && B == 'i')
    aux = 'f';
  else if (A == 'i' && B == 'f')
    aux = 'f';
  else if (A == 'i' && B == 'i')
    aux = 'i';
  else
    aux = 'f';

  return aux;
}

char sub(char A, char B) {
  char aux;

  if (A == 'f' && B == 'i')
    aux = 'f';
  else if (A == 'i' && B == 'f')
    aux = 'f';
  else if (A == 'i' && B == 'i')
    aux = 'i';
  else
    aux = 'f';

  return aux;
}

char mult(char A, char B) {
  char aux;

  if (A == 'f' && B == 'i')
    aux = 'f';
  else if (A == 'i' && B == 'f')
    aux = 'f';
  else if (A == 'i' && B == 'i')
    aux = 'i';
  else
    aux = 'f';

  return aux;
}

char div(char A, char B) {

  return 'f';
}

char COMPATIVEIS(char A, char B) {
  char aux;

  if (A == B)
    aux = 'T';
  else
    aux = 'F';

  return aux;
}
