%option noyywrap

%{
    #include<stdio.h>
    char encoded[10];
    char str[10];
    int i=0;
%}

%%
[a-wA-W] {encoded[i] = (int)str[i] + 3; i++;}
[x-zX-Z] {encoded[i] = (int)str[i] - 23; i++;}
%%

int main()
{
    printf("Enter the base string : ");
    scanf("%s", str);
    yy_scan_string(str);
    yylex();
    printf("Encoded string: %s", encoded);
    return 0;
}