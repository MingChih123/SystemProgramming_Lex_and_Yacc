%{
#include "main.h"

void yyerror(const char *s);
extern int yylex(); /*�Ψ�Ū��lex�P�_���ɮשΤ�r */
extern int yyparse();

%}

%token NUMBER
%left '+' '-'          /* %left:(1+2)+3 */
%left '*' '/'          /* %right:1+(2+3)*/ 
%nonassoc UMINUS       /* %nonassoc:�ΨӪ�̰ܳ��u����  �ѨM"�t��"��"��k"���P�@�ӲŸ������D*/


%%

func:
      expr '='              { printf("Result: %d\n", $1);/*��X�p�⵲�G*/ }
    ;

expr:
      NUMBER                { $$ = $1; }
    | expr '+' expr         { $$ = $1 + $3; }
    | expr '-' expr         { $$ = $1 - $3; }
    | expr '*' expr         { $$ = $1 * $3; }
    | expr '/' expr         
		{ 
			if ($3 == 0.0) 
			{ /*�קK���H�s�����D�I*/ 
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
    cerr << s << endl;//yacc���~�B�z 
}
