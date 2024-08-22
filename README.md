# SystemProgramming Lex and Yacc
[詳細說明](https://github.com/MingChih123/SystemProgramming_Lex_and_Yacc/blob/main/Lex_and_Yacc%E4%BB%8B%E7%B4%B9.pdf)
# Lex and Yacc
## 整體流程、編譯流程
- 整體流程
![image](https://github.com/user-attachments/assets/22209a22-5e97-49f7-90b2-957a69b57a4c)  
- 編譯流程
![image](https://github.com/user-attachments/assets/4320e72b-acf1-4add-9a0a-d348ea3e5281)  

## Lex（.l檔） 
- 主要架構：規則定義Token型式  
![image](https://github.com/user-attachments/assets/da4acc41-f20e-4de0-a027-76584b9c083e)  
- 宣告、定義
- 規則
- 子程式
  - yywrap()：用來判斷還有沒有文件要讀取 
## Yacc（.y檔） 
- 主要架構：規則定義Grammar型式（先定義有甚麼Token，Lex才有辦法判斷）  
![image](https://github.com/user-attachments/assets/da4acc41-f20e-4de0-a027-76584b9c083e)
- 宣告、定義
- 規則
![image](https://github.com/user-attachments/assets/43fcddeb-8ad1-48a0-95e9-c497053809eb)   
  - YACC原始程式風格：  
    - 終端符名全部用大寫字母，非終端符全部用小寫字母  
    - 把語法規則和語義動作放在不同的行  
    - 把左部相同的規則寫在一起，左部只寫一次，而後面所有規則都寫在豎線“|”之後  
    - 把分號";"放在規則最後，獨佔一行  
    - 用製表符來對齊規則和動作。
- 子程式
  - yyerror()：yacc的錯誤處理 
