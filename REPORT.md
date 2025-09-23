Q1: What is Position-Independent Code (-fPIC) and why is it a fundamental requirement for creating shared libraries?

Answer:

-fPIC makes code that can run independent of memory address.

Needed because shared libraries can be loaded at any memory location by the OS.

Q2: Explain the difference in file size between your static and dynamic clients. Why does this difference exist?

Answer:

Static client is larger because it contains a full copy of all library functions inside the executable.

Dynamic client is smaller because it only contains references; the code stays in the .so file.

Q3: What is the LD_LIBRARY_PATH environment variable? Why was it necessary to set it for your program to run, and what does this tell you about the responsibilities of the operating system's dynamic loader?

Answer:

LD_LIBRARY_PATH tells the system where to look for shared libraries at runtime.

Without it, the loader cannot find libmyutils.so.

This shows that the dynamic loader is responsible for locating and loading shared libraries before a program runs.
