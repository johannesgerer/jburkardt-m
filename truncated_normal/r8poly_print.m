function r8poly_print ( m, a, title )

%*****************************************************************************80
%
%% R8POLY_PRINT prints out a polynomial.
%
%  Discussion:
%
%    The power sum form is:
%
%      p(x) = a(1) + a(2) * x + ... + a(m-1) * x^(m-1) + a(m) * x^(m-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the nominal degree of the polynomial.
%
%    Input, real A(1:M+1), the polynomial coefficients.
%    A(1) is the constant term and
%    A(M+1) is the coefficient of X^(M).
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  if ( a(m+1) < 0.0 )
    plus_minus = '-';
  else
    plus_minus = ' ';
  end

  mag = abs ( a(m+1) );

  if ( 3 <= m + 1 )
    fprintf ( 1, '  p(x) = %c%14g * x^%d\n', plus_minus, mag, m );
  elseif ( m + 1 == 2 )
    fprintf ( 1, '  p(x) = %c%14g * x\n', plus_minus, mag );
  elseif ( m + 1 == 1 )
    fprintf ( 1, '  p(x) = %c%14g\n', plus_minus, mag );
  end

  for i = m : -1 : 1

    if ( a(i) < 0.0 )
      plus_minus = '-';
    else
      plus_minus = '+';
    end

    mag = abs ( a(i) );

    if ( mag ~= 0.0 )

      if ( 3 <= i )
        fprintf ( 1, '         %c%14g * x^%d\n', plus_minus, mag, i-1 );
      elseif ( i == 2 )
        fprintf ( 1, '         %c%14g * x\n', plus_minus, mag );
      elseif ( i == 1 )
        fprintf ( 1, '         %c%14g\n', plus_minus, mag );
      end
    end

  end

  return
end
