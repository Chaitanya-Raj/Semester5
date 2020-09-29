%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%%
"/*"([^*]|(\*+[^*/]))*"*"+"/" { ; }
"//".+ { ; }
%%

int main()
{
    yyin=fopen("input.txt","r");
    FILE *fp=fopen("output.txt","w");
    yyout=fp;
    yylex();
    return 0;
}