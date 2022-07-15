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
MAN_3=./doc/prompt.3 ./doc/fgetpw.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-term
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-term
## -- license --
