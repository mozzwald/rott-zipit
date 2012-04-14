#CC=gcc
AR=ar
RANLIB=ranlib
CFLAGS+=-Wall -g -O2 -c -I$(STAGING_DIR)/usr/include
LDLIBS+=-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/SDL -lSDL -lpthread

CFLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
LDLIBS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)

OBJ=fx_man.o dsl.o ll_man.o multivoc.o mv_mix.o mvreverb.o nodpmi.o \
	pitch.o user.o usrhooks.o

audiolib.a: $(OBJ)
	#$(CC) $(CFLAGS) $^ $(LDLIBS) -o $@
	rm -rf $@
	$(AR) rc $@ $^
	$(RANLIB) $@

clean:
	rm -rf audiolib.a *.o

distclean: clean
	rm -rf *~
