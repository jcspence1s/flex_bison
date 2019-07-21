%{

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char*s);

int RUNNING = 0;
%}

%define parse.error verbose
%union 
{
	int my_int;
}

%token<my_int> INT
%token EXPRESSION
%token PLUS MINUS MULTI DIVIDE EXPONENT
%token L_PAREN R_PAREN VAR
%token NEW_L
%token INVAL
%type<my_int> expression

%start validate

%%

validate:
		| validate input
;

input: expression	{} 	
	|	NEW_L	 
;

expression:	INT								{}
		|	expression PLUS expression 		{}
		|	expression MINUS expression 	{}	
		|	expression MULTI expression 	{}
		|	expression DIVIDE expression 	{}
		|	expression EXPONENT expression 	{}
		|	L_PAREN expression R_PAREN		{}
		|	MINUS expression 				{}
		|	PLUS expression 				{}
;	 
%%

int main()
{
	yyin = stdin;
	do
	{
		yyparse();
	}while(!feof(yyin));

	return 0;
}

void yyerror(const char* s)
{
	fprintf(stderr, "Invalid: %s\n", s);
	return;
}
