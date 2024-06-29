program lab
use mpi_f08
implicit none

integer :: ntasks, rank, rc
integer :: datasize = 100
integer, allocatable :: data(:)
integer, allocatable :: batch(:)
integer :: i
integer :: batch_size
integer :: sendbuf(8) = -1
integer :: color
integer :: subrank
type(MPI_Comm) :: subcomm

call mpi_init(rc)
call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)
call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)

if (rank == 0) then 
    sendbuf = 99
end if

if (rank == 1) then
    sendbuf = 99
end if

!!Now splitting
if (mod(rank,2) == 0) then
  color = 1
else
  color = 2
end if

call MPI_Comm_split(MPI_COMM_WORLD, color, rank, subcomm, rc);
call MPI_Comm_rank(subcomm, subrank, rc);

print *,"-----------------------------------\n"
print *, "COLOR", color
print *, "BEFORE BROADCAST rank:", rank, "buf:", sendbuf 
call MPI_Bcast(sendbuf, 8, MPI_INT, 0, subcomm, rc);

print *, "AFTER BROADCAST rank:", rank, "buf:", sendbuf
print *, "SUBRANK", subrank

call mpi_finalize(rc)
end program lab