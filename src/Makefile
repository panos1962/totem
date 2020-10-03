PROJECT = totem
CFLAGS = -O
BINDIR = ../bin
EXEC = $(BINDIR)/$(PROJECT)
OBJS = global.o main.o parser.o lexer.o tuple.o error.o
LIBS = -ll

TEST=../sample/test1

all: $(EXEC)

$(EXEC): $(OBJS)
	@[ -d $(BINDIR) ] || mkdir $(BINDIR) && chmod 775 $(BINDIR)
	cc -o $(EXEC) $(OBJS) $(LIBS)

parser.c parser.h: $(PROJECT).y
	bison --output=parser.c --defines=parser.h $(PROJECT).y

lexer.o: lexer.c resrap.h

lexer.c: $(PROJECT).l
	flex --outfile=lexer.c $(PROJECT).l

resrap.h: parser.h
	@-cmp -s resrap.h parser.h || cp parser.h resrap.h

test:
	@make all
	@$(EXEC) $(TEST) | awk -f ../lib/html.awk >$(TEST).html && firefox --new-window $(TEST).html >/dev/null 2>&1

cleanup:
	@rm -f ../sample/*.html $(EXEC) *.o parser.c parser.h resrap.h lexer.c core
