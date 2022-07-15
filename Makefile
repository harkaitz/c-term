DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROG_PROMPT=tools/prompt$(EXE)
HEADERS    =io/fgetpw.h io/prompt.h

all: $(PROG_PROMPT)
$(PROG_PROMPT): tools/prompt.c io/prompt.h
	$(CC) -o $@ tools/prompt.c $(CFLAGS)
install: $(PROG_PROMPT) $(HEADERS) 
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/io
	cp $(PROG_PROMPT) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/io
clean:
	rm -f $(PROG_PROMPT)


## -- manpages --
install: install-man
install-man: ./doc/prompt.3.md ./doc/fgetpw.3.md 
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/prompt.3 ./doc/fgetpw.3  $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-term
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-term
## -- license --
