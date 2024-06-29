## Hybrid Hello World

Write a simple hybrid MPI+OpenMP program.

Launch OpenMP threads within each MPI task and have each thread print out
both the MPI rank and the thread ID. Investigate also the thread support level
of the underlying MPI implementation.

## dependencies

This means that this task takes the variable 'x' in but it does not modify it so any other task that does not modify it declared before and after this one can be executed in paralell
´´´
!$omp task depend(in:x)
    *execute task*
!$omp end task
´´´


This means that this task takes the variable 'x' in and it will modify it, so it must wait for any tasks **(declared before it)** that take x in to finish before it runs. Otherwise a tasks that takes x in would get the modified variable and not the origional variabel.
´´´
!$omp task depend(inout:x)
    *execute task*
!$omp end task
´´´

This means that this task will modify 'x' but it does not need to take in the origional x value. It does not need the origional x value to do it's computations and can just set x to be what it needs it to be. Just like inout, it must wait for any tasks **(declared before it)** that take x in to finish before it runs. Otherwise a tasks that takes x in would get the modified variable and not the origional variabel.
´´´
!$omp task depend(out:x)
    *execute task*
!$omp end task
´´´