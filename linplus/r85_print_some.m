function r85_print_some ( n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R85_PRINT_SOME prints some of a R85 matrix.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
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
%    Input, real A(5,N), the R85 matrix.
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
    fprintf ( 1, '  Col:' );

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
    i2lo = max ( i2lo, j2lo - 2 );

    i2hi = min ( ihi, n );
    i2hi = min ( i2hi, j2hi + 2 );

    for i = i2lo : i2hi

      fprintf ( 1, '%4d', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( 2 < i-j | 2 < j-i )
          fprintf ( 1, '              ' );
        elseif ( j == i+2 )
          fprintf ( 1, '%12f  ', a(1,j) );
        elseif ( j == i+1 )
          fprintf ( 1, '%12f  ', a(2,j) );
        elseif ( j == i )
          fprintf ( 1, '%12f  ', a(3,j) );
        elseif ( j == i-1 )
          fprintf ( 1, '%12f  ', a(4,j) );
        elseif ( j == i-2 )
          fprintf ( 1, '%12f  ', a(5,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
