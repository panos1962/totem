#include "totem.h"

void sfalma(char *s) {
	if (progname)
	fprintf(stderr, "%s: ", progname);

	if (source)
	fprintf(stderr, "%s: ", source);

	if (lineno)
	fprintf(stderr, "line %d: ", lineno);

	if (!s)
	return;

	fputs(s, stderr);
	putc('\n', stderr);
}

void sovaro(char *s, int err) {
	sfalma(s);
	exit(err);
}

int yyerror(char *s) {
	sfalma(s);
	errcnt++;
	return 0;
}
