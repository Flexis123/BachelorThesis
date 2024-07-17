

int main() {
    int n, i, sum = 0;

    printf("Enter the size of the array: ");
    scanf("%d", &n);

    int array[n];

    printf("Enter %d elements:\n", n);
    for (i = 0; i < n; i++) {
        scanf("%d", &array[i]);
    }

    for (i = 0; i < n; i++) {
        sum += array[i];
    }

    printf("Sum of the array elements: %d\n", sum);

    return 0;
}