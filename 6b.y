%{
#include<stdio.h>
#include<stdlib.h>
int id=0,key=0,op=0,dig=0;
%}
%token DIGIT ID KEY OP
%name parse
%%
input:DIGIT input {dig++;}
      |ID input {id++;}
      |KEY input {key++;}
      |OP input {op++;}
      |DIGIT {dig++;}
      |ID {id++;}
      |KEY {key++;}
      |OP {op++;}
      ;
%%
#include<stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
int main()
{
FILE *myfile=fopen("in.c","r");
if(!myfile)
{
printf("i cant open in.c!");
return -1;
}
yyin=myfile;
do
{
yyparse();
}
while(!feof(yyin));
printf("numbers = %d\nkeywords = %d\nidentifiers = %d\noperator = %d\n",dig,key,id,op);
}
void yyerror()
{
printf("parse error message");
exit(-1);
}     
