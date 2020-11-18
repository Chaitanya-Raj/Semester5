%{
#include<stdio.h>
#include "lex.yy.c"
void yyerror(const char *c);
%}

%token DIGIT
%token ID
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%

line:line E '\n' {printf("Valid Expression.");}
     |line '\n'
     |/*empty*/
     |error '\n' {yyerror("Invalid Expression"); yyerrok;}
;
E:E '+' E 
|
E '-' E 
|
E '*' E 
|
E '/' E  
|
E '%' E
|
'(' E ')' 
 | DIGIT 
 |ID
      ;
%%

void main()
{
 printf("\n Input any arithmetic expression having +, -, *, / or () :\n");
 yyparse();
 printf("\nValid Expression\n");
}

void yyerror(const char *str)
{
printf("%s\n",str);
}