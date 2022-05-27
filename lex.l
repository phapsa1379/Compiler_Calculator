%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mem.h"
#include "gram.tab.h"
%}

%option noyywrap

%%
[ \t]
[0-9]+(\.[0-9]+)?          					{ yylval.num = atof(yytext); return NUMBER; }
"+"                         					{ return ADD; }
"-"                         					{ return SUB; }
"*"                         					{ return MUL; }
"/"                         					{ return DIV; }
"%"																		{ return MOD; }
"^"                         					{ return POW; }
"="																		{ return EQUALS; }
"("																		{ return L_BRACKET; }
")"																		{ return R_BRACKET; }
("cos")|("COS")												{ return COS; }
("sin")|("SIN")												{ return SIN; }
("tan")|("TAN")												{ return TAN; }
("cot")|("COT")												{ return COT; }
("ln")|("LN")													{ return LN; }
("exp")|("EXP")												{ return EXP; }
("var")|("VAR")												{ return VAR_KEYWORD; }
[a-zA-Z0-9]+  												{ yylval.index = add_variable(yytext); return VARIABLE; }
[\n]                        					{ return EOL; }
. 																		{ yyerror("Undefined symbol"); exit(1); } 
%%
