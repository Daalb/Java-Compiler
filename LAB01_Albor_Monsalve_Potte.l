%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int i = 0;
const char* id[10000];
const char* auxiliar[10000];
void tabla_id();
void contador_id(const char* id_ytext);
extern FILE *yyin, *yyout;
%}


letra       [a-zA-Z]
digito      [0-9]
decimal     \.{digito}+
exp         "e"(\-|\+)({digito})+
comentario  \/\/({letra}|{digito}|" ")*|"/*"({letra}|{digito}|" ")*"*/"
Cte-ent     "-"?({digito})+
Cte-cadena  \"({letra}|{digito}|" ")*\"
Cte-real    {digito}+{decimal}{exp}?
id          {letra}({letra}|{digito})*
errorid     ({Cte-ent}|{Cte-real})+({id})


/*Palabras claves*/
IF          if
ELSE        else
FOR         for
WHILE       while
DOUBLE      double
INT         int
STRING      String
CHAR        char
NEW         new
PUBLIC      public
CLASS       class
STATIC      static
VOID        void

/*Operadores aritméticos*/
Op-mult     "*"
Op-sum      "+"
Op-sust     "-"
Op-div      "/"
Op-asign    "="
Op-mod      "%"

/*OPeradores aritméticos especiales*/
Op-MasMas          "++"
Op-MenosMenos      "--"
Op-MasAsig         "+="
Op-MenosAsig       "-="
Op-PorAsig         "*="
Op-DivAsig         "/="    

/*Delimitadores de inicio y final de bloques de instrucción*/
Llave-a     "{"
Llave-c     "}"

/*Final de instrucción*/
Punto-coma  ";"

/*Paréntesis y  corchetes*/
Parent-a        "("
Parent-c        ")"
Corchete-a      "["
Corchete-c      "]"

/*Operadores relacionales*/
Igual       "=="
Menor-igual "<="
Mayor-igual ">="
Diferente   "!="|"<>"
Mayor       ">"
Menor       "<"

/*Operadores logicos*/
op-y        "&&" 
op-o        "||" 
op-no        \!

espacio     " "

%%
{IF}        { fprintf(yyout, "IF ");}
{ELSE}      { fprintf(yyout, "ELSE "); }
{FOR}       { fprintf(yyout, "FOR ");}
{WHILE}     { fprintf(yyout, "WHILE ");}
{DOUBLE}    { fprintf(yyout, "DOUBLE ");}
{INT}       { fprintf(yyout, "INT ");}
{STRING}    { fprintf(yyout, "STRING ");}
{CHAR}      { fprintf(yyout, "CHAR ");}
{NEW}       { fprintf(yyout, "NEW ");}
{PUBLIC}    { fprintf(yyout, "PUBLIC "); }
{CLASS}     { fprintf(yyout, "CLASS ");}
{VOID}      { fprintf(yyout, "VOID ");}
{STATIC}    { fprintf(yyout, "STATIC ");}

{Op-mult}   { fprintf(yyout,"Op-mult = %s ", yytext);}
{Op-sum}    { fprintf(yyout,"Op-sum = %s ", yytext);}
{Op-sust}   { fprintf(yyout,"Op-sust = %s ", yytext);}
{Op-div}    { fprintf(yyout,"Op-div = %s ", yytext);}
{Op-asign}  { fprintf(yyout,"Op-asign = %s ", yytext);}
{Op-mod}    { fprintf(yyout,"Op-mod = %s ", yytext);}

{Op-MasMas}     { fprintf(yyout,"Op-MasMas = %s ", yytext);}
{Op-MenosMenos} { fprintf(yyout,"Op-MenosMenos = %s ", yytext);}
{Op-MasAsig}    { fprintf(yyout,"Op-MasAsig = %s ", yytext);}
{Op-MenosAsig}  { fprintf(yyout,"Op-MenosAsig = %s ", yytext);}
{Op-PorAsig}    { fprintf(yyout,"Op-PorAsig = %s ", yytext);}
{Op-DivAsig}    { fprintf(yyout,"Op-DivAsig = %s ", yytext);}

{Llave-a}       { fprintf(yyout,"Llave-a = %s ", yytext);}
{Llave-c}       { fprintf(yyout,"Llave-c = %s ", yytext);}
{Parent-a}      { fprintf(yyout,"Parent-a = %s ", yytext);}
{Parent-c}      { fprintf(yyout,"Parent-c = %s ", yytext);}
{Corchete-a}    { fprintf(yyout,"Corchete-a = %s ", yytext);}
{Corchete-c}    { fprintf(yyout,"Corchete-c = %s ", yytext);}

{Punto-coma}    { fprintf(yyout,"Punto-coma = %s ", yytext);}

{Igual}         { fprintf(yyout,"Igual = %s ", yytext);}
{Menor-igual}   { fprintf(yyout,"Menor-igual = %s ", yytext);}
{Mayor-igual}   { fprintf(yyout,"Mayor-igual = %s ", yytext);}
{Diferente}     { fprintf(yyout,"Diferente = %s ", yytext);}
{Mayor}         { fprintf(yyout,"Mayor = %s ", yytext);}
{Menor}         { fprintf(yyout,"Menor = %s ", yytext);}

{Cte-ent}       { fprintf(yyout,"Cte-ent = %s ", yytext);}
{Cte-cadena}    { fprintf(yyout,"Cte-cadena = %s ", yytext);}


{comentario}    { fprintf(yyout,"comentario = %s ", yytext);}
{Cte-real}      { fprintf(yyout,"Cte-real = %s ", yytext);}


{op-y}          { fprintf(yyout,"op-y = %s ", yytext);}
{op-o}          { fprintf(yyout,"op-o = %s ", yytext);}
{op-no}         { fprintf(yyout,"op-no = %s ", yytext);}
{errorid}       { fprintf(yyout,"Error léxico = %s ", yytext);}
{id}            { fprintf(yyout,"Id= %s ", yytext); contador_id(yytext); }
{espacio}       { }


.               { fprintf(yyout,"Error léxico = %s ", yytext); }
<<EOF>>			{tabla_id();return 0;}

%%

void contador_id(const char* id_ytext){
	char cpy_id[100];
	char delimit[10] = " ID=";
	strcpy(auxiliar, id);
	strcat(cpy_id,id_ytext);
 	char *token;	
	bool sw = true;
	token = strtok(id, delimit);
	if(i == 0){
		strcpy(cpy_id,delimit);
		strcat(cpy_id,id_ytext); 
		strcat(id, cpy_id);
		i++;
	} else {
		while( token != NULL && sw ) {
		
       		if(strcoll(token, id_ytext) == 0){
				sw = false;
       		}
      		token = strtok(NULL, delimit);
   		}
		if(sw){
			strcpy(cpy_id,delimit);
			strcat(cpy_id,id_ytext);
           	strcat(auxiliar,cpy_id);
			i++;
       	}
		strcpy(id,auxiliar);		
	}	
}
void tabla_id(){
	fprintf(yyout,"\n");
	fprintf(yyout,"TABLA DE IDENTIFICADORES: \n");
	fprintf(yyout,"Hay %d identificadores \n", i);
	fprintf(yyout,"%s",id);
}
int main (int argc, char *argv[]){
    
    if (argc == 2){
        yyin = fopen (argv[1], "rt");
        if (yyin == NULL) {
            printf ("El fichero %s no se puede abrir\n", argv[1]);
            exit (-1);
        }   
    }
    else yyin = stdin;
    yyout = fopen("output.txt", "w"); 
    yylex();
    return 0;
}