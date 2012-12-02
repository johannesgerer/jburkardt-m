function r8slmat_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8SLMAT_PRINT prints an R8SLMAT.
%
%  Discussion:
%
%    An R8SLMAT is a strict lower triangular matrix of R8's.
%
%  Example:
%
%    M = 5, N = 5
%    A = (/ 21, 31, 41, 51, 32, 42, 52, 43, 53, 54 /)
%
%    21
%    31 32
%    41 42 43
%    51 52 53 54
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(*), the M by N matrix.  Only the strict
%    lower triangular elements are stored, in column major order.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  jmax = min ( n, m - 1 );

  if ( m - 1 <= n )
    size = ( m * ( m - 1 ) ) / 2;
  elseif ( n < m-1 )
    size = ( n * ( n - 1 ) ) / 2 + ( m - n - 1 ) * n;
  end

  if ( all ( a(1:size) == floor ( a(1:size) ) ) );

    nn = 10;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, min ( m - 1, jmax ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Col   ' );
      for j = jlo : jhi
        fprintf ( 1, '%6d', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Row:\n' );
      for i = jlo+1 : m
        jhi = min ( jlo + nn - 1, min ( i - 1, jmax ) );
        fprintf ( 1, '  %6d', i );
        for j = jlo : jhi
          indx = ( j - 1 ) * m + i - ( j * ( j + 1 ) ) / 2;
          fprintf ( 1, '%6d', a(indx) );
        end
        fprintf ( 1, '\n' );
      end
    end

  elseif ( maxval ( abs ( a(1:size) ) ) < 1000000.0 )

    nn = 5;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, min ( m - 1, jmax ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Col   ' );
      for j = jlo : jhi
        fprintf ( 1, '%7d       ', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Row:\n' );
      for i = jlo+1 : m
        jhi = min ( jlo + nn - 1, min ( i - 1, jmax ) );
        fprintf ( 1, '  %6d', i );
        for j = jlo : jhi
          indx = ( j - 1 ) * m + i - ( j * ( j + 1 ) ) / 2;
          fprintf ( 1, '%14g', a(indx) );
        end
        fprintf ( 1, '\n' );
      end
    end

  else

    nn = 5;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, min ( m - 1, jmax ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Col   ' );
      for j = jlo : jhi
        fprintf ( 1, '%7d       ', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Row:\n' );
      for i = jlo+1 : m
        fprintf ( 1, '  %6d', i );
        jhi = min ( jlo + nn - 1, min ( i - 1, jmax ) );
        for j = jlo : jhi
          indx = ( j - 1 ) * m + i - ( j * ( j + 1 ) ) / 2;
          fprintf ( 1, '%14g', a(indx) );
        end
        fprintf ( 1, '\n' );
      end
    end

  end

  return
end
