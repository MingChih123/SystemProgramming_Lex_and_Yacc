#include "main.h"
#include "y.tab.h"
 
extern int yyparse(void);
extern FILE* yyin; //yyin為 指向要讀取的檔案位置

int main()
{
    const char* sFile = "file.txt";//檔名 
    FILE* fp = fopen(sFile, "r");//開啟該檔，並"讀取" 
    if (fp == NULL) 
	{
        printf("cannot open %s\n", sFile);
        return -1; 
    }
    //yytext 為指向目前讀取到的文字 
    yyin = fp;//檔案的位置設給yyin 
    yyparse();//main函數是呼叫yacc解析入口函數yyparse()。 
    fclose(fp);
    return 0;
}


