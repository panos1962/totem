%{

#include "parser.h"

%}

%%

[1-9][0-9]* {
	yylval = atoi(yytext);
	return NUMBER;
}

[ \t\n]

. {
	return *yytext;
}

%%
