%option noyywrap
%{
int ch=0, bl=0, ln=1, wr=1;
%}
%%
[\n] {ln++;wr++;}
[\t] {bl++;wr++;}
[" "] {bl++;wr++;}
[^\n\t] {ch++;}
%%
int main()
{
yyin=fopen("test.txt","r");  
yylex();
printf("lines : %d \n", ln);
printf("words : %d \n", (wr));
printf("blank spaces : %d \n", bl);
printf("characters : %d \n", ch);
return 0;
}