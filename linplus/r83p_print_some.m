function r83p_print_some ( n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R83P_PRINT_SOME prints some of a R83P matrix.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as
%    a 3 by N array, in which each row corresponds to a diagonal, and
%    column locations are preserved.  The matrix value
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
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
%    Input, real A(3,N), the R83P matrix.
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
  for j2lo = jlo: incx : jhi

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );
    for j = j2lo : j2hi
      fprintf ( '%7d       ', j );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '  ---\n' );
%
%  Determine the column range of the rows in this strip.
%
    i2lo = max ( ilo, 1 );

    if ( 1 < i2lo | j2hi < n )
      i2lo = max ( i2lo, j2lo - 1 );
    end

    i2hi = min ( ihi, n );

    if ( i2hi < n | 1 < j2lo )
      i2hi = min ( i2hi, j2hi + 1 );
    end

    for i = i2lo : i2hi

      fprintf ( 1, '%4d: ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( i == n & j == 1 )
          fprintf ( '%12g  ', a(1,j) );
        elseif ( i == 1 & j == n )
          fprintf ( '%12g  ', a(3,j) );
        elseif ( 1 < i-j | 1 < j-i )
          fprintf ( '              ' );
        elseif ( j == i+1 )
          fprintf ( '%12g  ', a(1,j) );
        elseif ( j == i )
          fprintf ( '%12g  ', a(2,j) );
        elseif ( j == i-1 )
          fprintf ( '%12g  ', a(3,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
