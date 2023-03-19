/*
Enunciado: crie um código em flex para reconhecer:

- [x] Emails Válidos (Retornar: Esse é um e-mail);
- [x] URLs válidas (Retornar: Essa é um URL);
- [] IPV4 (Retornar: Esse é um Endereço IP);
- [x] Quaisquer outras (Retornar: Não reconhecido).
*/

%{
  #include <stdio.h>
%}

email [a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z0-9.-]+
url [a-zA-Z0-9]+:\/\/(www)?[0-9a-zA-Z_.~-]+(:[0-9]+)?\/[a-zA-Z0-9_~./?&=%,-]*

%%
{email} {
  printf("Esse é um e-mail\n");
}

{url} {
  printf("Essa é um URL\n");
}

.* {
  printf("Não reconhecido\n");
}
%%

int yywrap() {}

int main() {
  yylex();

  return 0;
}