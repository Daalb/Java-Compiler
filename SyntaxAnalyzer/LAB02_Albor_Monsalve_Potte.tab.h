/* A Bison parser, made by GNU Bison 3.7.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_LAB02_ALBOR_MONSALVE_POTTE_TAB_H_INCLUDED
# define YY_YY_LAB02_ALBOR_MONSALVE_POTTE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IF = 258,                      /* IF  */
    ELSE = 259,                    /* ELSE  */
    FOR = 260,                     /* FOR  */
    WHILE = 261,                   /* WHILE  */
    DOUBLE = 262,                  /* DOUBLE  */
    INT = 263,                     /* INT  */
    STRING = 264,                  /* STRING  */
    CHAR = 265,                    /* CHAR  */
    NEW = 266,                     /* NEW  */
    PUBLIC = 267,                  /* PUBLIC  */
    CLASS = 268,                   /* CLASS  */
    STATIC = 269,                  /* STATIC  */
    VOID = 270,                    /* VOID  */
    MULT = 271,                    /* MULT  */
    SUMA = 272,                    /* SUMA  */
    RESTA = 273,                   /* RESTA  */
    DIV = 274,                     /* DIV  */
    ASIG = 275,                    /* ASIG  */
    MOD = 276,                     /* MOD  */
    AND = 277,                     /* AND  */
    OR = 278,                      /* OR  */
    NOT = 279,                     /* NOT  */
    MASMAS = 280,                  /* MASMAS  */
    MENMEN = 281,                  /* MENMEN  */
    ASIGMAS = 282,                 /* ASIGMAS  */
    ASIGMEN = 283,                 /* ASIGMEN  */
    ASIGMULT = 284,                /* ASIGMULT  */
    ASIGDIV = 285,                 /* ASIGDIV  */
    LLAVEA = 286,                  /* LLAVEA  */
    LLAVEC = 287,                  /* LLAVEC  */
    PARENTA = 288,                 /* PARENTA  */
    PARENTC = 289,                 /* PARENTC  */
    CORCHETEA = 290,               /* CORCHETEA  */
    CORCHETEC = 291,               /* CORCHETEC  */
    PUNTOCOMA = 292,               /* PUNTOCOMA  */
    IGUAL = 293,                   /* IGUAL  */
    MENORIGUAL = 294,              /* MENORIGUAL  */
    MAYORIGUAL = 295,              /* MAYORIGUAL  */
    DIFERENTE = 296,               /* DIFERENTE  */
    MAYOR = 297,                   /* MAYOR  */
    MENOR = 298,                   /* MENOR  */
    ENTERO = 299,                  /* ENTERO  */
    CADENA = 300,                  /* CADENA  */
    COMENTARIO = 301,              /* COMENTARIO  */
    REAL = 302,                    /* REAL  */
    ID = 303                       /* ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LAB02_ALBOR_MONSALVE_POTTE_TAB_H_INCLUDED  */
