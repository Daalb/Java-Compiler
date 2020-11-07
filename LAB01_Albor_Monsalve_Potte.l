%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "LAB02_Albor_Monsalve_Potte.tab.h"
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
espacio     " "

%%
"if"        { fprintf(yyout, "IF "); return(IF);}
"else"      { fprintf(yyout, "ELSE "); return(ELSE); }
"for"       { fprintf(yyout, "FOR "); return(FOR);}
"while"     { fprintf(yyout, "WHILE "); return(WHILE);}
"double"    { fprintf(yyout, "DOUBLE "); return(DOUBLE);}
"int"       { fprintf(yyout, "INT "); return(INT);}
"string"    { fprintf(yyout, "STRING "); return(STRING);}
"char"      { fprintf(yyout, "CHAR "); return(CHAR);}
"new"       { fprintf(yyout, "NEW "); return(NEW);}
"public"    { fprintf(yyout, "PUBLIC "); return(PUBLIC);}
"class"     { fprintf(yyout, "CLASS "); return(CLASS);}
"void"      { fprintf(yyout, "VOID "); return(VOID);}
"static"    { fprintf(yyout, "STATIC "); return(STATIC);}

"*"  		{ fprintf(yyout,"Op-mult = %s ", yytext); return(MULT);}
"+"			{ fprintf(yyout,"Op-sum = %s ", yytext); return(SUMA);}
"-"  		{ fprintf(yyout,"Op-sust = %s ", yytext); return(RESTA);}
"/"  		{ fprintf(yyout,"Op-div = %s ", yytext); return(DIV);}
"="  		{ fprintf(yyout,"Op-asign = %s ", yytext); return(ASIG);}
"%"   		{ fprintf(yyout,"Op-mod = %s ", yytext); return(MOD);}

"++"            { fprintf(yyout,"Op-MasMas = %s ", yytext); return(MASMAS);}
"--"		    { fprintf(yyout,"Op-MenosMenos = %s ", yytext); return(MENMEN);}
"+="    		{ fprintf(yyout,"Op-MasAsig = %s ", yytext); return(ASIGMAS);}
"-="            { fprintf(yyout,"Op-MenosAsig = %s ", yytext); return(ASIGMEN);}
"*="            { fprintf(yyout,"Op-PorAsig = %s ", yytext); return(ASIGMULT);}
"/="   			{ fprintf(yyout,"Op-DivAsig = %s ", yytext); return(ASIGDIV);}

"{"       		{ fprintf(yyout,"Llave-a = %s ", yytext); return(LLAVEA);}
"}"             { fprintf(yyout,"Llave-c = %s ", yytext); return(LLAVEC);}
"("      		{ fprintf(yyout,"Parent-a = %s ", yytext); return(PARENTA);}
")"      		{ fprintf(yyout,"Parent-c = %s ", yytext); return(PARENTC);}
"["    			{ fprintf(yyout,"Corchete-a = %s ", yytext); return(CORCHETEA);}
"]"    			{ fprintf(yyout,"Corchete-c = %s ", yytext); return(CORCHETEC);}

";"    			{ fprintf(yyout,"Punto-coma = %s ", yytext); return(PUNTOCOMA);}

"=="            { fprintf(yyout,"Igual = %s ", yytext); return(IGUAL);}
"<="            { fprintf(yyout,"Menor-igual = %s ", yytext); return(MENORIGUAL);}
">="            { fprintf(yyout,"Mayor-igual = %s ", yytext); return(MAYORIGUAL);}
"!="            { fprintf(yyout,"Diferente = %s ", yytext);return(DIFERENTE);}
">"         	{ fprintf(yyout,"Mayor = %s ", yytext); return(MAYOR);}
"<"         	{ fprintf(yyout,"Menor = %s ", yytext); return(MENOR);}

{Cte-ent}       { fprintf(yyout,"Cte-ent = %s ", yytext);return(ENTERO);}
{Cte-cadena}    { fprintf(yyout,"Cte-cadena = %s ", yytext);return(CADENA);}


{comentario}    { fprintf(yyout,"comentario = %s ", yytext);return(COMENTARIO);}
{Cte-real}      { fprintf(yyout,"Cte-real = %s ", yytext);return(REAL);}


"&&"          	{ fprintf(yyout,"op-y = %s ", yytext);return(AND);}
"||"          	{ fprintf(yyout,"op-o = %s ", yytext);return(OR);}
"!"         	{ fprintf(yyout,"op-no = %s ", yytext);return(NOT);}
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
    yyout = fopen("salida.txt", "w"); 
    yylex();
    return 0;
}