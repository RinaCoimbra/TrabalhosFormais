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

/*Definição de Fabricante*/
FABRICANTE LG|Dazz|Positivo|Samsung|Alcatel-Lucent|ASUS|Canon|Alcatel|BenQ|BlackBerry|Blu|Ericsson|High|Huawei|IGB|Jolla|Kyocera|Lenovo|LG|Microsoft|Motorola|Multilaser|NEC|Nokia|Palm|Pantech|Samsung|Sanyo|Sharp|Sony|Toshiba|Vertu|ZTE|HTC|Aple|Casio|CCE|Dynacom|GE|Semp|TCE|AOC|AUO|Chimei|Era|Great|Proton|Sinai|Tatung|Ultmost|Viewsonic|Vizio|Changhong|Funai|Haier|Hisense|Konka|Panda|Skyworth|TCL|TPV|Xoceco|JVC|Mitsubishi|Panasonic|Blaupunkt|Grundig|Loewe|Telefunken|Insignia|Westinghouse|Philips|Thomson|SIM2|Vestel

EXT_fABRICANTE Electronics‎|Eletrônica|Mobile|Mobility|Corporation|Tech|Inc|Products|Curitel|Computer|Toshiba|Sun

/*Definição dos números ordinais pertinentes*/
ORDINAIS 1º|primeiro|2º|segundo|3º|terceiro|4º|quarto|5º|quinto|6º|sexto|7º|sétimo|8º|oitavo|9º|nono|10º|décimo|11º|décimo|12º|décimo|13º|14º|15º
EXT_ORDINAIS primeiro|segundo|terceiro|quarto|quinto

/*Definição de data (rel. a % de variação da venda)*/
PRE_DATA neste|Neste|corrente|presente|atual|último|Último
DATA ano|mês|semestre|trimestre|quadrimestre|período|metade
POS_DATA corrente|presente|atual|último|anterior|passado

/*Preposições*/
PREP a|A|ao|Ao|à|À|aos|Aos|às|Às|de|De|do|Do|da|Da|dos|Dos|das|Das|em|Em|no|No|na|Na|nos|Nos|nas|Nas|num|Num|numa|Numa|nuns|Nuns|numas|Numas|por|Por|pelo|Pelo|pela|Pela|pelos|Pelos|pelas|Pelas


SIMBOLOS_MONETARIOS_PRE R$|US$

SIMBOLOS_MONETARIOS_POS reais|dólares

VALOR_POS mil|milhões|milhão|bilhões|bilhão|trilhões|trilhão

SPACE " "|\t
%%

({PRE_DATA}{SPACE})?({ORDINAIS}{SPACE}|{ORDINAIS}{SPACE}{EXT_ORDINAIS}{SPACE})?{DATA}{POS_DATA}?		{printf("\n\t> Data: %s END\n", yytext);}	
{FABRICANTE}{SPACE}+({EXT_fABRICANTE}|{EXT_fABRICANTE}{SPACE}+)*		{printf("\n\t> Fabricante: %s END\n", yytext);}

" "([0-9])+(("."|",")([0-9])+)?"%"[^a-zA-Z0-9]				{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
^([0-9])+(("."|",")([0-9])+)?"%"[^a-zA-Z0-9]				{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
" "([0-9])+(("."|",")([0-9])+)?" porcento"[^a-zA-Z0-9]		{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
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


