program lab
use mpi_f08
implicit none

integer :: ntasks, rank, rc
integer :: datasize = 100
integer, allocatable :: data(:)
integer, allocatable :: batch(:)
integer :: i
integer :: batch_size

call mpi_init(rc)
call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)
call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)



if (rank==0) then
    allocate(data(100))
end if

if (rank>0) then
    print *, 'RANK', rank
end if

batch_size = datasize/ntasks
print *, "BATCH SIZE", batch_size
allocate(batch(batch_size))

if (rank==0) then
    do i = 1,100
        data(i)=i*2 
    end do
    print *, "DATA HERE"
    print *, data
end if

call mpi_scatter(data, batch_size, MPI_INTEGER, batch, batch_size, MPI_INTEGER, 0, MPI_COMM_WORLD, rc)
if (rank>0) then
    print *, batch
end if

call mpi_finalize(rc)
end program lab