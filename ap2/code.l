%{
  #include "y.tab.h"
%}

%%
[a-zA-Z]+[a-zA-Z0-9_]* {
  return ID;
}

[0-9]+ {
  return NUM;
}

[0-9]+[.][0-9]+ {
  return DEC;
}

"=" {
  return EQ;
}

"+" {
  return ADD;
}

"-" {
  return SUB;
}

"*" {
  return MUL;
}

"/" {
  return DIV;
}

"(" {
  return LPAREN;
}

")" {
  return RPAREN;
}

[\n] {
  return NEWLINE;
}

. {
  /* Tratamento de caracteres inválidos */
}
%%

int yywrap() {
  return 0;
}