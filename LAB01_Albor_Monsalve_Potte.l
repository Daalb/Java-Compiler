%{
#include <stdio.h>
#include <stdlib.h>
%}


letra       [a-zA-Z]
digito      [0-9]
palabra     [a-zA-Z]*
variable    {letra}({letra}|{digito})*

/*Palabras claves*/
IF          if
ELSE        else
FOR         for
WHILE       while
DOUBLE      double
INT         int
STRING      String
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

%%
{IF}        { printf("Encontre palabra clave IF: %s\n", yytext);}
{ELSE}      { printf("Encontre palabra clave ELSE: %s\n", yytext);}
{FOR}       { printf("Encontre palabra clave FOR: %s\n", yytext);}
{WHILE}     { printf("Encontre palabra clave WHILE: %s\n", yytext);}
{DOUBLE}    { printf("Encontre palabra clave DOUBLE: %s\n", yytext);}
{INT}       { printf("Encontre palabra clave INT: %s\n", yytext);}
{STRING}    { printf("Encontre palabra clave STRING: %s\n", yytext);}
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

.           { printf("No hay ningún match");}
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