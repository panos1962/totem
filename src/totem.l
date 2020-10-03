%{

#include "totem.h"
#include "resrap.h"

%}

D0 [0-9]
D1 [1-9]

%%

({D1}{D0}*|0)(\.{D0}+)? {
	yylval.flt = atof(yytext);
	return FLOAT;
}

\n {
	lineno++;
}

[ \t]

. {
	return *yytext;
}

%%
