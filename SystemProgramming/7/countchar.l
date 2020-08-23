%option noyywrap

%{
	int linecount = 0;
    int charcount = 0;
%}

%%

\w* {charcount++; return 1;}
.
\n {linecount++; return 1;}

%%

int main()
{
	printf("Give a sentence : ");
	yylex();
    printf("There are [%d] characters and [%d] lines present", charcount, linecount);
    return 0;
}
