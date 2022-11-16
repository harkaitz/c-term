DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROGRAMS   =tools/prompt$(EXE)
HEADERS    =io/fgetpw.h io/prompt.h

## --------------------------------------------------
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS)
	@echo "B bin/ $(PROGRAMS)"
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	@echo "B include/io/ $(HEADERS)"
	@mkdir -p $(DESTDIR)$(PREFIX)/include/io
	@cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/io
clean:
	@echo "D $(PROGRAMS)"
	@rm -f $(PROGRAMS)

## ---------------------------------------------------
tools/prompt$(EXE): tools/prompt.c io/prompt.h
	@echo "B $@ $^"
	@$(CC) -o $@ tools/prompt.c $(CFLAGS)

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
install: install-license
install-license: LICENSE
	@echo 'I share/doc/c-term/LICENSE'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-term
	@cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-term
## -- license --
