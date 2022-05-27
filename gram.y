%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "func.h"
#include "gram.tab.h"

/* Used for variable stores. Defined in mem.h */
extern double variable_values[100];
extern int variable_set[100];

/* Flex functions */
extern int yylex(void);
extern void yyterminate();
void yyerror(const char *s);
extern FILE* yyin;
%}



%union {
	int index;
	double num;
}

%token<num> NUMBER
%token<num> L_BRACKET R_BRACKET
%token<num> DIV MUL ADD SUB EQUALS
%token<num> PI
%token<num> POW MOD
%token<num> LN 
%token<num> COS SIN TAN COT
%token<num> VAR_KEYWORD 
%token<index> VARIABLE
%token<num> EOL
%type<num> program_input
%type<num> line
%type<num> calculation
%type<num> constant
%type<num> expr
%type<num> function
%type<num> log_function
%type<num> trig_function
%type<num> assignment


/* Set operator precedence, follows BODMAS rules. */
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
			EOL 						 { printf("Please enter a calculation:\n"); }
		| calculation EOL  { printf("=%.2f\n",$1); }
    ;

calculation:
		  expr
		| function
		| assignment
		;
		
constant: PI { $$ = 3.142; }
		;
		
expr:
			SUB expr					{ $$ = -$2; }
    | NUMBER            { $$ = $1; }
		| VARIABLE					{ $$ = variable_values[$1]; }
		| constant	
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
		;
			
		
assignment: 
		VAR_KEYWORD VARIABLE EQUALS calculation { $$ = set_variable($2, $4); }
		;
%%

/* Entry point */
int main(int argc, char **argv)
{
	char c[256];
	printf("Command line or File? (Enter C or F): ");
	scanf("%s", c);
	
	if (strcmp(c, "f")==0 || strcmp(c, "F")==0) {
		// File input
		printf("Ok, please tell me the name of the file: ");
		scanf("%s", c);

		yyin = fopen(c, "r");
		if (!yyin) {
			printf("ERROR: Couldn't open file %s\n", c);
			exit(-1);
		}
		yyparse();
		
		printf("All done with %s\n", c);
	}
	else {
		// Command line
		printf("Ok, command line it is!\n");
		
		yyin = stdin;
		yyparse();
	}
}

/* Display error messages */
void yyerror(const char *s)
{
	printf("ERROR: %s\n", s);
}
