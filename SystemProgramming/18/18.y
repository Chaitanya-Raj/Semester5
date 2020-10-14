%{
#include<ctype.h>
#include<stdio.h>
int yylex();
void yyerror(const char *str);
%}

%token DIGIT

%%
lines:lines expr '\n' {printf("%d\n",$2);}
	|lines '\n'
	|
	|error '\n' {yyerror("re-enter previous line");yyerrok;}
	;
expr:expr '+' term {$$=$1+$3;}
	|expr '-' term {$$=$1-$3;}
	|term
	;
term:term '*' factor {$$=$1*$3;}
	|term '/' factor {$$=$1/$3;}
	|factor
	;
factor:'('expr')' {$$=$2;}
	|'-' factor   {$$=-$2;}
	|DIGIT
	;
%%

int yylex()
{
	int c;
	c=getchar();
	if(isdigit(c)){
    	yylval=c-'0';
    	return DIGIT;
	}
	return c;
}

void main()
{
    printf("\nInput any arithmetic expression having +, -, *, / or () :\n");
    yyparse();
}

void yyerror(const char *str)
{
    printf("Invalid Expression : %s\n\n",str);
}
