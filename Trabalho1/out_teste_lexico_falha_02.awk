java LEXICO
Reading from standard input...
(1, 1)		 BEGINFUNCAO	 		 BEGIN
(1, 7)		 ESCOPOFUNCAOB	 		 {
(3, 9)		 ID	 				 	 i
(3, 10)		 ASSIGNMENTEQ	 		 =
(3, 11)		 INT	 				 0
(3, 12)		 PONTOVIRGULA	 		 ;
(5, 9)		 WHILE	 				 while
(5, 15)		 ESCOPOPARAMB	 		 (
(5, 16)		 ID	 		 			 i
(5, 17)		 INCREMENT	 		 	 ++
(5, 19)		 OPLESS	 		 		 <
(5, 20)		 INT	 		 		 1000000
(5, 27)		 ESCOPOPARAME	 		 )
(6, 9)		 ESCOPOFUNCAOB	 		 {
(7, 17)		 ID	 		 			 x
(7, 19)		 ASSIGNMENTEQ	 		 =
(7, 21)		 NFINT	 				 int
(7, 25)		 ESCOPOPARAMB	 		 (
(7, 26)		 RAND	 				 rand
(7, 30)		 ESCOPOPARAMB	 		 (
(7, 31)		 ESCOPOPARAME	 		 )
(7, 32)		 MULT	 				 *
(7, 33)		 INT	 				 100
(7, 37)		 ADD	 				 +
(7, 39)		 FLOAT	 				 0.5
(7, 42)		 ESCOPOPARAME	 		 )
(8, 17)		 ID	 		 			 y
(8, 18)		 ESCOPOVECTORB	 		 [
(8, 19)		 ID	 		 			 x
(8, 20)		 ESCOPOVECTORE	 		 ]

Makefile:20: recipe for target 'lrun' failed

Exception in thread "main" TokenMgrError: Erro lexico na linha 8, coluna 22.  Encontrou: "\"" (34), depois : "\""
	at LEXICOTokenManager.getNextToken(LEXICOTokenManager.java:1422)
	at LEXICO.jj_ntk(LEXICO.java:601)
	at LEXICO.AnalisadorLexico(LEXICO.java:38)
	at LEXICO.main(LEXICO.java:21)
make: *** [lrun] Error 1