#
# $Log: Makefile,v $
# Revision 1.2  1999/08/19 17:58:51  carsten
# Almost final version
#
# Revision 1.1  1999/08/15 15:38:09  carsten
# Added wmwave project to repository

LIBDIR = -L/usr/X11R6/lib
LIBS   = -lXpm -lXext -lX11 -lm
CFLAGS = -O2 -Wall
OBJS =	 \
		wmgeneral.o \

default:all

.c.o:
	cc $(CFLAGS) -I/usr/X11R6/share/include -c $< -o $*.o

wmwave.o: wmwave.c wmwave-master.xpm
	cc $(CFLAGS) -I/usr/X11R6/share/include -c wmwave.c -o $*.o

wmwave: $(OBJS) wmwave.o
	cc $(CFLAGS) -o wmwave $(OBJS) -lXext $(LIBDIR) $(LIBS) wmwave.o

all:: wmwave

clean::
	rm -f *.o
	rm -f wmwave 
	rm -f *~

install:: wmwave
	install $(INSTALL_OPTS) -o root -g root -m 0755 wmwave $(DESTDIR)/usr/bin/
	install -o root -g root -m 0644 wmwave.1 $(DESTDIR)/usr/share/man/man1/
