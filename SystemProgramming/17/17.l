%option noyywrap

%{
    int flag=1;
    int i=0;
%}

id [a-zA-Z_][a-zA-Z_0-9]*
num [0-9]+
op [\+|\-|\*|\/]

%%
({id}|{num}) {
    flag=0;
    return 0;
}
([(]*({id}|{num})[)]*{op}[(]*({id}|{num})[)]*)({op}[(]*({id}|{num})[)]*)* {
    flag=0;
    for(i=0;i<yyleng;i++){
        if(yytext[i]=='(')
            flag++;
        else if(yytext[i]==')')
            flag--;
    }
    return 0;
}
.+ {
    return 0;
}
%%

int main(){
    yylex();
    if(flag==0)
        printf("Valid arithmatic expression");
    else
        printf("Invalid arithmatic expression");
    return 0;
}