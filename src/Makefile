# Sub-Makefile (inside src)

CC = gcc
CFLAGS = -I../include -Wall -g
SRC = $(wildcard *.c)
OBJ = $(patsubst %.c,../obj/%.o,$(SRC))

.PHONY: all clean

all: $(OBJ)

# Compile each .c into obj/
../obj/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f ../obj/*.o
