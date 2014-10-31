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

ORDINAIS 1º|primeiro|2º|segundo|3º|terceiro|4º|quarto|5º|quinto|6º|sexto|7º|sétimo|8º|oitavo|9º|nono|10º|décimo|11º|décimo|12º|décimo|13º|14º|15º|primeira|segunda|terceira|quarta|quinta|sexta|sétima|oitava|nona|décima|décima|décima

/*Definição de data (rel. a % de variação da venda)*/
PRE_DATA corrente|presente|atual|último|Último|últimos|Últimos|última|Última|últimas|Últimas|desde|Desde|anterior|passado|passados|passada|passadas|próximo|próximos|próxima|durante|ao|longo|pré|Pré
   
/*P: períodos:*/
P (minuto|hora|Horas|dia|dias|quinzena|quinzenas|semana|semanas|mês|meses|semestre|semestres|trimestre|trimestres|quadrimestre|quadrimestres|período|períodos|metade|ano|anos|Janeiro|janeiro|Fevereiro|fevereiro|Março|março|Abril|abril|Maio|maio|Junho|junho|Julho|julho|Agosto|agosto|Setembro|setembro|Outubro|outubro|Novembro|novembro|Dezembro|dezembro)
POS_DATA (corrente|presente|atual|anterior|próximo|próxima|passado|passados|passada|passadas|último|Último|últimos|Últimos|última|Última|últimas|Últimas)
NUM (zero|um|dois|três|quatro|cinco|seis|sete|oito|nove|dez|onze|doze|treze|quatorze|catorze|quinze|dezesseis|dezessete|dezoito|dezenove|vinte|vinte|vinte|trinta|trinta)
DIA_SEM (segunda|terça|quarta|quinta|sexta|sábado|domingo)
EXT_DIA (-feira)

/*Preposições*/
PREP (a|A|o|O|os|Os|ao|Ao|à|À|aos|Aos|às|Às|de|De|do|Do|da|Da|dos|Dos|das|Das|deste|Deste|destes|Destes|em|Em|no|No|na|Na|nos|Nos|nas|Nas|nesta|Nesta|neste|Neste|num|Num|numa|Numa|nuns|Nuns|numas|Numas|por|Por|pelo|Pelo|pela|Pela|pelos|Pelos|pelas|Pelas)
SEP (\/|do|de|-)

/*Definição de Fabricante*/
FABRICANTE (LG|Dazz|Positivo|Samsung|Alcatel-Lucent|ASUS|Canon|Alcatel|BenQ|BlackBerry|Blu|Ericsson|High|Huawei|IGB|Jolla|Kyocera|Lenovo|Microsoft|Motorola|Multilaser|NEC|Nokia|Palm|Pantech|Samsung|Sanyo|Sharp|Sony|Toshiba|Vertu|ZTE|HTC|Aple|Casio|CCE|Dynacom|GE|Semp|TCE|AOC|AUO|Chimei|Era|Great|Proton|Sinai|Tatung|Ultmost|Viewsonic|Vizio|Changhong|Funai|Haier|Hisense|Konka|Panda|Skyworth|TCL|TPV|Xoceco|JVC|Mitsubishi|Panasonic|Blaupunkt|Grundig|Loewe|Telefunken|Insignia|Westinghouse|Philips|Thomson|SIM2|Vestel)

EXT_fABRICANTE (Electronics‎|Eletrônica|Mobile|Mobility|Corporation|Tech|Inc|Products|Curitel|Computer|Toshiba|Sun)

SIMBOLOS_MONETARIOS_PRE (R$|US$)

SIMBOLOS_MONETARIOS_POS (reais|d(o|ó)lares)

VALOR_POS (mil|milh(o|õ)es|milh(a|ã)o|bilh(o|õ)es|bilh(a|ã)o|trilh(o|õ)es|trilh(a|ã)o)

DISPOSITIVO (iPod(s)?|iPad(s)?|iPhone(s)?|(t|T)ablet(s)?|(s|S)martphone(s)?|(c|C)elular(es)?|TV(s)?|(s|S)martTV(s)?|(t|T)elevisão|(t|T)elevisor(es?)|(d|D)esktop(s)?|(c|C)omputador(es)?" "de" "mesa|(c|C)omputador(es?)" "portát(il|eis)|(n|N)otebook(s)?|(l|L)aptop(s)?|(c|C)(a|â)mera(s)?(" "((d|D)igita(l|is)|(f|F)otogr(a|a)fica(s)?))?|goPro(s)?)

SPACE (" "|\t)
%%
[ \t\n]+	; 	/* eat up white space */


(({PREP}|{PRE_DATA}|{NUM}|[0-9]{1,4}))*([^a-zA-Z0-9]{ORDINAIS}{SPACE}?)*([^a-zA-Z0-9]({DIA_SEM}{EXT_DIA}?|{P}|[0-9]{1,4}{SPACE}?{SEP}{SPACE}?[0-9]{1,2}{SPACE}?{SEP}{SPACE}?[0-9]{1,4}))+([^a-zA-Z0-9](({PREP}{SPACE})?({POS_DATA}|{P}|{ORDINAIS}|{SPACE}|[0-9]{1,4})))*[^a-zA-Z0-9]		{printf("\n\t> Período: %s END\n", yytext); return 2;}	

{FABRICANTE}([^a-zA-Z0-9])({EXT_fABRICANTE}|{EXT_fABRICANTE}{SPACE}+)*								{printf("\n\t> Fabricante: %s END\n", yytext);}

([0-9])+(("."|",")([0-9])+)?"%"																							{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}
([0-9])+(("."|",")([0-9])+)?" porcento"[^a-zA-Z0-9]																		{printf("\n\tA OCORRÊNCIA: %s END\n", yytext);}

{SIMBOLOS_MONETARIOS_PRE}{SPACE}*([0-9])+((("."|",")([0-9]){2})?|(("."|",")([0-9]){1})?{SPACE}{VALOR_POS})				{printf("\n\t> Preco: %s END\n", yytext);}
{SIMBOLOS_MONETARIOS_PRE}{SPACE}*([0-9]{1,3})("."[0-9]{3})*(((",")([0-9]){2})?|((",")([0-9]){1})?({SPACE}{VALOR_POS}))	{printf("\n\t> Preco: %s END\n", yytext);}
{SIMBOLOS_MONETARIOS_PRE}{SPACE}*([0-9]{1,3})(","[0-9]{3})*(((".")([0-9]){2})?|((".")([0-9]){1})?({SPACE}{VALOR_POS}))	{printf("\n\t> Preco: %s END\n", yytext);}

{DISPOSITIVO} {printf("\n\t> DISPOSITIVO: %s END\n", yytext);}

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


