/* A Bison parser, made by GNU Bison 3.5.1.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IF = 258,
    ELSE = 259,
    FOR = 260,
    WHILE = 261,
    DOUBLE = 262,
    INT = 263,
    STRING = 264,
    CHAR = 265,
    NEW = 266,
    PUBLIC = 267,
    CLASS = 268,
    RETURN = 269,
    STATIC = 270,
    MULT = 271,
    SUMA = 272,
    RESTA = 273,
    DIV = 274,
    ASIG = 275,
    MOD = 276,
    AND = 277,
    OR = 278,
    NOT = 279,
    MASMAS = 280,
    MENMEN = 281,
    ASIGMAS = 282,
    ASIGMEN = 283,
    ASIGMULT = 284,
    ASIGDIV = 285,
    LLAVEA = 286,
    LLAVEC = 287,
    PARENTA = 288,
    PARENTC = 289,
    CORCHETEA = 290,
    CORCHETEC = 291,
    PUNTOCOMA = 292,
    IGUAL = 293,
    MENORIGUAL = 294,
    MAYORIGUAL = 295,
    DIFERENTE = 296,
    MAYOR = 297,
    MENOR = 298,
    ENTERO = 299,
    CADENA = 300,
    COMENTARIO = 301,
    REAL = 302
  };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define FOR 260
#define WHILE 261
#define DOUBLE 262
#define INT 263
#define STRING 264
#define CHAR 265
#define NEW 266
#define PUBLIC 267
#define CLASS 268
#define RETURN 269
#define STATIC 270
#define MULT 271
#define SUMA 272
#define RESTA 273
#define DIV 274
#define ASIG 275
#define MOD 276
#define AND 277
#define OR 278
#define NOT 279
#define MASMAS 280
#define MENMEN 281
#define ASIGMAS 282
#define ASIGMEN 283
#define ASIGMULT 284
#define ASIGDIV 285
#define LLAVEA 286
#define LLAVEC 287
#define PARENTA 288
#define PARENTC 289
#define CORCHETEA 290
#define CORCHETEC 291
#define PUNTOCOMA 292
#define IGUAL 293
#define MENORIGUAL 294
#define MAYORIGUAL 295
#define DIFERENTE 296
#define MAYOR 297
#define MENOR 298
#define ENTERO 299
#define CADENA 300
#define COMENTARIO 301
#define REAL 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
