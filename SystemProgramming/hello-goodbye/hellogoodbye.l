%option noyywrap
%%
"hello" printf("Goodbye!");
.+ ;
%%
int main()
{
    yylex();
}