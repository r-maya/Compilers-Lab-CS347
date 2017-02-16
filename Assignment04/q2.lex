%{
#include "y.tab.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
%}

alpha [A-Za-z]
digit [0-9]
%%
[ \t\n]    
if    return IF;
then    return THEN;
else    return ELSE;
while    return WHILE;
{digit}+    return NUM;
{alpha}({alpha}|{digit})*    return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
.    return yytext[0];
%%
int yywrap(){
	return -1;
}