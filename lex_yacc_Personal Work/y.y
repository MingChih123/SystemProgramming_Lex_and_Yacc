%{
#include "main.h"

void yyerror(const char *s);
extern int yylex(); /*用來讀取lex判斷的檔案或文字 */
extern int yyparse();

%}

%token NUMBER
%left '+' '-'          /* %left:(1+2)+3 */
%left '*' '/'          /* %right:1+(2+3)*/ 
%nonassoc UMINUS       /* %nonassoc:用來表示最高優先級  解決"負號"跟"減法"為同一個符號的問題*/


%%

func:
      expr '='              { printf("Result: %d\n", $1);/*輸出計算結果*/ }
    ;

expr:
      NUMBER                { $$ = $1; }
    | expr '+' expr         { $$ = $1 + $3; }
    | expr '-' expr         { $$ = $1 - $3; }
    | expr '*' expr         { $$ = $1 * $3; }
    | expr '/' expr         
		{ 
			if ($3 == 0.0) 
			{ /*避免除以零的問題！*/ 
                yyerror("Error: divisor cannot be zero!"); 
                YYABORT; 
            } 
			else 
			{ 
                $$ = $1 / $3; 
            } 
		}
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'          { $$ = $2; }
    ;

%%

void yyerror(const char *s) 
{
    cerr << s << endl;//yacc錯誤處理 
}
