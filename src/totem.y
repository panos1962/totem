%{

#include "totem.h"

%}

%union {
	double flt;
	TUPLE tpl;
}

%type <tpl> tlist
%type <tpl> total
%type <tpl> tuple
%type <tpl> flist

%token <flt> FLOAT

%%

tlist
	: {
		tuple_reset(&$$);
	}

	| tlist total {
		yyerrok;
		tuple_add(&$$, &$2);
	}

	| tlist error

	;

total
	: tuple {
		tuple_print(tuple_copy(&$$, &$1));
	}

	| '{' {
		level++;
	} tlist '}' {
		level--;
		tuple_print(tuple_copy(&$$, &$3));
	}

	;

tuple
	: FLOAT {
		tuple_push(tuple_reset(&$$), $1);
	}

	| '(' flist ')' {
		tuple_copy(&$$, &$2);
	}

	;

flist
	: {
		tuple_reset(&$$);
	}

	| flist FLOAT {
		tuple_push(&$$, $2);
	}

	| flist error

	;

%%
