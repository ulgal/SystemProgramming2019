CC=gcc
CFLAGS=-Wall
LIBS=-lpthread
PROGS = q4

FILES = Makefile q4.c csapp.h csapp.c

all: $(PROGS)

q4: $(PROGS).c 
	$(CC) $(CFLAGS) $(LIBS) -o echoclient $(PROGS).c

clean:
	rm -f $(PROGS)