%{
#include <stdio.h>
#include <stdlib.h>
%}


letra       [a-zA-Z]
digito      [0-9]
decimal     \.{digito}*
exp         "e"(\-|\+)?({digito})*
Cte-ent     "-"?({digito})+
Cte-cadena  \"({letra}|{digito}|" ")*\"
Cte-real    {digito}*{decimal}{exp}?
comentario  \/\/({letra}|{digito}|" ")*|"/*"({letra}|{digito}|" ")*"*/"
id          {letra}({letra}|{digito})*
arreglo     \[({Cte-ent}*(\,{Cte-ent})*|{Cte-cadena}(\,{Cte-cadena})*)\]


/*Palabras claves*/
IF          if
ELSE        else
FOR         for
WHILE       while
DOUBLE      double" "
INT         int" "
STRING      String" "
CHAR        char" "
NEW         new" "
PUBLIC      public" "
CLASS       class" "
STATIC      static" "
VOID        void" "
ARGS        args

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


   

%%
{IF}        { printf("IF ");}
{ELSE}      { printf("ELSE ");}
{FOR}       { printf("FOR ");}
{WHILE}     { printf("WHILE ");}
{DOUBLE}    { printf("DOUBLE");}
{INT}       { printf("INT ");}
{STRING}    { printf("STRING ");}
{CHAR}      { printf("CHAR ");}   
{NEW}       { printf("NEW ");}
{PUBLIC}    { printf("PUBLIC ");}
{CLASS}     { printf("CLASS ");}
{VOID}      { printf("VOID ");}
{STATIC}    { printf("STATIC ");}
{ARGS}      { printf("ARGS ");}

{Op-mult}   { printf("Op-mult = %s ", yytext);}
{Op-sum}    { printf("Op-sum = %s ", yytext);}
{Op-sust}   { printf("Op-sust = %s ", yytext);}
{Op-div}    { printf("Op-div = %s ", yytext);}
{Op-asign}  { printf("Op-asign = %s ", yytext);}
{Op-mod}    { printf("Op-mod = %s ", yytext);}

{Op-MasMas}     { printf("Op-MasMas = %s ", yytext);}
{Op-MenosMenos} { printf("Op-MenosMenos = %s ", yytext);}
{Op-MasAsig}    { printf("Op-MasAsig = %s ", yytext);}
{Op-MenosAsig}  { printf("Op-MenosAsig = %s ", yytext);}
{Op-PorAsig}    { printf("Op-PorAsig = %s ", yytext);}
{Op-DivAsig}    { printf("Op-DivAsig = %s ", yytext);}

{Llave-a}       { printf("Llave-a = %s ", yytext);}
{Llave-c}       { printf("Llave-c = %s ", yytext);}
{Parent-a}      { printf("Parent-a = %s ", yytext);}
{Parent-c}      { printf("Parent-c = %s ", yytext);}
{Corchete-a}    { printf("Corchete-a = %s ", yytext);}
{Corchete-c}    { printf("Corchete-c = %s ", yytext);}

{Punto-coma}    { printf("Punto-coma = %s ", yytext);}

{Igual}         { printf("Igual = %s ", yytext);}
{Menor-igual}   { printf("Menor-igual = %s ", yytext);}
{Mayor-igual}   { printf("Mayor-igual = %s ", yytext);}
{Diferente}     { printf("Diferente = %s ", yytext);}
{Mayor}         { printf("Mayor = %s ", yytext);}
{Menor}         { printf("Menor = %s ", yytext);}

{Cte-ent}       { printf("Cte-ent = %s ", yytext);}
{Cte-cadena}    { printf("Cte-cadena = %s ", yytext);}
{id}            { printf("Id= %s ", yytext);}
{comentario}    { printf("comentario = %s ", yytext);}
{Cte-real}      { printf("Cte-real = %s ", yytext);}
{arreglo}       { printf("Arreglo = %s ", yytext);}
{op-y}          { printf("op-y = %s ", yytext);}
{op-o}          { printf("op-o = %s ", yytext);}
{op-no}         { printf("op-no = %s ", yytext);}



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