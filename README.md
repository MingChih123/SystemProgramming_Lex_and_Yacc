# SystemProgramming Lex and Yacc
姓名：李名智  
學號：1102924  
主題：Lex and Yacc  
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
![image](https://github.com/user-attachments/assets/76c33cba-57d4-41ee-8dee-699523f7c0f1)  
- 規則
![image](https://github.com/user-attachments/assets/01d40f66-154c-4d2e-858f-645184dac961)  
- 子程式
  - yywrap()：用來判斷還有沒有文件要讀取 
![image](https://github.com/user-attachments/assets/24a16188-0c61-4a88-9d07-ccfbb730bb16)  
## Yacc（.y檔） 
- 主要架構：規則定義Grammar型式（先定義有甚麼Token，Lex才有辦法判斷）  
![image](https://github.com/user-attachments/assets/da4acc41-f20e-4de0-a027-76584b9c083e)
- 宣告、定義
![image](https://github.com/user-attachments/assets/0c3ae66e-49d4-4e91-875f-9691c324cbf4)  
- 規則
![image](https://github.com/user-attachments/assets/43fcddeb-8ad1-48a0-95e9-c497053809eb)   
  - YACC原始程式風格：  
    - 終端符名全部用大寫字母，非終端符全部用小寫字母  
    - 把語法規則和語義動作放在不同的行  
    - 把左部相同的規則寫在一起，左部只寫一次，而後面所有規則都寫在豎線“|”之後  
    - 把分號";"放在規則最後，獨佔一行  
    - 用製表符來對齊規則和動作。
![image](https://github.com/user-attachments/assets/34dd99a5-2225-46cc-9ec7-6e8d21b591e8)  
- 子程式
  - yyerror()：yacc的錯誤處理  
![image](https://github.com/user-attachments/assets/e4b0051c-8b92-4529-9d4a-ac2c1391a689)
## 主程式（mian.cpp）
![image](https://github.com/user-attachments/assets/dce80616-b9ec-44a4-88a3-74ceb5abe2c1)
- file.txt：輸入算式，例如：
  - (1+2+3)*20-(-15)=
## 編譯指令
```bash
bison -d y.y  
flex l.l  
g++ -c y.tab.c  
g++ -c lex.yy.c
g++ -c main.cpp
g++ main.o lex.yy.o y.tab.o -o main  
.\main   
```
## 結果
1.單純計算  
![image](https://github.com/user-attachments/assets/e3548b9d-aacc-42f9-b826-266acb8497a8)  
正確答案應為：135  
![image](https://github.com/user-attachments/assets/801ed2e4-c648-435c-beb8-a0d6242e1fbb)  
Result: 135  

2.測試除數為零時   
![image](https://github.com/user-attachments/assets/ef9615db-4f96-40a4-87c0-6573fb147ecc)  
Result: Error: divisor cannot be zero!  
