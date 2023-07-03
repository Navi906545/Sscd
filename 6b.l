%{
#include<stdio.h>
#include "y.tab.h"
int yylval;
%}
%%
[+|-|*|/|<|>|=]     {printf("operator is %s\n",yytext);return OP;}
[0-9]+      {yylval=atoi(yytext);printf("number is %d\n",yylval);return DIGIT;}
int|char|bool|float|void|for|do|while|if|else|return|printf|scanf|main {printf("keyboard is %s\n",yytext);return KEY;}
[a-z|A-Z0-9]+   {printf("identifier is %s\n",yytext);return ID;}
.                {;}
%%

