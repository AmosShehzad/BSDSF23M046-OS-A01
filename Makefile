CC = gcc
CFLAGS = -Iinclude -Wall -g -fPIC
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c,obj/%.o,$(SRC))
STATIC_LIB = lib/libmyutils.a
DYNAMIC_LIB = lib/libmyutils.so
TARGET_STATIC = bin/client_static
TARGET_DYNAMIC = bin/client_dynamic

all: $(TARGET_STATIC) $(TARGET_DYNAMIC)

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(STATIC_LIB): obj/mystrfunctions.o obj/myfilefunctions.o
	ar rcs $(STATIC_LIB) $^

$(TARGET_STATIC): $(STATIC_LIB) obj/main.o
	$(CC) obj/main.o -Llib -lmyutils -o $(TARGET_STATIC)

$(DYNAMIC_LIB): obj/mystrfunctions.o obj/myfilefunctions.o
	$(CC) -shared -o $(DYNAMIC_LIB) $^

$(TARGET_DYNAMIC): $(DYNAMIC_LIB) obj/main.o
	$(CC) obj/main.o -Llib -lmyutils -o $(TARGET_DYNAMIC)

clean:
	rm -f obj/*.o $(TARGET_STATIC) $(TARGET_DYNAMIC) $(STATIC_LIB) $(DYNAMIC_LIB)

install:
	sudo cp bin/client_static /usr/local/bin/client
	sudo cp man/man1/*.1 /usr/local/share/man/man1/
	sudo mandb
