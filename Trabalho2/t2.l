/*
*							TRABALHO 2 
*    EXTRACAO DE INFORMACOES DE SENTENCAS UTILIZANDO EXPRESSOES REGULARES 				
*   			 SSC205 - TEORIA DA COMPUTACAO E LINGUAGENS FORMAIS			
*					 
*	PROFA:    Sandra Aluisio
*
*	TEMA:	  Lançamentos de smartphones/tablets/máquina fotográfica/gps/go pro/smart tv
*
*	GRUPO 20: Carlos Humberto S. Baqueta
*			  Jaqueline M. Arai
*			  Marina Coimbra
**/
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

/* --------------- Data --------------- */

ORDINAIS (1º|primeiro|2º|segundo|3º|terceiro|4º|quarto|5º|quinto|6º|sexto|7º|sétimo|8º|oitavo|9º|nono|10º|décimo|11º|décimo|12º|décimo|13º|14º|15º|primeira|segunda|terceira|quarta|quinta|sexta|sétima|oitava|nona|décima|décima|décima)

EXT_ORD (primeir(o|a)|segund(o|a)|terceir(o|a)|quart(o|a)|quint(o|a)|sext(o|a)|sétim(o|a)|oitav(o|a)|non(o|a))

PRE_DATA (corrente|presente|atual|último|Último|últimos|Últimos|última|Última|últimas|Últimas|desde|Desde|anterior|passado|passados|passada|passadas|próximo|próximos|próxima|próximas|durante|ao|longo|pré|Pré|final|(s|S)ó)
   
P (minuto|hora|Horas|dia|dias|quinzena|quinzenas|semana|semanas|mês|meses|semestre|semestres|trimestre|trimestres|quadrimestre|quadrimestres|período|períodos|metade|ano|anos|Janeiro|janeiro|Fevereiro|fevereiro|Março|março|Abril|abril|Maio|maio|Junho|junho|Julho|julho|Agosto|agosto|Setembro|setembro|Outubro|outubro|Novembro|novembro|Dezembro|dezembro|(H|h)oje|(A|a)manhã|(O|o)ntem)

DATA_POS (corrente|presente|atual|anterior|próximo|próxima|passado|passados|passada|passadas|último|Último|últimos|Últimos|última|Última|últimas|Últimas|vem)

NUM (zero|um|dois|três|quatro|cinco|seis|sete|oito|nove|dez|onze|doze|treze|quatorze|catorze|quinze|dezesseis|dezessete|dezoito|dezenove|vinte|vinte|vinte|trinta|trinta)

DIA_SEM (segunda|terça|quarta|quinta|sexta|sábado|domingo)

EXT_DIA (-feira)

/* ------------- Fabricante ------------ */

FABRICANTE (LG|Dazz|Positivo|Samsung|Google|Alcatel-Lucent|ASUS|Canon|Alcatel|BenQ|BlackBerry|Blu|Ericsson|High|Huawei|IGB|Jolla|Kyocera|Lenovo|Microsoft|Motorola|Multilaser|NEC|Nokia|Palm|Pantech|Samsung|Sanyo|Sharp|Sony|Toshiba|Vertu|ZTE|HTC|Apple|Casio|CCE|Dynacom|GE|Semp|TCE|AOC|AUO|Chimei|Era|Great|Proton|Sinai|Tatung|Ultmost|Viewsonic|Vizio|Changhong|Funai|Haier|Hisense|Konka|Panda|Skyworth|TCL|TPV|Xoceco|JVC|Mitsubishi|Panasonic|Blaupunkt|Grundig|Loewe|Telefunken|Insignia|Westinghouse|Philips|Thomson|SIM2|Vestel)

EXT_fABRICANTE (Electronics‎|Eletrônica|Mobile|Mobility|Corporation|Tech|Inc|Products|Curitel|Computer|Toshiba|Sun|Inc.)

/* --------------- Preco --------------- */

SIMBOLOS_MONETARIOS_PRE (R$|US$)

SIMBOLOS_MONETARIOS_POS (reais|d(o|ó)lares)

PREPOSICOES_MONETARIAS (de)

VALOR_POS (mil|milh(o|õ)es|milh(a|ã)o|bilh(o|õ)es|bilh(a|ã)o|trilh(o|õ)es|trilh(a|ã)o)

/* ------------ Dispositivo ------------ */

DISPOSITIVO (iPod(s)?|iPad(s)?|iPhone(s)?|(t|T)ablet(s)?|(s|S)martwatch(es)?|(s|S)martphone(s)?|(c|C)elular(es)?|TV(s)?|(s|S)mart(" ")?TV(s)?|(t|T)elevis(a|ã)o|(t|T)elevisor(es?)|(d|D)esktop(s)?|(c|C)omputador(es)?" "de" "mesa|(c|C)omputador(es?)" "port(a|á)t(il|eis)|(n|N)otebook(s)?|(l|L)aptop(s)?|(c|C)(a|â)mera(s)?(" "((d|D)igita(l|is)|(f|F)otogr(a|a)fica(s)?))?|goPro(s)?)

/* ------------- Auxiliares ------------ */

PREP (a|A|o|O|os|Os|ao|Ao|à|À|aos|Aos|às|Às|de|De|do|Do|da|Da|dos|Dos|das|Das|este|Este|deste|Deste|destes|Destes|em|Em|no|No|na|Na|nos|Nos|nas|Nas|nesta|Nesta|neste|Neste|num|Num|numa|Numa|nuns|Nuns|numas|Numas|por|Por|pelo|Pelo|pela|Pela|pelos|Pelos|pelas|Pelas|que)

SEP (\/|do|de|-)

SPACE (" "|\t)

PONTOS (.|,|;)

%%

(({PREP}|{PRE_DATA}|{NUM}|[0-9]{1,4})[^a-zA-Z0-9])*({ORDINAIS}({SPACE}{EXT_ORD})?[^a-zA-Z0-9])?(({DIA_SEM}{EXT_DIA}?|{P}|[0-9]{1,4}{SPACE}?{SEP}{SPACE}?[0-9]{1,2}{SPACE}?{SEP}{SPACE}?[0-9]{1,4}|(1|2)([0-9]){3}({PONTOS}|{SPACE}))[^a-zA-Z0-9])+((({PREP}{SPACE})?({DATA_POS}|{P}|{ORDINAIS}|{SPACE}|[0-9]{1,4}))[^a-zA-Z0-9])*		{return 1;}	

{FABRICANTE}([^a-zA-Z0-9])({EXT_fABRICANTE}|{EXT_fABRICANTE}{SPACE}+)*	{return 2;}

((([0-9])+(("."|",")([0-9]){1,2})?)|(([0-9]{1,3})((("."[0-9]{3})*(","([0-9]){1,2})?)|((","[0-9]{3})*("."([0-9]){1,2})?))))({SPACE}{VALOR_POS})?({SPACE}{PREPOSICOES_MONETARIAS})?{SPACE}{SIMBOLOS_MONETARIOS_POS}	{return 3;}
{SIMBOLOS_MONETARIOS_PRE}{SPACE}*((([0-9])+(("."|",")([0-9]){1,2})?)|((([0-9]{1,3})("."[0-9]{3})*(","([0-9]){1,2})?)|(([0-9]{1,3})(","[0-9]{3})*("."([0-9]){1,2})?)))({SPACE}{VALOR_POS})?							{return 3;}

{DISPOSITIVO} {return 4;}

[0-9]+(("."|",")([0-9])*)?{SPACE}?("polegadas"|"''"|"\""|"'"|"″")	{return 5;}

%%

int main(int argc, char *argv[])
{
	FILE *fp;
	FILE *fp_in;
	FILE *fp_trash;
	int val = 0;
	int len = 0;	
	int num_exp=0;
	char text[100];
	char periodo[] = {'P', 'e', 'r', 'i', 'o', 'd', 'o', 0};
	char fabricante[] = {'F', 'a', 'b', 'r', 'i', 'c', 'a', 'n', 't', 'e', 0};
	char preco[] = {'P', 'r', 'e', 'c', 'o', 0};
	char dispositivo[] = {'D', 'i', 's', 'p', 'o', 's', 'i', 't', 'i', 'v', 'o', 0};
	char tam_tela[] = {'T', 'a', 'm', 'a', 'n', 'h', 'o', ' ', 'd', 'a', ' ', 't', 'e', 'l', 'a', 0};
	char str[100];

	++argv, --argc; /* skip over program name */
	if (argc > 1){
		num_exp = atoi(argv[0]); // Numero do experimento/teste
		fp_in = fopen(argv[1], "r");
	} else {
		// imprime algum erro ...
	}

	fp = fopen ("extraction.out", "a+");
	fprintf(fp, "\n__________________________________________________________________________________");
	fprintf(fp, "\n > Teste %d\n", num_exp);
	fprintf(fp, "\tSentença:\n\n\t");

	while( (fscanf (fp_in, "%s", str)) != EOF){
		fprintf(fp, " %s", str);
	}
	fprintf(fp, "\n\n\tExtração:\n");

	rewind(fp_in);
	yyin = fp_in;

	/* Manda a saida do flex para o arquivo trash.out a fim de evitar imprimir lixo na tela */
	fp_trash = fopen ("trash.out", "w+");
	yyout = fp_trash;

	if(num_exp == 1)
		printf("\n Extraindo dados....\n");


	while(val = yylex()) {
		if(val == 1){ // Casou com o padrão de data
			strncpy(text, yytext, 100);
			len = strlen(text);
			text[len-1] = '\0';
			fprintf(fp, "\n\t %s: %s", periodo, text);
		} else if(val == 2){ // Casou com o padrão de fabricante
			fprintf(fp, "\n\t %s: %s", fabricante, yytext);
		} else if(val == 3){ // Casou com o padrão de preco
			fprintf(fp, "\n\t %s: %s", preco, yytext);
		} else if(val == 4){ // Casou com o padrão de dispositivo
			fprintf(fp, "\n\t %s: %s", dispositivo, yytext);
		} else if(val == 5){ // Casou com o padrão de tamanho de tela
			fprintf(fp, "\n\t %s: %s", tam_tela, yytext);
		} 			 		
	}

	if(num_exp == 12){
		fprintf(fp, "\n\n");
		printf("\n Terminado.\n");
		printf("\n Digite \"make showresults\" ou acesse o arquivo extraction.out para ver os resultados da extração.\n\n");
	}

	fclose(fp); 
	fclose(fp_in); 
	fclose(fp_trash); 
	return 0;
}

int yywrap()
{
	return 1;
}
