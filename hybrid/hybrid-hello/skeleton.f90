program hello
    use omp_lib
    use mpi
    implicit none
    integer :: mpi_rank, tid, rc
    integer :: provided, required=MPI_THREAD_FUNNELED
    integer :: i
    integer :: priv = 5
    call MPI_Init_thread(required, provided, rc)
    ! print *, "THE REQUESTED THREAD SUPPORT/SAFETY LEVEL IS: ",required
    ! print *, "THE PROVIDED THREAD SUPPORT/SAFETY LEVEL IS: ",provide
    
    !$omp parallel default(NONE) private(tid, i, priv, mpi_rank) shared(rc)
    priv = omp_get_thread_num()
    ! print *, 'PRIVATE', priv
    
    ! $omp single
      do i=1,3
          !$omp task
    !     print *, "----------------------------------------"
    !     call MPI_Comm_rank(MPI_COMM_WORLD, mpi_rank, rc)
    !     print *, "RANK", mpi_rank
    !     priv=priv*2
          print *,"PRIVATE", priv
    !     tid = omp_get_thread_num()
    !     print *, "THREAD ID", tid
          !$omp end task
      end do
    ! $omp end single
    !$omp end parallel



    ! TODO: Initialize MPI with thread support.

    ! TODO: Find out the MPI rank and thread ID of each thread and print
    !       out the results.

    ! TODO: Investigate the provided thread support level.

    call MPI_Finalize(rc)
end program hello
