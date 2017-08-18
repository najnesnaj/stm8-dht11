SDCC=sdcc
SDLD=sdcc
OBJECTS=dht11.ihx 

.PHONY: all clean flash

all: $(OBJECTS)

clean:
	rm -f $(OBJECTS)

flash: dht11.ihx
	stm8flash -c stlink-v2 -pstm8s103?3 -w dht11.ihx

%.ihx: %.c stm8.h
	$(SDCC) -lstm8 -mstm8 --out-fmt-ihx $(CFLAGS) $(LDFLAGS) $<
	stm8flash -c stlinkv2 -p stm8s103?3 -w dht11.ihx
	# minicom -b 115200 -D /dev/ttyUSB4
