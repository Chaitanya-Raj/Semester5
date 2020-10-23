%{
#include<ctype.h>
#include<stdio.h>
#include "lex.yy.c"
void yyerror(const char *s);
%}

%token A

%%
line:line expr '\n' {printf("Valid String\n");}
    |line '\n'
    |
    |error '\n' {yyerror("Error : Invalid String\n\nInput String");yyerrok;}
   ;
expr: A A A A A A A A A T 'b'
T	: A T 
	|     
	;
%%


void main()
{
  printf("Input string:\n");
yyparse();

}
void yyerror(const char *st)
{
printf(" %s\n",st);

}