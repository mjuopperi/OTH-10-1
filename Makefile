CC=g++
CFLAGS=-c -Wall

all: clean kertomasovellus

update:
	@if [ -d .git ]; then \
		git pull --rebase; \
	else \
		git clone "git@github.com:mjuopperi/OTH-10-1.git"; \
		cd OTH-10-1; \
	fi


kertomasovellus: update main.o kertoma.o
	$(CC) main.o kertoma.o -o kertoma

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp; \

kertoma.o: kertoma.cpp
	$(CC) $(CFLAGS) kertoma.cpp; \

rm_main:
	@if [ -f "kertoma" ] ; then \
                rm kertoma; \
        fi
rm_deps:
	@if [ -f "main.o" ] || [ -f "kertoma.o" ] ; then \
                rm *o; \
        fi

clean: rm_main rm_deps

