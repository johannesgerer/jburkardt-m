subroutine triangle_read ( infile, m, n, table )

  integer ( kind = 4 ) m, n
  integer ( kind = 4 ) i
  character ( len = * ) infile
  integer ( kind = 4 ) inunit
  integer ( kind = 4 ) table(m,n)

  open ( unit = inunit, file = infile, status = 'old' )
  do i = 1, m
    read ( inunit, * ) table(i,1:n)
  end do
  close ( unit = inunit )

  return
end
