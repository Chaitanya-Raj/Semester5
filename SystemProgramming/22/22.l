%option noyywrap
%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
a  {   
    return A ;
}

[ \t] ;

\n|. return yytext[0];
%%
