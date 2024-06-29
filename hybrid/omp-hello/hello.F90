program hello
  implicit none
  integer :: thread
  integer :: dat(5) = -1 
  integer :: i 
  integer :: a = 4
  print *, 'Hello world!'

  ! !$omp parallel default(SHARED) private(thread) firstprivate(dat, a)
  !   thread = omp_get_thread_num()
  !   ! print *, thread
  !   dat = dat * thread
  !   print *,thread, dat
  !   print *, a
  ! !$omp end parallel


  !$omp parallel default(NONE) shared(dat) private(i)
  !$omp do 
    do i=1,5
     dat(i) = i*-1
    end do 
  !$omp end do
  !$omp end parallel

  print *, dat

end program hello
