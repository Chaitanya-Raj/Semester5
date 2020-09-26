%option noyywrap

%%

"/*"([^*]|(\*+[^*/]))*"*"+"/" {printf("Multiline comment: %s\n",yytext);}
"//".* {printf("Singleline comment: %s\n",yytext);}
cout|break|switch|case|char|class|continue|default|do|endl|else|float|for|if|int|using|namespace|return|while|void|include {printf("Keyword: %s\n",yytext);}
[+-]?[0-9]+ {printf("Integer: %s\n",yytext);}
[+-]?[0-9]+\.[0-9]+ {printf("Float: %s\n",yytext);}
"+"|"-"|"*"|"/"|"%"|"++"|"--"|"<<" {printf("Operator: %s\n",yytext);}
["][^"]+["] {printf("String: %s\n",yytext);}
[a-zA-Z][a-zA-Z0-9]* {printf("Identifier: %s\n",yytext);}
. {}
\n {}

%%

int main()
{
	yyin = fopen("test.txt", "r");
	yylex();
	return 0;
}