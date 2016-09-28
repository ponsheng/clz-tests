CC ?= gcc

CFLAGS = -O0 -Wall -I./inc 
EXE_NAME = iteration binary_search byte_shift harley recursive
SRC_DIR = src/

MAIN = $(addprefix src/,main.c)
CHECK = $(addprefix src/,check.c)

EXE = $(addprefix bin/, $(EXE_NAME))
CHECK_EXE = $(addprefix bin/check_, $(EXE_NAME))
OUTPUT = $(addsuffix .txt , $(addprefix output/output_, $(EXE_NAME)))

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
	bin/binary_search
	bin/byte_shift
	bin/harley
	bin/recursive

check: bin $(CHECK_EXE)
	bin/check_recursive
	bin/check_iteration
	bin/check_binary_search
	bin/check_byte_shift
	bin/check_harley

output/output_%.txt: output bin/% $(MAIN)
	echo $@	
	bin/$*

plot: $(OUTPUT)
	gnuplot script/result.gp
	eog output/result.png

.PHONY: clean

clean:
	rm -rf bin output
