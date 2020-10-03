%{

#include <stdio.h>

extern int yylex();
extern int yyerror();

static int level = 0;

static void indent(int n) {
	while (n--)
	putchar('\t');
}

%}

%token NUMBER

%%

tlist
	: {
		$$ = 0;
	}

	| tlist total {
		yyerrok;
		$$ = $1 + $2;
	}

	| tlist error

	;

total
	: NUMBER {
		$$ = $1;
	}

	| '{' {
		level++;
	} tlist '}' {
		level--;
		$$ = $3;
		indent(level);
		printf("%d\n", $3);
	}

	;

%%
