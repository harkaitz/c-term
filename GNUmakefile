PROJECT=c-term
VERSION=1.0.0
all:
install:
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
## -- BLOCK:license --
install: install-license
install-license: 
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE README.md $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
update: update-license
update-license:
	ssnip README.md
## -- BLOCK:license --
## -- BLOCK:man --
update: update-man
update-man:
	make-h-man update
install: install-man
install-man:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/prompt.3 $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/fgetpw.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
