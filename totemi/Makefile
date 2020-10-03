PROJECT = totem
CFLAGS = -O
EXEC = ../bin/$(PROJECT)i
OBJS = main.o parser.o lexer.o
LIBS = -ll -ly

TEST=../sample/test11

all: $(EXEC)

$(EXEC): $(OBJS)
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
