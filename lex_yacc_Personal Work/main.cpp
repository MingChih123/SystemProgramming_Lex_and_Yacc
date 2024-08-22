#include "main.h"
#include "y.tab.h"
 
extern int yyparse(void);
extern FILE* yyin; //yyin�� ���V�nŪ�����ɮצ�m

int main()
{
    const char* sFile = "file.txt";//�ɦW 
    FILE* fp = fopen(sFile, "r");//�}�Ҹ��ɡA��"Ū��" 
    if (fp == NULL) 
	{
        printf("cannot open %s\n", sFile);
        return -1; 
    }
    //yytext �����V�ثeŪ���쪺��r 
    yyin = fp;//�ɮת���m�]��yyin 
    yyparse();//main��ƬO�I�syacc�ѪR�J�f���yyparse()�C 
    fclose(fp);
    return 0;
}


