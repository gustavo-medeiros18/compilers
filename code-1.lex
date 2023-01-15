/* This file shows a simple definition for building a
scanner (lexical analyser). */

/* This is the first part, the declaration section. It has two components:
C instructions (in this case, we are just including the stdio.h header) and
regular definitions using regex. */
%{
#include <stdio.h>
%}

whitespace [ \t\n]+
numbers [0-9]+
chars [a-zA-Z]+

/* Here, we have the second part of the definition file: the rules section.
This section uses the regular definitions specified in the declarations
part to define the rules of the scanner. This rules always have the format
PATTERN {ACTION}. In which the PATTER are usually regular definitions, and
the action is some C code that will be executed every time that the pattern
is recognized in the input. */
%%
whitespace {
  ; // Do nothing
}

numbers {
  printf("Number: %s\n", yytext);
}

chars {
  printf("Chars: %s\n", yytext);
}
%%

/* This is the last part of our definition file. It's basically the main()
C function that will call yylex(). In this part, we can also define functions
to be used in the rules section*/

// It's necessary to define this function, even if it's empty.
int yywrap() {}

int main() {
  yylex();
  printf("Done!\n");

  return 0;
}
