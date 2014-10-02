/* Motivo de falha: Token nao encontrado: "@" */

java LEXICO
Reading from standard input...
(1, 1)		 BEGINFUNCAO	 		 BEGIN
(1, 7)		 ESCOPOFUNCAOB	 		 {
(3, 9)		 ID	 					 mystring
(3, 17)		 ASSIGNMENTEQ	 		 =
(3, 18)		 STRING	 		 		 "How are you doing today?"
(5, 9)		 PRINT	 		 		 print
(5, 15)		 LENGTH	 		 		 length
(5, 21)		 ESCOPOPARAMB	 		 (
(5, 22)		 ID	 		 			 mystring
(5, 30)		 ESCOPOPARAME	 		 )
(7, 9)		 PRINT	 		 		 print
(7, 15)		 INDEX	 		 		 index
(7, 20)		 ESCOPOPARAMB	 		 (
(7, 21)		 ID	 		 			 mystring
(7, 29)		 VIRGULA	 		 	 ,
(7, 30)		 STRING	 		 		 "you"
(7, 35)		 ESCOPOPARAME	 		 )
(9, 9)		 PRINT	 				 print
(9, 15)		 TOLOWER	 		 	 tolower
(9, 22)		 ESCOPOPARAMB	 		 (
(9, 23)		 ID	 		 			 mystring
(9, 31)		 ESCOPOPARAME	 		 )
(11, 9)		 PRINT	 		 		 print
(11, 15)	 TOUPPER	 		 	 toupper
(11, 22)	 ESCOPOPARAMB	 		 (
(11, 23)	 ID	 		 			 mystring
(11, 31)	 ESCOPOPARAME	 		 )
(13, 9)		 ID	 		 			 mysub
(13, 14)	 ASSIGNMENTEQ	 		 =
(13, 15)	 SUBSTR	 			 	 substr
(13, 21)	 ESCOPOPARAMB	 		 (
(13, 22)	 ID	 		 			 mystr
(13, 27)	 VIRGULA	 		 	 ,
(13, 28)	 ID	 		 			 startpos
(13, 36)	 VIRGULA	 		 	 ,
(13, 37)	 ID	 		 			 maxlen
(13, 43)	 ESCOPOPARAME	 		 )
(15, 9)		 PRINT	 		 		 print
(15, 15)	 SUBSTR	 		 		 substr
(15, 21)	 ESCOPOPARAMB	 		 (
(15, 22)	 ID	 		 			 mystring
(15, 30)	 VIRGULA	 		 	 ,
(15, 31)	 INT	 		 		 9
(15, 32)	 VIRGULA	 		 	 ,

Makefile:20: recipe for target 'lrun' failed

Exception in thread "main" TokenMgrError: Erro lexico na linha 15, coluna 33.  Encontrou: "@" (64), depois : ""
	at LEXICOTokenManager.getNextToken(LEXICOTokenManager.java:1422)
	at LEXICO.jj_ntk(LEXICO.java:601)
	at LEXICO.AnalisadorLexico(LEXICO.java:38)
	at LEXICO.main(LEXICO.java:21)
make: *** [lrun] Error 1
