Q1: Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?

Answer:

Part 2 Makefile: Directly compiled all .c files and linked them together into the final executable.

Part 3 Makefile:

Separates utility functions into object files.

Creates a static library (lib/libmyutils.a) using ar rcs.

Links main.c with this library instead of compiling everything together.

Key difference: Part 3 adds rules for building and using a static library.

Q2: What is the purpose of the ar command? Why is ranlib often used immediately after it?

Answer:

ar is used to bundle multiple object files into one static library (.a file).

ranlib creates an index inside the library so the linker can quickly find symbols.

On modern systems, ar rcs already updates the index, so ranlib is not always required.

Q3: When you run nm on your client_static executable, are the symbols for functions like mystrlen present? What does this tell you about how static linking works?

Answer:

No, the function symbols (like mystrlen) are not visible in the executable.

This means static linking copies the function code directly into the executable.

The executable contains the actual machine code, not separate references.
