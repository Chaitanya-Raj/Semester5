%option noyywrap

%{
#include <stdlib.h>
%}

%%

[a-zA-Z]+ { printf("'%s' is a word", yytext); return 1;}
[0-9]+ {  printf("'%d' is a number", atoi(yytext)); return 1;}

%%

int main()
{
	printf("\nInput : ");
	yylex();
}
