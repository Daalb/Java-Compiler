%{
	#include <string.h>
    #include <stdio.h>
    #include <stdlib.h>
	extern int yylex();
	extern FILE * yyin;
	extern FILE * yyout;
	extern int yylineno;
	extern int cerror;
	extern char *yytext;
	int errores = 0;
	void yyerror(const char *s);
%}

%token IF ELSE FOR WHILE 
%token DOUBLE INT STRING CHAR
%token NEW PUBLIC CLASS STATIC VOID
%left MULT SUMA RESTA DIV ASIG MOD AND OR NOT
%token MASMAS MENMEN ASIGMAS ASIGMEN ASIGMULT ASIGDIV
%token LLAVEA LLAVEC PARENTA PARENTC CORCHETEA CORCHETEC PUNTOCOMA
%left IGUAL MENORIGUAL MAYORIGUAL DIFERENTE MAYOR MENOR
%token ENTERO CADENA COMENTARIO REAL ID
%start init
%%

init    : funct_init
		| init funct_init
        ;

funct_init	:	PUBLIC CLASS ID LLAVEA func_main LLAVEC
			|	PUBLIC CLASS ID LLAVEA LLAVEC
			|	PUBLIC CLASS ID LLAVEA error LLAVEC {yyerrok; yyclearin;}
			|	error funct_init {yyerrok; yyclearin;}
			|	funct_init error {yyerrok; yyclearin;} 
			;

func_main	:	PUBLIC STATIC VOID ID PARENTA STRING CORCHETEA CORCHETEC ID PARENTC bloque
			|	error func_main {yyerrok;yyclearin;}
			;

bloque	:	LLAVEA LLAVEC
		|	LLAVEA contenido LLAVEC
		;

contenido	:	statement
			|	contenido statement
			| 	error statement {yyerrok; yyclearin;}
			;

statement	:	expresion
			|	condicional
			|	ciclo
			;

expresion	:		assig_st PUNTOCOMA
				|	assig_st2 PUNTOCOMA
				|	assig_st3 PUNTOCOMA
				|	assig_especial PUNTOCOMA
				|	operador_incre PUNTOCOMA
				|	asig_vec PUNTOCOMA
				|	declaraciones PUNTOCOMA
				;

condicional	:	IF PARENTA expre PARENTC bloque
			|	IF PARENTA expre PARENTC bloque ELSE bloque
			;

ciclo	:	WHILE PARENTA expre PARENTC bloque
		|	FOR PARENTA assig_st PUNTOCOMA comparacion PUNTOCOMA assig_especial PARENTC bloque
		;

expre	:	condicional_expr
		|	comparacion

comparacion	:	PARENTA comparacion PARENTC
			|	exp_simple MENORIGUAL exp_simple
			|	exp_simple MAYORIGUAL exp_simple
			|	exp_simple DIFERENTE exp_simple
			|	exp_simple IGUAL exp_simple
			|	exp_simple MENOR exp_simple
			|	exp_simple MAYOR exp_simple
			|	ID
			|	condicional_expr
			;

condicional_expr	:	or_ex
					|	and_ex
					|	not_ex
					;

not_ex	:	NOT comparacion
		;

or_ex	:	comparacion OR comparacion
		|	OR condicional_expr
		;

and_ex	:	comparacion AND	comparacion
		|	AND condicional_expr
		;

assig_especial	:	ID MENMEN 
				|	ID MASMAS 
				|	operador_incre
				|	ID size	
				;

operador_incre	:	ID ope_espcial exp_simple
				;

declaraciones	:	tipo ID
			| declaraciones ',' ID
		;


assig_st	:	tipo ID	
			| assig_st ASIG exp_simple
			| assig_st ASIG assig_st2
			| assig_st ASIG anidar
			| assig_st dcl_vector 
			| assig_st ',' assig_st
			;

dcl_vector		: corchetes dcl_vector size
			|	ASIG NEW tipo
			;

asig_vec	:	ID size
			|	ID size ASIG exp_simple
			|	ID size ASIG assig_especial
			;

size            :       CORCHETEA ENTERO CORCHETEC
			| size CORCHETEA ENTERO CORCHETEC
			;

corchetes	:	CORCHETEA CORCHETEC
			;
        
assig_st3	:	ID ASIG assig_st2
			|	ID ASIG anidar
			;

assig_st2	:	exp_simple
			|	assig_st2 operador asig_compleja
			;

anidar	:	PARENTA asig_compleja PARENTC
		|	anidar operador anidar
		;

asig_compleja	:	exp_simple
				|	asig_compleja operador asig_compleja
				|	anidar operador asig_compleja
				|	asig_compleja operador anidar
				;

operador	:	SUMA
			|	RESTA
			|	MULT
			|	DIV
			|	MOD
			;

exp_simple	:	CADENA
			|	ENTERO
			|	ID
			|	REAL
			;

tipo	:	INT
		|	STRING
		| 	DOUBLE
		|	CHAR
		;

ope_espcial	:	ASIGMAS
			|	ASIGDIV
			|	ASIGMEN
			|	ASIGMULT
			;

	


%%

int main(){
	yyin=fopen("Archivo.txt","r");
	yyout=fopen("ArchivoSalida.txt","w");
	do {
		yyparse();
	} while(!feof(yyin));

	if(errores==0){
		fprintf(yyout, "No hubo ningun error sintactico.");
		fprintf(stderr, "No hubo ningun error sintactico.\n");
	}	
}

void yyerror(const char *s) {
    errores++;
	if(strcmp(yytext,"\n")==0){
		fprintf(yyout, "La línea %d tiene un error de tipo: %s\n",cerror+1,s);
		fprintf(stderr, "La línea %d tiene un error de tipo: %s\n",cerror+1,s);
	}else{
		fprintf(yyout, "La línea %d tiene un error de tipo: %s\n",cerror+1,s);
		fprintf(stderr, "La línea %d tiene un error de tipo: %s\n",cerror+1,s);
	}
}
