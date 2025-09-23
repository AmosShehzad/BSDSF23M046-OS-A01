Q1 — Explain the linking rule $(TARGET): $(OBJECTS) and difference versus library linking.
A: $(TARGET): $(OBJECTS) means the final executable TARGET depends on the object files OBJECTS. When any object changes,
make runs the link recipe to create the executable from those object files. Linking against a library differs 
because you link with a single library file (static .a or shared .so) using -l/-L flags; the linker pulls needed 
symbols from the library. With a library, object files are usually compiled into an archive first (ar for .a), then 
executable links against the archive — this can reduce recompilation of many object files if the library hasn't changed.

Q2 — What is a git tag and difference between a simple tag and an annotated tag?
A: A git tag marks a specific commit as a release point. A lightweight (simple) tag is just a name referring to a commit. 
An annotated tag stores metadata (tagger name, date, message) as a full git object — it is preferred for releases because it includes a message and can be signed.

Q3 — Purpose of creating a GitHub Release and significance of attaching binaries.
A: A Release packages a stable snapshot of the project for users. Attaching binaries (like the compiled client) gives users 
a ready-to-run executable without building from source — convenient for graders and end users.
