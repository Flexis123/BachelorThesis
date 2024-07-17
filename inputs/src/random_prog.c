#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function declarations
void greetUser();
void arithmeticOperations();
void arrayOperations();
void stringOperations();
int add(int a, int b);
int subtract(int a, int b);
int multiply(int a, int b);
float divide(int a, int b);
void printArray(int arr[], int size);
int findMax(int arr[], int size);
int findMin(int arr[], int size);
int stringLength(char str[]);
void reverseString(char str[]);
void toUpperCase(char str[]);
void toLowerCase(char str[]);

int main() {
    greetUser();

    int choice;
    do {
        printf("\nChoose an operation to perform:\n");
        printf("1. Arithmetic Operations\n");
        printf("2. Array Operations\n");
        printf("3. String Operations\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                arithmeticOperations();
                break;
            case 2:
                arrayOperations();
                break;
            case 3:
                stringOperations();
                break;
            case 4:
                printf("Exiting the program. Goodbye!\n");
                break;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    } while (choice != 4);

    return 0;
}

void greetUser() {
    printf("Welcome to the C program with multiple functions!\n");
}

void arithmeticOperations() {
    int a, b;
    printf("Enter two integers: ");
    scanf("%d %d", &a, &b);
    
    printf("Addition of %d and %d is: %d\n", a, b, add(a, b));
    printf("Subtraction of %d from %d is: %d\n", b, a, subtract(a, b));
    printf("Multiplication of %d and %d is: %d\n", a, b, multiply(a, b));
    printf("Division of %d by %d is: %.2f\n", a, b, divide(a, b));
    
    // Additional calls
    int sum = add(a, b);
    int diff = subtract(a, b);
    printf("Addition of %d and %d again is: %d\n", a, b, add(sum, diff));
    printf("Subtraction of %d from %d again is: %d\n", diff, sum, subtract(sum, diff));
}

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int multiply(int a, int b) {
    return a * b;
}

float divide(int a, int b) {
    if (b != 0)
        return (float)a / b;
    else {
        printf("Error! Division by zero.\n");
        return 0;
    }
}

void arrayOperations() {
    int size;
    printf("Enter the size of the array: ");
    scanf("%d", &size);

    int arr[size];
    printf("Enter %d elements of the array: ", size);
    for (int i = 0; i < size; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Array elements: ");
    printArray(arr, size);
    printf("Maximum element in the array is: %d\n", findMax(arr, size));
    printf("Minimum element in the array is: %d\n", findMin(arr, size));
    
    // Additional calls
    int max = findMax(arr, size);
    int min = findMin(arr, size);
    printf("Addition of max and min in the array is: %d\n", add(max, min));
    printf("Subtraction of min from max in the array is: %d\n", subtract(max, min));
}

void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int findMax(int arr[], int size) {
    int max = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

int findMin(int arr[], int size) {
    int min = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    return min;
}

void stringOperations() {
    char str[100];
    printf("Enter a string: ");
    scanf(" %[^\n]s", str);
    
    printf("Length of string \"%s\" is: %d\n", str, stringLength(str));
    reverseString(str);
    printf("Reversed string is: %s\n", str);
    toUpperCase(str);
    printf("Uppercase string is: %s\n", str);
    toLowerCase(str);
    printf("Lowercase string is: %s\n", str);
    
    // Additional calls
    printf("Length of string \"%s\" again is: %d\n", str, stringLength(str));
    reverseString(str);
    printf("Reversed string again is: %s\n", str);
}

int stringLength(char str[]) {
    return strlen(str);
}

void reverseString(char str[]) {
    int n = strlen(str);
    for (int i = 0; i < n / 2; i++) {
        char temp = str[i];
        str[i] = str[n - i - 1];
        str[n - i - 1] = temp;
    }
}

void toUpperCase(char str[]) {
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] >= 'a' && str[i] <= 'z') {
            str[i] = str[i] - ('a' - 'A');
        }
    }
}

void toLowerCase(char str[]) {
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') {
            str[i] = str[i] + ('a' - 'A');
        }
    }
}