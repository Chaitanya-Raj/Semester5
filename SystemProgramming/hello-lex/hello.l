%option noyywrap
%%
"hello" printf("good bye!");
. ;
%%
int main()
{
    yylex();
}