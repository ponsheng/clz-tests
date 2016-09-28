CC ?= gcc

CFLAGS = -O0 -Wall -I./inc 
EXE_NAME = iteration binary_search byte_shift harley
SRC_DIR = src/

MAIN = $(addprefix src/,main.c)
EXE = $(addprefix bin/, $(EXE_NAME))

all:  bin $(EXE)


bin:
	mkdir -p bin


bin/%: $(MAIN) src/%.c
	$(CC) $^ $(CFLAGS) -o $@


run:  bin $(EXE)
	bin/iteration    


.PHONY: clean

clean:
	rm -rf bin
