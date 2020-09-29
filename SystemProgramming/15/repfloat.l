%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%%
"float" { fprintf(yyout, "double"); }
%%

int main()
{
    yyin = fopen("input.txt", "r");
    FILE *fp = fopen("output.txt", "w");
    yyout = fp;
    yylex();
    return 0;
}