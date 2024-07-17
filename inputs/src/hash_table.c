#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 100

typedef struct Node {
    char *word;
    int count;
    struct Node *next;
} Node;

Node* create_node(const char *word) {
    Node *new_node = (Node*) malloc(sizeof(Node));
    new_node->word = strdup(word);
    new_node->count = 1;
    new_node->next = NULL;
    return new_node;
}

unsigned int hash(const char *word) {
    unsigned int hash_value = 0;
    while (*word) {
        hash_value = (hash_value << 5) + *word++;
    }
    return hash_value % TABLE_SIZE;
}


int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        fprintf(stderr, "Could not open file %s\n", argv[1]);
        return -1;
    }

    Node *hash_table[TABLE_SIZE] = {NULL};
    char word[256];
    int index = 0;
    int c;

    while ((c = fgetc(file)) != EOF) {
        if (isalpha(c)) {
            word[index++] = tolower(c);
        } else {
            if (index > 0) {
                word[index] = '\0';
                 unsigned int index = hash(word);
                Node *current = hash_table[index];
                Node *prev = NULL;

                while (current != NULL && strcmp(current->word, word) != 0) {
                    prev = current;
                    current = current->next;
                }

                if (current == NULL) {
                    Node *new_node = create_node(word);
                    if (prev == NULL) {
                        hash_table[index] = new_node;
                    } else {
                        prev->next = new_node;
                    }
                } else {
                    current->count++;
                }
                            index = 0;
            }
        }
    }

    if (index > 0) {
        word[index] = '\0';
        unsigned int index = hash(word);
        Node *current = hash_table[index];
        Node *prev = NULL;

        while (current != NULL && strcmp(current->word, word) != 0) {
            prev = current;
            current = current->next;
        }

        if (current == NULL) {
            Node *new_node = create_node(word);
            if (prev == NULL) {
                hash_table[index] = new_node;
            } else {
                prev->next = new_node;
            }
        } else {
            current->count++;
        }
    }

    for (int i = 0; i < TABLE_SIZE; i++) {
        Node *current = hash_table[i];
        while (current != NULL) {
            printf("%s: %d\n", current->word, current->count);
            current = current->next;
        }
    }


    for (int i = 0; i < TABLE_SIZE; i++) {
        Node *current = hash_table[i];
        while (current != NULL) {
            Node *temp = current;
            current = current->next;
            free(temp->word);
            free(temp);
        }
    }

    fclose(file);
    return 0;
}