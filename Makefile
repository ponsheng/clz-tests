CC ?= gcc

CFLAGS = -O0 -Wall -I./inc 
EXE_NAME = iteration binary_search byte_shift harley recursive
SRC_DIR = src/

MAIN = $(addprefix src/,main.c)
CHECK = $(addprefix src/,check.c)

EXE = $(addprefix bin/, $(EXE_NAME))
CHECK_EXE = $(addprefix bin/check_, $(EXE_NAME))

all:  bin $(EXE) $(CHECK_EXE)

bin:
	mkdir -p bin
output:
	mkdir -p output

bin/%: $(MAIN) src/%.c
	$(CC) $^ $(CFLAGS) -DALG='"$*"'  -o $@

bin/check_%: $(CHECK) src/%.c
	$(CC) $^ $(CFLAGS) -o $@

run:  bin output $(EXE)
	bin/iteration    

check: bin $(CHECK_EXE)
	bin/check_recursive

.PHONY: clean

clean:
	rm -rf bin output
