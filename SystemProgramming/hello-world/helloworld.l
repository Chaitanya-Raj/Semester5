%option noyywrap
%%
.*\n printf("Hello World!");
%%
int main()
{
    yylex();
}