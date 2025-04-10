%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%%

program:
    program statement '\n'
    |
    ;

statement:
    expr { printf("%d\n", $1); }
    | VARIABLE '=' expr { sym[$1] = $3; }
    ;

expr:
    INTEGER
    | VARIABLE { $$ = sym[$1]; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { if ($3 == 0) yyerror("Division by zero!"); else $$ = $1 / $3; }
    | '(' expr ')' { $$ = $2; }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    return yyparse();
}