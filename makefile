# $Id: Makefile 6177 2007-01-22 14:46:37Z nbd $

STAGING_DIR=/workspace/openwrt/openwrt-sdk-19.07.3-brcm47xx-legacy_gcc-7.5.0_musl.Linux-x86_64/staging_dir
CC=$(STAGING_DIR)/toolchain-mipsel_mips32_gcc-7.5.0_musl/bin/mipsel-openwrt-linux-musl-gcc
STRIP=$(STAGING_DIR)/toolchain-mipsel_mips32_gcc-7.5.0_musl/bin/mipsel-openwrt-linux-musl-strip
CFLAGS=-Wall -I$(STAGING_DIR)/target-mipsel_mips32_musl/usr/include -Isrc/lib
LDFLAGS=-L${STAGING_DIR}/target-mipsel_mips32_musl/usr/lib
#CC = gcc
#CFLAGS += -Wall

%.o: %.c
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c -o $@ $^

epeg: src/bin/epeg_main.o src/lib/epeg_main.o 
	$(CC) $(LDFLAGS) -o $@ $^ -ljpeg -lexif
	$(STRIP) $@

clean:
	rm -f *.o epeg
