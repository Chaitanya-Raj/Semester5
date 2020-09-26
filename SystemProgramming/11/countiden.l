%option noyywrap
%{
#include<stdio.h>
int count=0,flag=0;
%}

letter [a-zA-Z]
digit [0-9]
id {letter}({letter}|{digit})*

%%
"#include<iostream>" {printf("%s is an header file\n", yytext); }
"using"|"namespace"|"std" {printf("%s is an preprocessor directry\n", yytext); }
"int"|"main"|"return"|"float"|"char"|"case"|"default"|"if"|"else"|"then"|"while"|"for"|"printf"|"scanf"|"cout"|"cin" {printf("%s is a keyword\n", yytext);}
{id} {printf("%s is an identifier\n", yytext);count++;}

"int"|"float"|"<="|"=="|"="|"++"|"-"|"*"|"+"|"<"|">"|["][^"]+["]|[(){},;] {printf("%s is an operator\n", yytext); }
"//".+ {printf("%sSingle Line Comment\n",yytext);}

"/*"([^*]|(\*[^/]))*"*"+"/" {printf("%sMulti Line Comment\n",yytext);}
[\t\n]+ ;
%%
int main()
{  
    yyin=fopen("test.txt","r"); 
    yylex();
    printf("\nThis file has %d identifiers",count);
   return 0;
       
}  