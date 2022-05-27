
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     L_BRACKET = 259,
     R_BRACKET = 260,
     DIV = 261,
     MUL = 262,
     ADD = 263,
     SUB = 264,
     EQUALS = 265,
     PI = 266,
     POW = 267,
     SQRT = 268,
     MOD = 269,
     LOG2 = 270,
     LOG10 = 271,
     FLOOR = 272,
     CEIL = 273,
     ABS = 274,
     GBP_TO_USD = 275,
     USD_TO_GBP = 276,
     GBP_TO_EURO = 277,
     EURO_TO_GBP = 278,
     USD_TO_EURO = 279,
     EURO_TO_USD = 280,
     COS = 281,
     SIN = 282,
     TAN = 283,
     COSH = 284,
     SINH = 285,
     TANH = 286,
     CEL_TO_FAH = 287,
     FAH_TO_CEL = 288,
     M_TO_KM = 289,
     KM_TO_M = 290,
     VAR_KEYWORD = 291,
     VARIABLE = 292,
     EOL = 293
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 22 "gram.y"

	int index;
	double num;



/* Line 1676 of yacc.c  */
#line 97 "gram.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


