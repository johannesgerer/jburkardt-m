function r8mat_l_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_L_PRINT prints a lower triangular matrix.
%
%  Example:
%
%    M = 5, N = 5
%    A = (/ 11, 21, 31, 41, 51, 22, 32, 42, 52, 33, 43, 53, 44, 54, 55 /)
%
%    11
%    21 22
%    31 32 33
%    41 42 43 44
%    51 52 53 54 55
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
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
%    Input, real A(*), the M by N matrix.  Only the lower
%    triangular elements are stored, in column major order.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  jmax = min ( n, m );

  if ( m <= n )
    size = floor ( ( m * ( m + 1 ) ) / 2 );
  elseif ( n < m )
    size = floor ( ( n * ( n + 1 ) ) / 2 + ( m - n ) * n );
  end

  if ( all ( a(1:size) == round ( a(1:size) ) ) )

    nn = 10;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, min ( m, jmax ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Col ' );
      for j = jlo : jhi
        fprintf ( 1, '%6d', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Row ' );
      for i = jlo : m
        jhi = min ( jlo + nn - 1, min ( i, jmax ) );
        for j = jlo : jhi
          indx(j+1-jlo) = ( j - 1 ) * m + i - floor ( ( j * ( j - 1 ) ) / 2 );
        end
        fprintf ( 1, '  %6d', i );
        for j = 1 : jhi+1-jlo
          fprintf ( 1, '%6d', a(j) );
        end
        fprintf ( 1, '\n' );
      end
    end

  elseif ( max ( abs ( a(1:size) ) ) < 1000000.0 )

    nn = 5;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, m - 1, jmax );
      fprintf ( 1, '\n' );
      fprintf ( 1, '      ' );
      for j = jlo : jhi
        fprintf ( 1, '%7d       ', j );
      end
      fprintf ( 1, '\n' );
      for i = jlo : m
        jhi = min ( jlo + nn - 1, i, jmax );
        for j = jlo : jhi
          indx(j+1-jlo) = ( j - 1 ) * m + i - floor ( ( j * ( j - 1 ) ) / 2 );
        end
        fprintf ( 1, '  %6d', i );
        for j = 1 : jhi+1-jlo
          fprintf ( 1, '%14g', a(j) );
        end
        fprintf ( 1, '\n' );
      end
    end

  else

    nn = 5;

    for jlo = 1 : nn : jmax
      jhi = min ( jlo + nn - 1, m - 1, jmax );
      fprintf ( 1, '\n' );
      fprintf ( 1, '      ' );
      for j = jlo : jhi
        fprintf ( 1, '%7d       ', j );
      end
      fprintf ( 1, '\n' );
      for i = jlo : m
        jhi = min ( jlo + nn - 1, i, jmax );
        for j = jlo : jhi
          indx(j+1-jlo) = ( j - 1 ) * m + i - floor ( ( j * ( j - 1 ) ) / 2 );
        end
        fprintf ( 1, '  %6d', i );
        for j = 1 : jhi+1-jlo
          fprintf ( 1, '%14g', a(j) );
        end
        fprintf ( 1, '\n' );
      end
    end

  end

  return
end
