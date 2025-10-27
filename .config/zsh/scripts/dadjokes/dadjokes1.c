#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "jokes.h"  // Include your generated jokes header

int main(void) {
    int count = sizeof(jokes) / sizeof(jokes[0]);

    if (count == 0) {
        printf("No jokes found!\n");
        return 0;
    }

    // Seed RNG and pick a random joke
    srand((unsigned int)time(NULL));
    int choice = rand() % count;

    // Print the joke exactly as-is
    printf("%s\n", jokes[choice]);

    return 0;
}

