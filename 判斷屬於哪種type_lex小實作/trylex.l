%{
#include <stdio.h>
%}
%option yylineno

alpha [a-zA-Z]
digit [0-9]
unary "++"|"--"

%%
if |
else | 
printf {printf("\n%s is a keyword.", yytext);}
[-]?[0-9]+ {printf("\n%s is a number.", yytext);}
[a-zA-Z]({alpha}|{digit})* {printf("\n%s is a id.",yytext);}
{unary} {printf("\n%s is a unary.", yytext); }
.|\n {ECHO;}
%%

int main()
{
	printf("\n Enter the String:");
	yylex();
}

int yywrap()
{
	return 1;
}
