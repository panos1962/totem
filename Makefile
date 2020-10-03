BINDIR = bin

all:
	@[ -d $(BINDIR) ] || mkdir $(BINDIR) && chmod 775 $(BINDIR)
	(cd src && make)
	(cd totemi && make)

cleanup:
	(cd src && make cleanup)
	(cd totemi && make cleanup)
