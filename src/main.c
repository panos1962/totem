#include "totem.h"
#include <unistd.h>
#include <ctype.h>
#include <string.h>

extern int yyparse(void);

int main(int argc, char *argv[]) {
	int c;
	int errs = 0;
	extern int optind;
	extern char *optarg;
	extern int optopt;

	if (progname = strrchr(argv[0], '/'))
	progname++;

	else
	progname = argv[0];

	while ((c = getopt(argc, argv, ":")) != EOF) {
		switch (c) {
		case '?':
			fprintf(stderr, "%s: %c: invalid option\n", progname, isprint(optopt) ? optopt : '?');
			errs++;
			break;
		}
	}

	if (errs)
	exit(EXIT_USAGE);

	argc -= optind;
	argv += optind;

	if (argc)
	for (; argc > 0; argc--, argv++) {
		source = *argv;
		lineno = 1;

		if (freopen(source, "r", stdin)) {
			yyparse();
			continue;
		}

		fprintf(stderr, "%s: ", progname);
		perror(source);
		errcnt++;
	}

	else {
		lineno = 1;
		yyparse();
	}

	if (errcnt) {
		fprintf(stderr, "%s: %d errors encounterd\n", progname, errcnt);
		exit(EXIT_SYNTAX);
	}

	exit(EXIT_OK);
}
