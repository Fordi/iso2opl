ISO2OPL=build/iso2opl
OPL2ISO=build/opl2iso
GENVMC=build/genvmc
CC = gcc


CFLAGS = -std=gnu99 -pedantic -I/usr/include -I/usr/local/include -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
#CFLAGS += -DDEBUG

ifeq ($(_WIN32),1)
	CFLAGS += -D_WIN32
endif

ISO2OPL_OBJS = \
	obj/iso2opl/isofs.o \
	obj/iso2opl/iso2opl.o

OPL2ISO_OBJS = \
  obj/opl2iso/opl2iso.o

GENVMC_OBJS = \
	obj/genvmc/genvmc.o

all: $(ISO2OPL) $(OPL2ISO) $(GENVMC)

$(ISO2OPL): $(ISO2OPL_OBJS)
	mkdir -p build
	$(CC) $(ISO2OPL_OBJS) -o $(ISO2OPL) $(LIBS)

$(OPL2ISO): $(OPL2ISO_OBJS)
	mkdir -p build
	$(CC) $(OPL2ISO_OBJS) -o $(OPL2ISO) $(LIBS)

$(GENVMC): $(GENVMC_OBJS)
	mkdir -p build
	$(CC) $(GENVMC_OBJS) -o $(GENVMC) $(LIBS)

obj/%.o: src/%.c
	$(eval TMP_DIR=$(shell dirname "$@"))
	mkdir -p $(TMP_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -r build obj

