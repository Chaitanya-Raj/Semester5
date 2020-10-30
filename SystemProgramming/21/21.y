%{
#include<ctype.h>
#include<stdio.h>
#include "lex.yy.c"
void yyerror(const char *s);
%}

%token A
%token B

%%
line:line expr '\n' {printf("Valid String\n");}
    |line '\n'
    |
    |error '\n' {yyerror("Error : Invalid String\n\nInput new string");yyerrok;}
   ;
expr: A A A B B B | A B    
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