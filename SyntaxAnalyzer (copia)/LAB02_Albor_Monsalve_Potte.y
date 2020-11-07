%{
    #include <string.h>
    #include <stdio.h>
    #include <stdlib.h>
    int errores = 0;
    void yyerror(const char *s)
	extern int yyparse();
%}

%token IF ELSE FOR WHILE 
%token DOUBLE INT STRING CHAR
%token NEW PUBLIC CLASS RETURN STATIC
%left MULT SUMA RESTA DIV ASIG MOD AND OR NOT
%token MASMAS MENMEN ASIGMAS ASIGMEN ASIGMULT ASIGDIV
%token LLAVEA LLAVEC PARENTA PARENTC CORCHETEA CORCHETEC PUNTOCOMA
%left IGUAL MENORIGUAL MAYORIGUAL DIFERENTE MAYOR MENOR
%token ENTERO CADENA COMENTARIO REAL 
%start init
%%

init    :   '('
        ;
%%
main()
{
 return(yyparse());
}
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}
yywrap()
{
  return(1);
}