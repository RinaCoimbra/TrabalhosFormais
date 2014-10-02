java LEXICO
Reading from standard input...
(1, 1)		 ESCOPOFUNCAOB	 		 {
(2, 5)		 ID	 		 			 line
(2, 10)		 ASSIGNMENTEQ	 		 =
(2, 12)		 FDREF	 		 		 $
(2, 13)		 INT	 		 		 0
(2, 14)		 PONTOVIRGULA	 		 ;
(3, 5)		 WHILE	 		 		 while
(3, 11)		 ESCOPOPARAMB	 		 (
(3, 12)		 SUBSTR	 		 		 substr
(3, 19)		 ESCOPOPARAMB	 		 (
(3, 20)		 ID	 		 			 line
(3, 24)		 VIRGULA	 		 	 ,
(3, 26)		 LENGTH	 		 		 length
(3, 33)		 ESCOPOPARAMB	 		 (
(3, 34)		 ID	 		 			 line
(3, 38)		 ESCOPOPARAME	 		 )
(3, 39)		 VIRGULA	 		 	 ,
(3, 40)		 INT	 		 		 1
(3, 41)		 ESCOPOPARAME	 		 )
(3, 43)		 EQEQ	 		 		 ==
(3, 46)		 STRING	 		 		 "\\"
(3, 50)		 ESCOPOPARAME	 		 )
(3, 52)		 ESCOPOFUNCAOB	 		 {
(5, 9)		 ID	 		 			 line
(5, 14)		 ASSIGNMENTEQ	 		 =
(5, 16)		 SUBSTR	 		 		 substr
(5, 23)		 ESCOPOPARAMB	 		 (
(5, 24)		 ID	 		 			 line
(5, 28)		 VIRGULA	 		 	 ,
(5, 30)		 INT	 		 		 1
(5, 31)		 VIRGULA	 			 ,
(5, 33)		 LENGTH	 		 		 length
(5, 40)		 ESCOPOPARAMB	 		 (
(5, 41)		 ID	 		 			 line
(5, 45)		 ESCOPOPARAME	 		 )
(5, 47)		 SUB	 		 		 -
(5, 49)		 INT	 		 		 1
(5, 50)		 ESCOPOPARAME	 		 )
(5, 51)		 PONTOVIRGULA	 		 ;
(6, 9)		 INT	 		 		 1

Makefile:20: recipe for target 'lrun' failed

Exception in thread "main" TokenMgrError: Erro lexico na linha 6, coluna 10.  Encontrou: "\u00ba" (186), depois : ""
	at LEXICOTokenManager.getNextToken(LEXICOTokenManager.java:1422)
	at LEXICO.jj_ntk(LEXICO.java:601)
	at LEXICO.AnalisadorLexico(LEXICO.java:38)
	at LEXICO.main(LEXICO.java:21)
make: *** [lrun] Error 1
