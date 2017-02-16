%union{
double dval;
}

%token <dval> INTEGER
%token PLU MIN MUL DIV POW NL
%left '+' '-' '*' '/' '^'

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

float ans;
int yyerror(char *);
int yylex(void);
%}


%type <dval> expr

%%
prog:        prog stmnt '\n'
         |
         ;

stmnt:        expr                 { printf("ans - %lf\n", ans); }
         ;

expr:        INTEGER                        { $$=$1; ans= $1;}
         | expr expr PLU         { $$ = $1 + $2; ans=$1 + $2; }
         | expr expr MIN         { $$ = $1 - $2; ans=$1 - $2; }
         | expr expr MUL         { $$ = $1 * $2; ans = $1*$2; printf("%lf",$1*$2); }
         | expr expr DIV         { $$ = $1 / $2; ans=$1 / $2; }
        | expr expr POW        { $$ = pow($1,$2); ans=pow($1,$2); }
         ;
%%

int yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
        return -1;
}
int main(void) {
        yyparse();
        return 0;
}