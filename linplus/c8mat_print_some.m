function c8mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% C8MAT_PRINT_SOME prints some of a C8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, complex A(M,N), the matrix.
%
%    Input, integer ILO, JLO, IHI, JHI, the first row and
%    column, and the last row and column to be printed.
%
%    Input, string TITLE, a title.
%
  incx = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
%
%  Print the columns of the matrix, in strips of INCX.
%
  for j2lo = jlo : incx : jhi

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );
    for j = j2lo : j2hi
      j2 = j + 1 - j2lo;
      fprintf ( 1, '%10d          ', j );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '  ---\n' );
%
%  Determine the range of the rows in this strip.
%
    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi
%
%  Print out (up to) INCX entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( a(i,j) == 0.0 )
          fprintf ( 1, '       0.0          ' );
        elseif ( imag ( a(i,j) ) == 0.0 )
          fprintf ( 1, ' %9f          ', real ( a(i,j) ) );
        else
          fprintf ( 1, ' %9f %9f', real ( a(i,j) ), imag ( a(i,j) ) );
       end

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
