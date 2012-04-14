#-----------------------------------------------------------------------------#
# ROTT for OpenWrt-Zipit Makefile.
#-----------------------------------------------------------------------------#

# Only one of the following should be enabled for the shareware
# or full version depending on which wad file you are using
DEFS += -DBUILD_SHAREWARE
#DEFS += -DBUILD_FULL

SDL_CFLAGS = -I$(STAGING_DIR)/usr/include/SDL
SDL_LDFLAGS = -L$(STAGING_DIR)/usr/lib/SDL -lSDL -lSDL_mixer

CFLAGS +=-g -I$(STAGING_DIR)/usr/include $(SDL_CFLAGS) -DUSE_SDL=1 -DPLATFORM_UNIX=1 $(DEFS) -W -Wall -Wno-unused -Wno-pointer-sign $(EXTRACFLAGS)
LDLIBS +=-L$(STAGING_DIR)/usr/lib $(SDL_LDFLAGS) $(EXTRALDFLAGS) -Wl,-E

all: rott

audiolib/audiolib.a:
	$(MAKE) -C audiolib CC="$(CC)" CFLAGS="$(CFLAGS)" LDLIBS="$(LDLIBS)"

rott: 	\
	cin_actr.o \
	cin_efct.o \
	cin_evnt.o \
	cin_glob.o \
	cin_main.o \
	cin_util.o \
	dosutil.o \
	engine.o \
	isr.o \
	modexlib.o \
	rt_actor.o \
	rt_battl.o \
	rt_build.o \
	rt_cfg.o \
	rt_crc.o \
	rt_com.o \
	rt_debug.o \
	rt_dmand.o \
	rt_door.o \
	rt_draw.o \
	rt_floor.o \
	rt_game.o \
	rt_in.o \
	rt_main.o \
	rt_map.o \
	rt_menu.o \
	rt_msg.o \
	rt_net.o \
	rt_playr.o \
	rt_rand.o \
	rt_scale.o \
	rt_sound.o \
	rt_spbal.o \
	rt_sqrt.o \
	rt_stat.o \
	rt_state.o \
	rt_str.o \
	rt_swift.o \
	rt_ted.o \
	rt_util.o \
	rt_view.o \
	rt_vid.o \
	rt_err.o \
	scriplib.o \
	w_wad.o \
	watcom.o \
	z_zone.o \
	byteordr.o \
	dukemusc.o \
	audiolib/audiolib.a \
	winrott.o
	$(CC) $^ $(LDLIBS) -o $@

clean:
	$(MAKE) -C audiolib clean
	rm -rf rott *.o

distclean: clean
	$(MAKE) -C audiolib distclean
	rm -rf *~
