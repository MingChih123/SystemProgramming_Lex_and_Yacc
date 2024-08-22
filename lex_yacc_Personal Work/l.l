%{
#include "main.h"
#include "y.tab.h"
%}

number      ([0-9]+)
blank_chars ([ \f\r\t\v]+)
expressions ([-+*/()])

%%

{number}        { yylval = atoi(yytext); return NUMBER;/*將讀入字串轉成int，並將值存入yylval*/ }
{expressions}   { return yytext[0];/*讀到符號時直接回傳符號*/ }
{blank_chars}   { ;/*若為空白甚麼事都不用做*/ }
"="             { return yytext[0]; }
\n              { ; }

%%

int yywrap(void) 
{
    return 1;//若讀取完，後面沒有動作了就return 1 
}
