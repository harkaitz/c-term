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
install: install-man3
install-man3:
	@echo 'I share/man/man3/'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	@echo 'I share/man/man3/prompt.3'
	@cp ./doc/prompt.3 $(DESTDIR)$(PREFIX)/share/man/man3
	@echo 'I share/man/man3/fgetpw.3'
	@cp ./doc/fgetpw.3 $(DESTDIR)$(PREFIX)/share/man/man3
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
