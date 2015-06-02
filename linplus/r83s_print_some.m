function r83s_print_some ( n, a, ilo, jlo, ihi, jhi,title )

%*****************************************************************************80
%
%% R83S_PRINT_SOME prints some of a R83 matrix.
%
%  Discussion:
%
%    The R83S storage format is used for a tridiagonal scalar matrix.
%    The vector A(3) contains the subdiagonal, diagonal, and superdiagonal
%    values that occur on every row.
%
%  Example:
%
%    Here is how a R83S matrix of order 5, stored as (A1,A2,A3), would
%    be interpreted:
%
%      A2  A3   0   0   0
%      A1  A2  A3   0   0
%       0  A1  A2  A3   0 
%       0   0  A1  A2  A3
%       0   0   0  A1  A2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2014
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
%    Input, real A(3), the R83S matrix.
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

        if ( 1 < i - j | 1 < j - i )
          fprintf ( 1, '              ' );
        elseif ( j == i - 1 )
          fprintf ( 1, '%14g', a(1) );
        elseif ( j == i )
          fprintf ( 1, '%14g', a(2) );
        elseif ( j == i + 1 )
          fprintf ( 1, '%14g', a(3) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
