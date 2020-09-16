%option noyywrap

%{
	#include<stdio.h>
	#include<string.h>
	int len = 0;
	char *largest;
%}

%%

[a-zA-Z]+ 	{
				if(yyleng > len)
				{ 
					len = yyleng;
					largest = strdup(yytext);
				}
			}

<<EOF>> 	return 1;

%%

int main()
{
	yyin=fopen("test.txt","r");
 	yylex(); 
	printf("\nlargest word : %s", largest);
	printf("\nlength : %d", len);
	return 0;
}