%option noyywrap

%{
void display(int);
%}

%%

[aeiouAEIOU] { display(1); return 1; }
.+ { display(0); return 1; }

%%

void display(int flag)
{
  if(flag==0)
	printf("[%s] is NOT a vowel\n", yytext);
  else
	printf("[%s] is a vowel\n", yytext);
}

int main()
{
	printf("\nEnter a letter to check whether it is vowel or not : ");
	yylex();
	return 0;
}
