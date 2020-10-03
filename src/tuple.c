#include "totem.h"

TUPLE *tuple_reset(TUPLE *t) {
	t->n = 0;
	return t;
}

TUPLE *tuple_push(TUPLE *t, double x) {
	if (t->n >= DIASTASI_MAX)
	sovaro("too many columns", EXIT_TUPLE);

	t->f[t->n++] = x;

	return t;
}

TUPLE *tuple_copy(TUPLE *t, TUPLE *s) {
	int i;

	for (i = 0; i < s->n; i++)
	t->f[i] = s->f[i];

	t->n = s->n;

	return t;
}

TUPLE *tuple_add(TUPLE *t, TUPLE *s) {
	int i;

	if (s->n > t->n) {
		for (i = t->n; i < s->n; i++)
		t->f[i] = 0.0;

		t->n = s->n;
	}

	for (i = 0; i < s->n; i++)
	t->f[i] += s->f[i];

	return t;
}

TUPLE *tuple_print(TUPLE *t) {
	int i;

	printf("%d", level);

	for (i = 0; i < t->n; i++)
	printf(" %16.2lf", t->f[i]);

	printf("\n");

	return t;
}
