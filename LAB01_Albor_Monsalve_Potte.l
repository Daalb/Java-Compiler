%{
#include <stdio.h>
#include <stdlib.h>
%}


letra       [a-zA-Z]
digito      [0-9]
decimal     ("."digito)?
exp         ("e"("+"|"-")?digito)?
Cte-ent     "-"?({digito})+
Cte-cadena  \"({letra}|{digito}|" ")*\"
comentario  \/\/({letra}|{digito}|" ")*|"/*"({letra}|{digito}|" ")*"*/"
id          {letra}({letra}|{digito})*


/*Palabras claves*/
IF          if
ELSE        else
FOR         for
WHILE       while
DOUBLE      double" "
INT         int" "
STRING      String" "
CHAR        char" "
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
Diferente   "!="
Mayor       ">"
Menor       "<"


   

%%
{IF}        { printf("Encontre palabra clave IF: %s\n", yytext);}
{ELSE}      { printf("Encontre palabra clave ELSE: %s\n", yytext);}
{FOR}       { printf("Encontre palabra clave FOR: %s\n", yytext);}
{WHILE}     { printf("Encontre palabra clave WHILE: %s\n", yytext);}
{DOUBLE}    { printf("Encontre palabra clave DOUBLE: %s\n", yytext);}
{INT}       { printf("Encontre palabra clave INT: %s\n", yytext);}
{STRING}    { printf("Encontre palabra clave STRING: %s\n", yytext);}
{CHAR}      { printf("Encontre palabra clave CHAR: %s\n", yytext);}   
{NEW}       { printf("Encontre palabra clave NEW: %s\n", yytext);}
{PUBLIC}    { printf("Encontre palabra clave PUBLIC: %s\n", yytext);}
{CLASS}     { printf("Encontre palabra clave CLASS: %s\n", yytext);}
{VOID}      { printf("Encontre palabra clave VOID: %s\n", yytext);} 

{Op-mult}   { printf("Encontre Op-mult = %s\n", yytext);}
{Op-sum}    { printf("Encontre Op-sum = %s\n", yytext);}
{Op-sust}   { printf("Encontre Op-sust = %s\n", yytext);}
{Op-div}    { printf("Encontre Op-div = %s\n", yytext);}
{Op-asign}  { printf("Encontre Op-asign = %s\n", yytext);}
{Op-mod}    { printf("Encontre Op-mod = %s\n", yytext);}

{Op-MasMas}     { printf("Encontre Op-MasMas = %s\n", yytext);}
{Op-MenosMenos} { printf("Encontre Op-MenosMenos = %s\n", yytext);}
{Op-MasAsig}    { printf("Encontre Op-MasAsig = %s\n", yytext);}
{Op-MenosAsig}  { printf("Encontre Op-MenosAsig = %s\n", yytext);}
{Op-PorAsig}    { printf("Encontre Op-PorAsig = %s\n", yytext);}
{Op-DivAsig}    { printf("Encontre Op-DivAsig = %s\n", yytext);}

{Llave-a}       { printf("Encontre Llave-a = %s\n", yytext);}
{Llave-c}       { printf("Encontre Llave-c = %s\n", yytext);}
{Parent-a}      { printf("Encontre Parent-a = %s\n", yytext);}
{Parent-c}      { printf("Encontre Parent-c = %s\n", yytext);}
{Corchete-a}    { printf("Encontre Corchete-a = %s\n", yytext);}
{Corchete-c}    { printf("Encontre Corchete-c = %s\n", yytext);}

{Punto-coma}    { printf("Encontre Punto-coma = %s\n", yytext);}

{Igual}         { printf("Encontre Igual = %s\n", yytext);}
{Menor-igual}   { printf("Encontre Menor-igual = %s\n", yytext);}
{Mayor-igual}   { printf("Encontre Mayor-igual = %s\n", yytext);}
{Diferente}     { printf("Encontre Diferente = %s\n", yytext);}
{Mayor}         { printf("Encontre Mayor = %s\n", yytext);}
{Menor}         { printf("Encontre Menor = %s\n", yytext);}

{Cte-ent}       { printf("Encontre Cte-ent = %s\n", yytext);}
{Cte-cadena}    { printf("Encontre Cte-cadena = %s\n", yytext);}
{id}            { printf("Encontre Id= %s\n", yytext);}
{comentario}    { printf("Encontre comentario = %s\n", yytext);}

.               { printf("No hay ningún match = %s\n",yytext);}

%%

int main (int argc, char *argv[]){
    if (argc == 2){
        yyin = fopen (argv[1], "rt");
        if (yyin == NULL) {
            printf ("El fichero %s no se puede abrir\n", argv[1]);
            exit (-1);
        }   
    }
    else yyin = stdin;
    yylex();
    return 0;
}