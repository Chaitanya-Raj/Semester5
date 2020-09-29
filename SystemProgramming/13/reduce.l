%option noyywrap
%{
	void func(char *, int);
%}

%%
[a-zA-Z0-9 ]+ {func(yytext, yyleng);}
%%

void func(char *a, int length)
{
	for(int i=0; i<length; i++)
	{
		for(int j=0; j<length-i; j++)
			printf("%c", a[j]);
		printf("\n");
	}
}

int main()
{
	printf("\nInput string : ");
	yylex();
}
