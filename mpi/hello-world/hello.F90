program hello
  use mpi_f08
  implicit none
  integer :: rc, lenname
  character(len=MPI_MAX_PROCESSOR_NAME) :: procname
  call mpi_init(rc)
  call mpi_get_processor_name(procname, rc)
  print *, 'hello'
  print *, procname

  call mpi_finalize(rc)
  ! TODO: say hello! in parallel
!  write(*,*) 'Hello!'

end program hello
