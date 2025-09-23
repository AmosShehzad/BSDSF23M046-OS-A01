CC = gcc
CFLAGS = -Iinclude -Wall -g

SRC = src/main.c
OBJ_MAIN = obj/main.o

UTIL_SRC = src/mystrfunctions.c src/myfilefunctions.c
UTIL_OBJ = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.a

TARGET = bin/client_static

all: $(TARGET)

# Compile main
obj/main.o: src/main.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile utils into object files
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Create static library
$(LIB): $(UTIL_OBJ)
	ar rcs $(LIB) $(UTIL_OBJ)

# Link main with library
$(TARGET): $(OBJ_MAIN) $(LIB)
	$(CC) $(OBJ_MAIN) -Llib -lmyutils -o $(TARGET)

clean:
	rm -f obj/*.o $(LIB) $(TARGET)
