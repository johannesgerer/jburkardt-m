function r8poly_print ( n, a, title )

%*****************************************************************************80
%
%% R8POLY_PRINT prints out a polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the formal degree of the polynomial.
%
%    Input, real A(1:N+1), the polynomial coefficients.
%    A(1) is the constant term and
%    A(N+1) is the coefficient of X^N.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  degree = r8poly_degree ( n, a );

  if ( degree == 0 )
    fprintf ( 1, '  p(x) = 0\n' );
    return
  end

  if ( a(degree+1) < 0.0 )
    plus_minus = '-';
  else
    plus_minus = ' ';
  end

  mag = abs ( a(degree+1) );

  if ( 2 <= degree )
    fprintf ( 1, '  p(x) = %c%14f * x^%d\n', plus_minus, mag, degree );
  elseif ( degree == 1 )
    fprintf ( 1, '  p(x) = %c%14f * x\n', plus_minus, mag );
  elseif ( degree == 0 )
    fprintf ( 1, '  p(x) = %c%14f\n', plus_minus, mag );
  end

  for i = degree - 1 : -1 : 0

    if ( a(i+1) < 0.0 )
      plus_minus = '-';
    else
      plus_minus = '+';
    end

    mag = abs ( a(i+1) );

    if ( mag ~= 0.0 )

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
