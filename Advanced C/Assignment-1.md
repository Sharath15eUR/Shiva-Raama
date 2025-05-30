#    Assignment 1


## Question 1 :  C program that represents the calender for the week
```
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_TASKS 3
#define MAX_DAYS 7
#define MAX_TASK_LEN 100

typedef struct {
    char name[10];
    char tasks[MAX_TASKS][MAX_TASK_LEN];
    int taskCount;
} Day;

// Initializing days

void initializeWeek(Day week[]) {
    const char *names[MAX_DAYS] = {
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    };
    for (int i = 0; i < MAX_DAYS; i++) {
        strcpy(week[i].name, names[i]);
        week[i].taskCount = 0;
    }
}

// Finding day index by name

int findDayIndex(Day week[], const char *dayName) {
    for (int i = 0; i < MAX_DAYS; i++) {
        if (strcasecmp(week[i].name, dayName) == 0)
            return i;
    }
    return -1;
}

// To add Tasks

void addTask(Day week[]) {
    char input[20];
    printf("Enter day name: ");
    scanf("%s", input);

    int index = findDayIndex(week, input);
    if (index == -1) {
        printf("Invalid day name. Try again.\n");
        return;
    }

    if (week[index].taskCount >= MAX_TASKS) {
        printf("Task limit reached for %s (max %d tasks).\n", week[index].name, MAX_TASKS);
        return;
    }

    getchar();
    printf("Enter task: ");
    fgets(week[index].tasks[week[index].taskCount], MAX_TASK_LEN, stdin);
    week[index].tasks[week[index].taskCount][strcspn(week[index].tasks[week[index].taskCount], "\n")] = '\0';
    week[index].taskCount++;

    printf("Task added to %s.\n", week[index].name);
}

// Displaying Tasks

void displayTasks(const Day week[]) {
    printf("\n--- Weekly Tasks ---\n");
    for (int i = 0; i < MAX_DAYS; i++) {
        printf("%s:\n", week[i].name);
        if (week[i].taskCount == 0) {
            printf("  No tasks\n");
        } else {
            for (int j = 0; j < week[i].taskCount; j++) {
                printf("  - %s\n", week[i].tasks[j]);
            }
        }
    }
    printf("--------------------\n");
}


int main() {
    Day week[MAX_DAYS];
    int choice;

    initializeWeek(week);

    do {
        printf("\n--- Weekly To-Do List Menu ---\n");
        printf("1. Add Task\n");
        printf("2. Display Tasks\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addTask(week);
                break;
            case 2:
                displayTasks(week);
                break;
            case 3:
                printf("Exiting program.\n");
                break;
            default:
                printf("Invalid choice. Please enter 1, 2, or 3.\n");
        }
    } while (choice != 3);

    return 0;
}
```

## Question 2 : Pointers

```#include <stdio.h>
#include <stdlib.h>

// Rearranging array so that even numbers come first, preserving relative order
void rearrange(int *arr, int size) {
    int *temp = (int *)malloc(size * sizeof(int));
    if (temp == NULL) {
        printf("Memory allocation failed.\n");
        return;
    }

    int *writePtr = temp;

    // Copying even numbers first
    for (int *ptr = arr; ptr < arr + size; ptr++) {
        if (*ptr % 2 == 0) {
            *writePtr = *ptr;
            writePtr++;
        }
    }

    // Then Copying odd numbers
    for (int *ptr = arr; ptr < arr + size; ptr++) {
        if (*ptr % 2 != 0) {
            *writePtr = *ptr;
            writePtr++;
        }
    }

    // Copying back to the original array
    for (int i = 0; i < size; i++) {
        *(arr + i) = *(temp + i);
    }

    free(temp);
}

// Printing array values using pointer arithmetic
void printArray(const int *arr, int size) {
    for (const int *ptr = arr; ptr < arr + size; ptr++) {
        printf("%d ", *ptr);
    }
    printf("\n");
}

int main() {
    int size;

    printf("Enter the number of elements: ");
    scanf("%d", &size);

    if (size <= 0) {
        printf("Invalid array size.\n");
        return 1;
    }

    int *arr = (int *)malloc(size * sizeof(int));
    if (arr == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    printf("Enter %d integers:\n", size);
    for (int *ptr = arr; ptr < arr + size; ptr++) {
        scanf("%d", ptr);
    }

    printf("\nOriginal:   ");
    printArray(arr, size);

    rearrange(arr, size);

    printf("Rearranged: ");
    printArray(arr, size);

    free(arr);
    return 0;
}
```

## Question 3 : Arrays 

```#include <stdio.h>
#include <stdbool.h>

bool searchMatrix(int matrix[][100], int n, int key) {
    int row = 0, col = n - 1;  // Start from top-right

    while (row < n && col >= 0) {
        if (matrix[row][col] == key)
            return true;
        else if (matrix[row][col] > key)
            col--;  // Move left
        else
            row++;  // Move down
    }
    return false;
}

void printMatrix(int matrix[][100], int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%4d", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int n, key;
    int matrix[100][100];

    printf("Enter the size of the matrix (n x n): ");
    scanf("%d", &n);

    printf("Enter the elements: \n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            scanf("%d", &matrix[i][j]);

    printf("\nMatrix:\n");
    printMatrix(matrix, n);

    printf("\nEnter the key to search: ");
    scanf("%d", &key);

    if (searchMatrix(matrix, n, key))
        printf("Key %d found.\n", key);
    else
        printf("Key %d not found.\n", key);

    return 0;
}
```
