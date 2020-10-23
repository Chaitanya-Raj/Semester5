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
 printf("\n Enter any Airthmetic Expression which can have operations Addition,Subtraction,Multiplication,Division,Modulous and round Brackets;\n");
 yyparse();
 printf("\nEntered Arithmetic Expression is valid\n");
}

void yyerror(const char *str)
{
printf("%s\n",str);
}