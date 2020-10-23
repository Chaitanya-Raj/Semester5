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
[a-z][A-za-z0-9]* { yylval=atoi(yytext);
		return ID;
	}
[\t] ;
\n|. return yytext[0];

%%