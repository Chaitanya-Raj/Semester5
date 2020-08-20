%option noyywrap

%{
	int count = 0;
%}

%%

[aeiouAEIOU] {count++;}
.
\n {printf("There are %d vowels present", count); return 0;}

%%

int main()
{
	printf("Give a sentence : ");
	yylex();
}
