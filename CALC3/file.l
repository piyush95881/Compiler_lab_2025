%{
#include <stdlib.h>
#include "calc3.h"
#include "y.tab.h"
void yyerror(char *);
%}
%%
[a-z]       {
0           {
[1-9][0-9]* {
                yylval.sIndex = *yytext - 'a';
                return VARIABLE;
            }
            }
            }
                yylval.iValue = atoi(yytext);
                return INTEGER;
                yylval.iValue = atoi(yytext);
                return INTEGER;
[-()<>=+*/;{}.] {
                return *yytext;
             }
">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;
[ \t\n]+        ;       /* ignore whitespace */
.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}