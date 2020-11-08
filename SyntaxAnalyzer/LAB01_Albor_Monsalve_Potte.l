%{
#include <stdio.h>
#include "LAB02_Albor_Monsalve_Potte.tab.h"
int cerror=0;
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
"if"        { return(IF);}
"else"      { return(ELSE); }
"for"       { return(FOR);}
"while"     { return(WHILE);}
"double"    { return(DOUBLE);}
"int"       {  return(INT);}
"String"    { return(STRING);}
"char"      {  return(CHAR);}
"new"       { return(NEW);}
"public"    {  return(PUBLIC);}
"class"     {  return(CLASS);}
"void"		{ return(VOID);}
"static"    {  return(STATIC);}

"*"  		{  return(MULT);}
"+"			{ return(SUMA);}
"-"  		{ return(RESTA);}
"/"  		{ return(DIV);}
"="  		{ return(ASIG);}
"%"   		{ return(MOD);}

"++"            {  return(MASMAS);}
"--"		    { return(MENMEN);}
"+="    		{return(ASIGMAS);}
"-="            {  return(ASIGMEN);}
"*="            {  return(ASIGMULT);}
"/="   			{  return(ASIGDIV);}

"{"       		{  return(LLAVEA);}
"}"             {  return(LLAVEC);}
"("      		{  return(PARENTA);}
")"      		{ return(PARENTC);}
"["    			{  return(CORCHETEA);}
"]"    			{  return(CORCHETEC);}

";"    			{ return(PUNTOCOMA);}

"=="            { return(IGUAL);}
"<="            { return(MENORIGUAL);}
">="            { return(MAYORIGUAL);}
"!="            { return(DIFERENTE);}
">"         	{ return(MAYOR);}
"<"         	{ return(MENOR);}

{Cte-ent}       { return(ENTERO);}
{Cte-cadena}    { return(CADENA);}


{comentario}    { return(COMENTARIO);}
{Cte-real}      { return(REAL);}


"&&"          	{ return(AND);}
"||"          	{ return(OR);}
"!"         	{ return(NOT);}
{id}			{ return(ID);}
{espacio}       { }
\n              {cerror++;}
%%

