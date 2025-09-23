# Root Makefile

CC = gcc
CFLAGS = -Iinclude -Wall -g
TARGET = bin/client

.PHONY: all clean run

all: $(TARGET)

# Link final binary
$(TARGET):
	$(MAKE) -C src
	$(CC) obj/*.o -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	$(MAKE) -C src clean
	rm -f $(TARGET)
