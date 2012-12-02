function r83_print_some ( n, a, ilo, jlo, ihi, jhi,title )

%*****************************************************************************80
%
%% R83_PRINT_SOME prints some of a R83 matrix.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
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
%    Input, real A(3,N), the R83 matrix.
%
%    Input, integer ILO, JLO, IHI, JHI, the first row and
%    column, and the last row and column, to be printed.
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
    i2lo = max ( i2lo, j2lo - 1 );
    i2hi = min ( ihi, n );
    i2hi = min ( i2hi, j2hi + 1 );

    for i = i2lo : i2hi
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      fprintf ( 1, '%5d:', i );

      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( 1 < i-j | 1 < j-i )
          fprintf ( 1, '              ' );
        elseif ( j == i+1 )
          fprintf ( 1, '%14f', a(1,j) );
        elseif ( j == i )
          fprintf ( 1, '%14f', a(2,j) );
        elseif ( j == i-1 )
          fprintf ( 1, '%14f', a(3,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
