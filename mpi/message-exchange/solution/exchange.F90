program exchange
  use mpi_f08
  implicit none
  integer, parameter :: arraysize = 1000, msgsize = 100
  integer :: rc, rank, ntasks, nrecv
  type(mpi_status) :: status
  integer :: message(arraysize)
  integer :: receiveBuffer(arraysize)

  call mpi_init(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)
  call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)

  message = rank
  receiveBuffer = -1

  ! Send and receive as defined in the assignment
  if (rank == 0) then
     call mpi_recv(receiveBuffer, msgsize, MPI_INTEGER, 1,  &
          2, MPI_COMM_WORLD, status, rc)
     call mpi_send(message, msgsize, MPI_INTEGER, 1, &
          1, MPI_COMM_WORLD, rc)
     call mpi_get_count(status, MPI_INTEGER, nrecv, rc)
     write(*,'(A10,I3,A10,I3, A17, I3)') 'Rank: ', rank, &
          ' received ', nrecv, ' elements, first ', receiveBuffer(1)
  else if (rank == 1) then
     call mpi_send(message, msgsize, MPI_INTEGER, 0, &
          2, MPI_COMM_WORLD, rc)
     call mpi_recv(receiveBuffer, msgsize, MPI_INTEGER, 0,  &
          1, MPI_COMM_WORLD, status, rc)
     call mpi_get_count(status, MPI_INTEGER, nrecv, rc)
     write(*,'(A10,I3,A10,I3, A17, I3)') 'Rank: ', rank, &
          ' received ', nrecv, ' elements, first ', receiveBuffer(1)
  end if

  call mpi_finalize(rc)

end program exchange
