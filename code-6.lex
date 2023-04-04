/* Código da prova prática da AP1 */

%{
  #include <stdio.h>

  int whitespaceCount = 0, tokensCount = 0, errorsCount = 0;
%}

while (while)
if (if)
else (else)
then (then)
relationalOperator (>|<|>=|<=|==|!=)
openParenthesis [(]
closeParenthesis [)]
identifier [a-zA-Z_][a-zA-Z0-9_]*
integer [+-]?[0-9]+
whitespace [ \t\n]+
myName [gG][uU][sS][tT][aA][vV][oO]

%%
{whitespace} {
  whitespaceCount++;
}

{while} {
  printf("while\n");

  tokensCount++;
}

{if} {
  printf("if\n");

  tokensCount++;
}

{else} {
  printf("else\n");

  tokensCount++;
}

{then} {
  printf("then\n");

  tokensCount++;
}

{myName} {
  printf("Esse é o meu nome\n");
}

{relationalOperator} {
  printf("relationalOperator - tam: %d\n", yyleng);

  tokensCount++;
}

{openParenthesis} {
  printf("openParenthesis\n");

  tokensCount++;
}

{closeParenthesis} {
  printf("closeParenthesis\n");

  tokensCount++;
}

{identifier} {
  printf("identifier - tam: %d\n", yyleng);

  tokensCount++;
}

{integer} {
  printf("integer - tam: %d\n", yyleng);

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

  printf("Qtd. de tokens lidos: %d\n", tokensCount);
  printf("Qtd. de lexemas ignorados: %d\n", whitespaceCount);
  printf("Qtd. de erros léxicos: %d\n", errorsCount);

  return 0;
}