%{
	/* need this for the call to atof() below */
#include <math.h>
	/* need this for printf(), fopen() and stdin below */
#include <stdio.h>
	/* need this for string manipulation */
#include <string.h>	
	/* need this for file manipulation */
#include <stdlib.h>
%}
FABRICANTES LG|Samsung|Alcatel-Lucent|Alcatel|BenQ|BlackBerry|Blu|Ericsson|High|Huawei|IGB|Jolla|Kyocera|Lenovo|LG|Microsoft|Motorola|Multilaser|NEC|Nokia|Palm|Pantech|Samsung|Sanyo|Sharp|Sony|Toshiba|Vertu|ZTE
EXT_fABRICANTE Electronics‎|Eletrônica|Mobile|Mobility|Corporation|Tech|Inc|Products|Curitel
DATACORRENTE neste
%%

{FABRICANTES}{EXT_fABRICANTE}*		{printf("\n\t> Fabricante: %s END\n", yytext);}	
{DATACORRENTE}		{printf("\n\t > Data (corrente): %s END\n", yytext);}
" "([0-9])+("."([0-9])+)?"%"[^a-zA-Z0-9]		{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
^([0-9])+("."([0-9])+)?"%"[^a-zA-Z0-9]			{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
" "([0-9])+("."([0-9])+)?" porcento"[^a-zA-Z0-9]			{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
%%
char *increment(char *text, char *add){	
	int size = 0;
	size = strlen(text)+strlen(add);
	char *aux;
	aux = malloc( (strlen(text)+1) * sizeof (char));
	strcpy(aux,text);
	text = malloc( (size+1) * sizeof (char));
	strcpy(text,aux);
	strcat(text,add);
	return text;
}

int main(int argc, char *argv[])
{
	++argv, --argc; /* skip over program name */
	if (argc > 0)
		yyin = fopen(argv[0], "r");
	else
		yyin = stdin;
	int val = 0;
	int arg = 1;	
	char *text;
	text = malloc( 1 * sizeof (char));
	text[0] = '\0';
	while(val = yylex()) {
		if(val==1){
			text=increment(text,yytext);
		}
		if(val==2){
			FILE * fp;
			if(arg==1){
				fp = fopen ("extraction.txt", "w+");
			}else{
				fp = fopen ("extraction.txt", "a");
			}							
			fprintf(fp, "Argument %d: %s\n", arg, text);
			fclose(fp);			
			printf("Argument %d: %s", arg, text);
			arg++;
			text = malloc( 1 * sizeof (char));
			text[0] = '\0';
		}				 		
	}	 
}	
int yywrap()
{
	return 1;
}


