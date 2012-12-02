function r8to_print_some ( n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8TO_PRINT_SOME prints some of a R8TO matrix.
%
%  Discussion:
%
%    The R8TO storage format is used for a Toeplitz matrix, which is constant
%    along diagonals.  Thus, in an N by N Toeplitz matrix, there are at most 
%    2*N-1 distinct entries.  The format stores the N elements of the first
%    row, followed by the N-1 elements of the first column (skipping the
%    entry in the first row).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(2*N-1), the R8TO matrix.
%
%    Input, integer ILO, JLO, IHI, JHI, the first row and
%    column, and the last row and column to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  incx = 5;
%
%  Print the columns of the matrix, in strips of 5.
%
  for j2lo = jlo : incx : jhi

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '  ---\n' );
%
%  Determine the range of the rows in this strip.
%
    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, n );

    for i = i2lo : i2hi

      fprintf ( 1, '%4d  ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( i <= j )
          aij = a(j+1-i);
        else
          aij = a(n+i-j);
        end

        fprintf ( 1, '%12f  ', aij );

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
