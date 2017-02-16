%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *);
%}

%token ID NUM IF THEN LE GE EQ NE OR AND ELSE WHILE
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%

S      : ST1 {printf("Input accepted.\n");exit(0);}
        ;
ST    : IF '(' E2 ')' ST ELSE ST
        | IF '(' E2 ')' ST
        | WHILE '(' E2 ')' ST
        | E ';'
        | '{' ST1 '}'
        ;

ST1  : ST
        | ST ST1
        ;
E    : ID'='E
      | E'+'E
      | E'-'E
      | E'*'E
      | E'/'E
      | E'<'E
      | E'>'E
      | E LE E
      | E GE E
      | E EQ E
      | E NE E
      | E OR E
      | E AND E
      | ID
      | NUM
      ;
E2  : E'<'E
      | E'>'E
      | E LE E
      | E GE E
      | E EQ E
      | E NE E
      | E OR E
      | E AND E
      | ID
      | NUM
      ;

%%

int yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
        return -1;
}

int main()
{
  printf("Enter the exp: ");
  yyparse();
  return 0;
}