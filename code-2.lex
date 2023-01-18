/*
Enunciado: construa um analisador léxico que apresente as seguintes ações,
conforme for reconhecendo os seguintes padrões:

- [x] Espaço em branco: ignorar
- [x] Número inteiro: exibir a mensagem "Número inteiro encontrado" e incrementar
um contador de total de tokens reconhecidos.
- [x] Palavra "UVA": exibir a mensagem "UVA encontrada" e incrementar um contador
de total de tokens reconhecidos.
- [x] Palavras reservadas if, else e then: exibir a mensagem "Palavra reservada
encontrada" e incrementar um contador de total de tokens reconhecidos.
- [x] Identificadores: exibir a mensagem "Identificador encontrado" e incrementar
um contador de total de tokens reconhecidos.
- [x] Operadores aritméticos: exibir a mensagem "Operador aritmético encontrado"
e incrementar um contador de total de tokens reconhecidos.
- [x] Qualquer outro caractere: exibir a mensagem "Erro léxico" e incrementar um
contador de erros léxicos.
*/

%{
  #include <stdio.h>

  int tokensCount = 0, errorsCount = 0;
%}

whitespaces [\s\t\n]+
integerValue [+-]?[0-9]+
uva [Uu][Vv][Aa]
reservedWord (if|else|then)
identifier [a-zA-Z_][a-zA-Z0-9_]*
operator [-+*/]

%%
{whitespaces} {
  ;
}

{integerValue} {
  printf("Número inteiro encontrado\n");

  tokensCount++;
}

{uva} {
  printf("UVA encontrada\n");

  tokensCount++;
}

{reservedWord} {
  printf("Palavra reservada encontrada\n");

  tokensCount++;
}

{identifier} {
  printf("Identificador encontrado\n");

  tokensCount++;
}

{operator} {
  printf("Operador aritmético encontrado\n");

  tokensCount++;
}

.* {
  printf("[ERRO LÉXICO]\n");

  errorsCount++;
}
%%

int yywrap() {}

int main() {
  yylex();

  printf("Total de tokens reconhecidos: %d\n", tokensCount);
  printf("Total de erros léxicos: %d\n", errorsCount);
  printf("Done!\n");

  return 0;
}