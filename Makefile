DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROGRAMS   =tools/prompt$(EXE)
HEADERS    =io/fgetpw.h io/prompt.h
## -- targets
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/io
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/io
clean:
	rm -f $(PROGRAMS)
## -- programs
tools/prompt$(EXE): tools/prompt.c io/prompt.h
	$(CC) -o $@ tools/prompt.c $(CFLAGS)
## -- manpages --
install: install-man3
install-man3:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/prompt.3 $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/fgetpw.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-term
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-term
## -- license --
