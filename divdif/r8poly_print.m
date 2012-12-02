function r8poly_print ( n, a, title )

%*****************************************************************************80
%
%% R8POLY_PRINT prints out a polynomial.
%
%  Discussion:
%
%    The power sum form is:
%
%      p(x) = a(1) + a(2) * x + ... + a(n-1) * x**(n-1) + a(n) * x**(n-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Input, real A(1:N), the polynomial coefficients.
%    A(1) is the constant term and
%    A(N) is the coefficient of X**(N-1).
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  n = r8poly_order ( n, a );

  if ( n == 0 )
    fprintf ( 1, '  p(x) = 0\n' );
    return
  end

  if ( a(n) < 0.0 )
    plus_minus = '-';
  else
    plus_minus = ' ';
  end

  mag = abs ( a(n) );

  if ( 3 <= n )
    fprintf ( 1, '  p(x) = %c%14f * x^%d\n', plus_minus, mag, n-1 );
  elseif ( n == 2 )
    fprintf ( 1, '  p(x) = %c%14f * x\n', plus_minus, mag );
  elseif ( n == 1 )
    fprintf ( 1, '  p(x) = %c%14f\n', plus_minus, mag );
  end

  for i = n-1 : -1 : 1

    if ( a(i) < 0.0 )
      plus_minus = '-';
    else
      plus_minus = '+';
    end

    mag = abs ( a(i) );

    if ( mag ~= 0.0 )

      if ( 3 <= i )
        fprintf ( 1, '         %c%14f * x^%d\n', plus_minus, mag, i-1 );
      elseif ( i == 2 )
        fprintf ( 1, '         %c%14f * x\n', plus_minus, mag );
      elseif ( i == 1 )
        fprintf ( 1, '         %c%14f\n', plus_minus, mag );
      end
    end

  end

  return
end
