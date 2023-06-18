%{
#include "y.tab.h"
%}

%%

"if" { return IF; }
"else" { return ELSE; }
"while" { return WHILE; }
"for" { return FOR; }
"function" { return FUNCTION; }
"int" { yylval.type = INT; return TYPE; }
"double" { yylval.type = DOUBLE; return TYPE; }
"char" { yylval.type = CHAR; return TYPE; }
"string" { yylval.type = STRING; return TYPE; }
"(" { return LEFT_PAREN; }
")" { return RIGHT_PAREN; }
"{" { return LEFT_BRACE; }
"}" { return RIGHT_BRACE; }
"," { return COMMA; }
":" { return COLON; }
";" { return SEMICOLON; }
"+" { yylval.character = '+'; return OPERATOR; }
"-" { yylval.character = '-'; return OPERATOR; }
"*" { yylval.character = '*'; return OPERATOR; }
"/" { yylval.character = '/'; return OPERATOR; }
"=" { yylval.character = '='; return OPERATOR; }
"==" { yylval.character = EQ; return OPERATOR; }
"!=" { yylval.character = NEQ; return OPERATOR; }
">" { yylval.character = '>'; return OPERATOR; }
">=" { yylval.character = GTE; return OPERATOR; }
"<" { yylval.character = '<'; return OPERATOR; }
"<=" { yylval.character = LTE; return OPERATOR; }
"&&" { yylval.character = AND; return OPERATOR; }
"||" { yylval.character = OR; return OPERATOR; }
"!" { yylval.character = NOT; return OPERATOR; }
[0-9]+ { yylval.string = strdup(yytext); return LITERAL; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.string = strdup(yytext); return IDENTIFIER; }
\"(\\.|[^\"])*\" { yylval.string = strdup(yytext); return LITERAL; }
\'(\\.|[^\'])*\' { yylval.string = strdup(yytext); return LITERAL; }
[ \t\n] { /* ignore whitespace */ }
. { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}