#include <stdlib.h>
#include <stdio.h>

#define EXIT_OK 0
#define EXIT_USAGE 1
#define EXIT_MEMORY 2
#define EXIT_SYNTAX 3
#define EXIT_TUPLE 4

#define DIASTASI_MAX 10

typedef struct {
	double f[DIASTASI_MAX];
	int n;
} TUPLE;

extern char *progname;
extern char *source;
extern int lineno;
extern int errcnt;

extern int level;

extern int main(int, char *[]);
extern void sfalma(char *);
extern void sovaro(char *, int);
extern int yyerror(char *);
extern char *strsave(char *);

extern TUPLE *tuple_reset(TUPLE *);
extern TUPLE *tuple_push(TUPLE *, double);
extern TUPLE *tuple_copy(TUPLE *, TUPLE *);
extern TUPLE *tuple_add(TUPLE *, TUPLE *);
extern TUPLE *tuple_print(TUPLE *);
