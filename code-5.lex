%{
  #include <stdio.h>
  #include <stdlib.h>

  int contEspacos = 0, contIds = 0,
  contInts = 0, contRelops = 0, somaInts = 0;
%}

espaco [ \t\n]+
id [a-zA-Z_][a-zA-Z0-9_]*
int [+-]?[0-9]+
relop (<)|(<=)|(>)|(>=)|(==)|(!=)

%%
{espaco} {
  contEspacos++;
  ;
}

{id} {
  contIds++;

  printf("id\n");
  printf("Lexema: %s\n", yytext);
  printf("Tamanho do lexema: %d\n", yyleng);
}

{int} {
  contInts++;

  somaInts += atoi(yytext);

  printf("int\n");
  printf("Lexema: %s\n", yytext);
  printf("Tamanho do lexema: %d\n", yyleng);
}

{relop} {
  contRelops++;

  printf("relop\n");
  printf("Lexema: %s\n", yytext);
}

.* {
  printf("[ERRO LÉXICO]\n");
}
%%

int yywrap() {}

int main() {
  yylex();

  printf("Qtd. espacos: %d\n", contEspacos);
  printf("Qtd. num. inteiros: %d\n", contInts);
  printf("Qtd. ids: %d\n", contIds);
  printf("Qtd. relops: %d\n", contRelops);

  printf("Soma total dos inteiros lidos: %d\n", somaInts);

  return 0;
}
