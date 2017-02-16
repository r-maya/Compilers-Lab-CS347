%{
#include "y.tab.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

%}


%%

[0-9] { yylval.dval = atoi(yytext); return INTEGER ; }

[\n] { return NL ;}
[ ]+ ;
[+] { return PLU; }
[-] { return MIN;}
[*] { return MUL;}
[/] { return DIV;}
[\^] { return POW;}

. { return yytext[0]; }

%%

int yywrap(){
	return -1;
}