%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "func.h"
#include "gram.tab.h"

extern double variable_values[100];
extern int variable_set[100];

extern int yylex(void);
extern void yyterminate();
void yyerror(const char *message);
extern FILE* yyin;
%}



%union {
	int index;
	double num;
}

%token<num> NUMBER
%token<num> L_BRACKET R_BRACKET
%token<num> DIV MUL ADD SUB EQUALS
%token<num> POW MOD
%token<num> LN EXP
%token<num> COS SIN TAN COT
%token<index> VARIABLE
%token<num> NEW_LINE
%type<num> program_input
%type<num> line
%type<num> calculation
%type<num> expr
%type<num> function
%type<num> log_function
%type<num> trig_function
%type<num> assignment

%left SUB 
%left ADD
%left MUL 
%left DIV 
%left POW  
%left L_BRACKET R_BRACKET


%%
program_input:
	| program_input line
	;
	
line: 
			NEW_LINE 						 { printf("Please enter a calculation:\n"); }
		| calculation NEW_LINE  { printf("=%.2f\n",$1); }
    ;

calculation:
		  expr
		| function
		| assignment
		;
		
expr:
			SUB expr					{ $$ = -$2; }
    | NUMBER            { $$ = $1; }
		| VARIABLE					{if(variable_values[$1]==-99999){yyerror("Variable is not initialized"); exit(1);} else $$ = variable_values[$1]; }
		| function
		| expr DIV expr     { if ($3 == 0) { yyerror("Cannot divide by zero"); exit(1); } else $$ = $1 / $3; }
		| expr MUL expr     { $$ = $1 * $3; }
		| L_BRACKET expr R_BRACKET { $$ = $2; }
		| expr ADD expr     { $$ = $1 + $3; }
		| expr SUB expr   	{ $$ = $1 - $3; }
		| expr POW expr     { $$ = pow($1, $3); }
		| expr MOD expr     { $$ = modulo($1, $3); }
    ;
		
function: 
		log_function
		| trig_function
		;

trig_function:
			COS expr  			  { $$ = cos($2); }
		| SIN expr 					{ $$ = sin($2); }
		| TAN expr 					{ $$ = tan($2); }
		| COT expr 					{ $$ = 1 / tan($2); }
		;
	
log_function:
			LN expr 				{ $$ = log($2); }
			|EXP expr        {$$ = exp($2); }
		;
			
		
assignment: 
		 VARIABLE EQUALS calculation { $$ = set_variable($1, $3); }
		;
%%

int main(int argc, char **argv)
{
		int i=0;
		for(i=0;i<100;i++){
			variable_values[i] = -99999;
		}
		printf("Enter your Input: \n");	
		yyin = stdin;
		yyparse();
	
}

void yyerror(const char *message)
{
	printf("ERROR: %s\n", message);
}
