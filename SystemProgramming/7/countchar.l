%option noyywrap

%{
	int linecount = 1;
    int charcount = 0;
    int flag = 0;
%}

%%
<<EOF>> {flag=1; return 1;}
. {++charcount;}
\n {++linecount;}

%%

int main()
{
    yyin = fopen("input.txt","r");
	yylex();
    if(flag == 1 && charcount == 0){
        printf("file is empty\n");
        return 1;
    }
    printf("There are [%d] characters present\n", charcount);
    printf("There are [%d] lines present\n", linecount);

    return 0;
}
