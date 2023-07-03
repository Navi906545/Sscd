%{
#include<stdio.h>
#include<string.h>
int count=0;
%}

%%
"/*"[a-zA-Z0-9 \t\n]+"*"     {count++;}
"//"[a-zA-Z0-9 \t]+          {count++;}
.                 ECHO;
%%
int main()
{
yyin=fopen("1.c","r");
yyout=fopen("2.c","w");
yylex();
fclose(yyout);
fclose(yyin);
printf("no of comment lines=%d\n",count);
}
int yywrap()
{
}
