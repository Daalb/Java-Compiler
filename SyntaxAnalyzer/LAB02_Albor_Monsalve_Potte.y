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
			|   contenido 
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

expresion		:	iniciar_vec PUNTOCOMA
				|	asig_simple PUNTOCOMA
				|	asig_oper PUNTOCOMA
				|	idaumdec PUNTOCOMA
				|	asig_dec_aum PUNTOCOMA
				|	declaracion PUNTOCOMA
				|	asig_oper2 PUNTOCOMA
				|	op PUNTOCOMA
				|	asig_vec PUNTOCOMA
				;

condicional	:	IF PARENTA expre PARENTC bloque
			|	IF PARENTA expre PARENTC bloque ELSE bloque
			;

ciclo	:	WHILE PARENTA expre PARENTC bloque
		|	FOR PARENTA asig_simple PUNTOCOMA comparacion PUNTOCOMA idaumdec PARENTC bloque
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
asig_simple	:	ID ASIG exp_simple
			;

asig_oper : tipo ID ASIG operacionCompleja
		  | asig_oper ',' tipo ID ASIG operacionCompleja
		  ;
asig_oper2 : ID ope_especial operacionCompleja
		   ;
operacionCompleja :  '(' operacionCompleja ')'
			|	operacionCompleja  operador exp_simple
			| 	exp_simple 
			;


declaracion		: tipo ID
				| declaracion ',' ID
		    	;
iniciar_vec		:	tipo dcls_vector	
			    ;



dcls_vector	:	dcl_vector1
			|	dcl_vector2
			|	dcl_vector3
			;

dcl_vector1	: corchetes dcl_vector1 size
			|	ID ASIG NEW tipo
			;

dcl_vector2	: corchetes dcl_vector2 
			|	corchetes  ID 
			;
dcl_vector3		: '{' lista '}'
			;

lista		: exp_simple
			| lista ',' exp_simple
			;

asig_vec	:	ID size
			|	ID size ASIG exp_simple
			|	ID size ASIG ID size
			;

size        : CORCHETEA ENTERO CORCHETEC
			| size CORCHETEA ENTERO CORCHETEC
			;

corchetes	:	CORCHETEA CORCHETEC
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

ope_especial	:	ASIGMAS
				|	ASIGDIV
				|	ASIGMEN
				|	ASIGMULT
				;

op		 :  tipo ID ASIG operacionCompleja
	     |  op ',' ID ASIG operacionCompleja
		 ;

aumento_decremento		:	MASMAS
						|	MENMEN
						;
idaumdec	:	ID aumento_decremento 
			|	aumento_decremento ID
			;
asig_dec_aum: ID ASIG idaumdec
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
