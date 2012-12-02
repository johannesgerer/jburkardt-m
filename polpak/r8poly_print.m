function r8poly_print ( n, a, title )

%*****************************************************************************80
%
%% R8POLY_PRINT prints out a polynomial.
%
%  Discussion:
%
%    The power sum form is:
%
%      p(x) = a(0) + a(1) * x + ... + a(n-1) * x**(n-1) + a(n) * x**(n)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of A.
%
%    Input, real A(1:N+1), the polynomial coefficients.
%    A(1) is the constant term and
%    A(N+1) is the coefficient of X**N.
%
%    Input, character TITLE(*), an optional title.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  n = r8poly_degree ( n, a );

  if ( a(n+1) < 0.0 )
    plus_minus = '-';
  else
    plus_minus = ' ';
  end

  mag = abs ( a(n+1) );

  if ( 2 <= n )
    fprintf ( 1, '  p(x) = %c%14f * x^%d\n', plus_minus, mag, n );
  elseif ( n == 1 )
    fprintf ( 1, '  p(x) = %c%14f * x\n', plus_minus, mag );
  elseif ( n == 0 )
    fprintf ( 1, '  p(x) = %c%14f\n', plus_minus, mag );
  end

  for i = n-1 : -1 : 0

    if ( a(i+1) < 0.0 )
      plus_minus = '-';
    else
      plus_minus = '+';
    end

    mag = abs ( a(i+1) );

    if ( mag ~= 0.0E+00 )

      if ( 2 <= i )
        fprintf ( 1, '         %c%14f * x^%d\n', plus_minus, mag, i );
      elseif ( i == 1 )
        fprintf ( 1, '         %c%14f * x\n', plus_minus, mag );
      elseif ( i == 0 )
        fprintf ( 1, '         %c%14f\n', plus_minus, mag );
      end
    end

  end

  return
end
