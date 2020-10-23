%option noyywrap
%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+ {
	yylval=atoi(yytext);
	return DIGIT;
	}
[\t] ;
\n|. return yytext[0];

%%