PROJECT =c-term
VERSION =1.0.0
DESTDIR =
PREFIX  =/usr/local
CC      =gcc -pedantic-errors -std=c99 -Wall
PROGRAMS=prompt$(EXE)
HEADERS =io/fgetpw.h io/prompt.h
##
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/include/io
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/io
clean:
	rm -f $(PROGRAMS)
## -- programs
prompt$(EXE): tools/prompt.c io/prompt.h
	$(CC) -o $@ tools/prompt.c $(CFLAGS)
## -- BLOCK:license --
install: install-license
install-license: 
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE  $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
## -- BLOCK:license --
## -- BLOCK:man --
install: install-man
install-man:
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/prompt.3 $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/fgetpw.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
