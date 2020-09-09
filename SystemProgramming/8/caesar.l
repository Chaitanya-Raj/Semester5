%option noyywrap

%%

[a-z] 	{	char ch = yytext[0];
			ch += 3;
			if (ch > 'z') ch -= ('z' - 'a' + 1);
			printf ("%c", ch );
	  	}
[A-Z] 	{ 	char ch = yytext[0] ;
			ch += 3;
			if (ch > 'Z') ch -= ('Z' - 'A' + 1);
			printf("%c", ch);
        }
%%

void main()
{
	yylex();
}