# Assignment 2

## 1. Multi-Threaded Task Runner 

```c
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>

// Shared input N
int N;

// Function to check if a number is prime
bool is_prime(int num) {
    if (num < 2) return false;
    for (int i = 2; i * i <= num; i++)
        if (num % i == 0) return false;
    return true;
}

// Thread A: Compute sum of first N prime numbers
void* sum_of_primes(void* arg) {
    int count = 0, num = 2, sum = 0;

    while (count < N) {
        if (is_prime(num)) {
            sum += num;
            count++;
        }
        num++;
    }

    printf("Thread A: Sum of first %d prime numbers is %d\n", N, sum);
    pthread_exit(NULL);
}

// Thread B: Print every 2 seconds for 100 seconds
void* thread1(void* arg) {
    for (int t = 0; t <= 100; t += 2) {
        printf("Thread 1 running\n");
        sleep(2);
    }
    pthread_exit(NULL);
}

// Thread C: Print every 3 seconds for 100 seconds
void* thread2(void* arg) {
    for (int t = 0; t <= 100; t += 3) {
        printf("Thread 2 running\n");
        sleep(3);
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t tidA, tidB, tidC;

    printf("Enter N (number of prime numbers to sum): ");
    scanf("%d", &N);

    // Create the threads
    pthread_create(&tidA, NULL, sum_of_primes, NULL);
    pthread_create(&tidB, NULL, thread1, NULL);
    pthread_create(&tidC, NULL, thread2, NULL);

    // Wait for all threads to finish
    pthread_join(tidA, NULL);
    pthread_join(tidB, NULL);
    pthread_join(tidC, NULL);

    printf("All threads finished.\n");
    return 0;
}
```

## 2. Signal-Handled & Timed Threads

```c
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>
#include <signal.h>
#include <time.h>

// Global input for Thread A
int N;

// Handle Ctrl+C (SIGINT)
void sigint_handler(int sig) {
    printf("\nSIGINT caught. Ignoring termination.\n");
}

// Check if a number is prime
bool is_prime(int num) {
    if (num < 2) return false;
    for (int i = 2; i * i <= num; ++i)
        if (num % i == 0) return false;
    return true;
}

// Timing helper
double get_time_diff(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
}

// Thread A: Sum of first N prime numbers
void* thread_sum_primes(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread A started.\n");

    int count = 0, num = 2, sum = 0;
    while (count < N) {
        if (is_prime(num)) {
            sum += num;
            count++;
        }
        num++;
    }

    printf("Thread A: Sum of first %d prime numbers = %d\n", N, sum);

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread A finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

// Thread B: Prints every 2 seconds
void* thread_print_2s(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread B started.\n");

    for (int t = 0; t <= 100; t += 2) {
        printf("Thread 1 running\n");
        sleep(2);
    }

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread B finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

// Thread C: Prints every 3 seconds
void* thread_print_3s(void* arg) {
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    printf("Thread C started.\n");

    for (int t = 0; t <= 100; t += 3) {
        printf("Thread 2 running\n");
        sleep(3);
    }

    clock_gettime(CLOCK_REALTIME, &end);
    printf("Thread C finished. Time taken: %.2f seconds\n", get_time_diff(start, end));

    pthread_exit(NULL);
}

int main() {
    pthread_t tidA, tidB, tidC;

    // Register signal handler
    signal(SIGINT, sigint_handler);

    printf("Enter N (number of primes to sum): ");
    scanf("%d", &N);

    printf("Starting all threads...\n");

    // Create threads
    pthread_create(&tidA, NULL, thread_sum_primes, NULL);
    pthread_create(&tidB, NULL, thread_print_2s, NULL);
    pthread_create(&tidC, NULL, thread_print_3s, NULL);

    // Wait for threads to finish
    pthread_join(tidA, NULL);
    pthread_join(tidB, NULL);
    pthread_join(tidC, NULL);

    printf("All threads completed.\n");
    return 0;
}
```

## 3. Process Handling

## 1. Child Process – fork()

- `fork()` is a system call in UNIX/Linux used to create a new process, called a child process, which is a copy of the parent.
- After `fork()`, two processes exist with different process IDs.
- Return values:
  - `0` in the child process.
  - PID of the child in the parent.
  - `-1` on error (e.g., if system resources are exhausted).

**Example:**

```c
pid_t pid = fork();
if (pid == 0) {
    // Child process
} else if (pid > 0) {
    // Parent process
}
```
## 2. Handling Common Signals

- In Unix-like systems, signals are used to communicate between processes. A signal is an asynchronous notification sent to a process to notify it of events like exceptions or other conditions that require special handling.

### Common Signals:
- **SIGINT**: Interrupt signal (usually generated by pressing Ctrl+C). It causes a process to terminate.
- **SIGKILL**: Forces a process to terminate immediately. Cannot be caught or ignored.
- **SIGTERM**: Termination signal, can be caught or ignored by processes.
- **SIGSEGV**: Segmentation fault, caused by invalid memory access.
- **SIGCHLD**: Sent to a parent process when one of its child processes terminates.

### Handling Signals:
- You can handle signals using the `signal()` system call. This allows a program to define custom signal handlers to process signals like SIGINT, SIGTERM, or SIGSEGV.

**Example**: If a program wants to handle SIGINT (Ctrl+C), a signal handler function can be defined to prevent termination or take a specific action.

---

## 3. Exploring Different Kernel Crashes

- A kernel crash occurs when the kernel encounters a serious error that it cannot recover from, typically due to a hardware failure, software bug, or resource exhaustion.

### Common Causes:
- **Null Pointer Dereference**: When the kernel tries to access memory through a pointer that is NULL, leading to a crash.
- **Memory Corruption**: A crash can occur due to improper memory handling, such as buffer overflows.
- **Division by Zero**: When the kernel attempts to divide a value by zero.
- **Deadlocks**: When processes or threads are waiting for each other indefinitely, leading to a system freeze.
- **Device Driver Bugs**: Faulty or incompatible device drivers can crash the kernel.
- **Out of Memory**: When the system runs out of memory and the kernel is unable to allocate more, leading to a panic.

### Handling Kernel Crashes:
- **Kernel Panic**: A kernel crash typically results in a "kernel panic," where the kernel halts the system to prevent further damage.
- **Crash Dump**: Many systems generate a crash dump or core dump when a kernel panic occurs. This can be used for post-mortem analysis.

### Preventive Measures:
- **Memory Protection**: Techniques like Address Space Layout Randomization (ASLR) can help prevent certain types of kernel crashes.
- **Proper Driver Handling**: Ensuring device drivers are well-tested can minimize kernel crashes.

---

## 4. Time Complexity

- Time complexity is a way to describe the efficiency of an algorithm in terms of the amount of time it takes to run as a function of its input size. It is often expressed using Big O notation (e.g., O(n), O(log n)).

### Types of Time Complexities:

- **O(1)**: Constant time. The algorithm runs in the same time, regardless of the input size. Example: accessing an element in an array.
- **O(n)**: Linear time. The running time increases linearly with the input size. Example: searching for an element in an unsorted list.
- **O(log n)**: Logarithmic time. The running time grows logarithmically with input size. Example: binary search in a sorted array.
- **O(n²)**: Quadratic time. The running time grows quadratically with the input size. Example: bubble sort.
- **O(n!)**: Factorial time. The running time grows factorially. Example: solving a traveling salesman problem by checking all permutations.

---

## 5. Locking Mechanisms: Mutex and Spinlock

- Locking mechanisms are essential in multi-threading environments to prevent race conditions — situations where multiple threads access and modify shared resources simultaneously, leading to unpredictable results.

### 1. Mutex (Mutual Exclusion Lock)

- A mutex is a synchronization primitive that ensures that only one thread can access a critical section of code at a time. If a thread locks a mutex, other threads attempting to lock the same mutex will be blocked until it is unlocked.

**Blocking**: If a thread tries to lock a mutex that is already locked by another thread, it blocks until the mutex becomes available.

**Use Case**: Best suited for long critical sections where blocking is acceptable.

#### Key Operations:
- `pthread_mutex_lock()`: Locks the mutex (if it’s already locked, the thread is blocked).
- `pthread_mutex_unlock()`: Unlocks the mutex, allowing other threads to access the critical section.

### 2. Spinlock

- A spinlock is a synchronization primitive used in multi-threading to protect shared resources, similar to a mutex, but with a key difference in behavior.

#### Key Points:
- **Non-blocking**: When a thread tries to acquire a spinlock and it is already locked by another thread, the thread does not block. Instead, it repeatedly checks (or "spins") to see if the lock becomes available.
- **Busy-waiting**: This spinning consumes CPU cycles because the thread is constantly checking for the lock rather than yielding control.
- **Short Critical Sections**: Spinlocks are more efficient when the critical section is very short and the lock is expected to be available soon. If the lock is held for a longer time, spinning wastes CPU resources, and a mutex would be a better choice.
- **Performance Considerations**: For short waits, spinlocks can be faster than mutexes because they avoid the overhead of thread context switching. However, for long waits, they can become inefficient because they keep the CPU busy without doing useful work.

---

