%{
  #include <stdio.h>
%}

email [a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z0-9.-]+
url [a-zA-Z0-9]+:\/\/(www)?[0-9a-zA-Z_.~-]+(:[0-9]+)?\/[a-zA-Z0-9_~./?&=%,-]*
ip ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$

%%
{email} {
  printf("Esse é um e-mail\n");
}

{url} {
  printf("Essa é um URL\n");
}

{ip} {
  printf("Esse é um Endereço IP\n");
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