PROJECT = totem
CFLAGS = -O
BINDIR = ../bin
EXEC = $(BINDIR)/$(PROJECT)i
OBJS = main.o parser.o lexer.o
LIBS = -ll -ly

TEST=../sample/test11

all: $(EXEC)

$(EXEC): $(OBJS)
	@[ -d $(BINDIR) ] || mkdir $(BINDIR) && chmod 775 $(BINDIR)
	cc -o $(EXEC) $(OBJS) $(LIBS)

parser.c parser.h: $(PROJECT).y
	bison --output=parser.c --defines=parser.h $(PROJECT).y

lexer.o: lexer.c parser.h

lexer.c: $(PROJECT).l
	flex --outfile=lexer.c $(PROJECT).l

test:
	@make all
	@$(EXEC) <$(TEST)

cleanup:
	@rm -f ../sample/*.html $(EXEC) *.o parser.c parser.h lexer.c core
