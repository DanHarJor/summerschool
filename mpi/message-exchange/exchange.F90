program exchange
  use mpi_f08
  implicit none
  integer, parameter :: arraysize = 100000!, msgsize = 100
  integer :: rc, rank, ntasks, nrecv, i
  type(mpi_status) :: status
  integer :: msgsize
  integer, dimension(msgsize) :: message
  integer :: receiveBuffer(arraysize)

  call mpi_init(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)
  call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)
  
  do i=1,arraysize
    message(i) = rank
  end do

  print *, 'Hello I am rank' 
  print *, rank
  print *, 'Should be 2. The total number of processes is:'
  print *, ntasks
  print *, 'Now I will send an array to the other process that only contains my rank in many elements. MESSAGE:'
  print *, message

  ! call mpi_send(message) 

  ! message = rank
  ! receiveBuffer = -1


  ! TODO: Implement sending and receiving as defined in the assignment
  ! Send msgsize elements from the array "message", and receive into
  ! "receiveBuffer"
  ! if (rank == 0) then

  !    write(*,'(A10,I3,A10,I3, A17, I3)') 'Rank: ', rank, &
  !         ' received ', nrecv, ' elements, first ', receiveBuffer(1)
  ! else if (rank == 1) then

  !    write(*,'(A10,I3,A10,I3, A17, I3)') 'Rank: ', rank, &
  !         ' received ', nrecv, ' elements, first ', receiveBuffer(1)
  ! end if

  call mpi_finalize(rc)

end program exchange
