program main

  character ( len = 100 ) :: infile = 'ell_triangles.txt'
  integer ( kind = 4 ) m
  integer ( kind = 4 ), allocatable :: t(:,:)

  call triangle_count ( infile, m )

  allocate ( t(1:m,1:3) )

  call triangle_read ( infile, m, 3, t )

  call triangle_print ( m, 3, t )

  stop
end
subroutine triangle_count ( infile, m )

  integer ( kind = 4 ) dummy(3)
  character ( len = * ) infile
  integer ( kind = 4 ) instatus
  integer ( kind = 4 ) m

  open ( unit = 1, file = infile, status = 'old' )

  m = 0
  do
    read ( 1, *, iostat = instatus ) dummy(1:3)
    if ( instatus /= 0 ) then
      exit
    end if
    m = m + 1
  end do

  close ( unit = 1 )

  return
end
subroutine triangle_print ( m, n, t )

  integer ( kind = 4 ) m, n
  integer ( kind = 4 ) i
  integer ( kind = 4 ) t(m,n)

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Triangle data:'
  write ( *, '(a)' ) ' '
  do i = 1, m
    write ( *, '(3i4)' ) t(i,1:3)
  end do

  return
end
subroutine triangle_read ( infile, m, n, t )

  integer ( kind = 4 ) m, n
  integer ( kind = 4 ) i
  character ( len = * ) infile
  integer ( kind = 4 ) t(m,n)

  open ( unit = 1, file = infile, status = 'old' )
  do i = 1, m
    read ( 1, * ) t(i,1:n)
  end do
  close ( unit = 1 )

  return
end
