#uncomment the following line to add checks for buggy ACs which send out
#duplicate packets
#DEFINES= -DBUGGY_AC
#use the following line for OpenBSD support
#DEFINES= -DUSE_BPF
DEFINES= 

#CFLAGS= -Wall -pedantic -ansi -g $(DEFINES)
CFLAGS= -Wall -pedantic -ansi -O2 $(DEFINES)

#Linux support doesn't need extra libraries, but OpenBSD support
#does.  If using OpenBSD, uncomment the following line:
#LIBS=-lkvm


VERSION= 0.3

pppoe: pppoe.o
	$(CC) -o pppoe pppoe.o $(LIBS)

pppoe.o: pppoe.c

distro:
	rm -rf pppoe-$(VERSION)
	mkdir pppoe-$(VERSION)
	cp README LICENSE pppoe.c Makefile README.BSD start pppoe-$(VERSION)
	tar czvf pppoe-$(VERSION).tar.gz pppoe-$(VERSION)/*
