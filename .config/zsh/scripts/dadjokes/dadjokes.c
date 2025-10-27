#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_FILE_SIZE 10000
#define MAX_LINE_LENGTH 512
#define MAX_JOKES 1000

int main(void) {
    FILE *file = fopen("dadjokes.txt", "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // Store lines in memory
    char *jokes[MAX_JOKES];
    int count = 0;
    char buffer[MAX_LINE_LENGTH];

    while (fgets(buffer, sizeof(buffer), file) && count < MAX_JOKES) {
        buffer[strcspn(buffer, "\n")] = '\0'; // remove newline
        jokes[count] = strdup(buffer);        // copy line to jokes array
        count++;
    }
    fclose(file);

    if (count == 0) {
        printf("No jokes found!\n");
        return 0;
    }

    // Pick a random line
    srand((unsigned int)time(NULL));
    int choice = rand() % count;

    // Print the line, splitting on "<>" if present
    char *line = jokes[choice];
    char *token = strtok(line, "<>");
    while (token) {
        printf("%s\n", token);
        token = strtok(NULL, "<>");
    }

    // Free allocated memory
    for (int i = 0; i < count; i++)
        free(jokes[i]);

    return 0;
}

