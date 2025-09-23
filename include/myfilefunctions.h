// Count lines, words, characters in file. Return 0 on success, -1 on failure.
int wordCount(FILE* file, int* lines, int* words, int* chars);

// Search lines containing search_str in file, fill matches array.
// Return count of matches, or -1 on failure.
int mygrep(FILE* fp, const char* search_str, char*** matches);
