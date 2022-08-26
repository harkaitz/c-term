DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROGRAMS   =tools/prompt$(EXE)
HEADERS    =io/fgetpw.h io/prompt.h

## --------------------------------------------------
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS) 
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/io
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS)  $(DESTDIR)$(PREFIX)/include/io
clean:
	rm -f $(PROGRAMS)

## ---------------------------------------------------
tools/prompt$(EXE): tools/prompt.c io/prompt.h
	$(CC) -o $@ tools/prompt.c $(CFLAGS)

## -- manpages --
ifneq ($(PREFIX),)
MAN_3=./doc/prompt.3 ./doc/fgetpw.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
endif
## -- manpages --
## -- license --
ifneq ($(PREFIX),)
install: install-license
install-license: LICENSE
	@echo 'I share/doc/c-term/LICENSE'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-term
	@cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-term
endif
## -- license --
