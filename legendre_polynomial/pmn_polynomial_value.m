function cx = pmn_polynomial_value ( mm, n, m, x )

%*****************************************************************************80
%
%% PMN_POLYNOMIAL_VALUE: normalized Legendre polynomial Pmn(n,m,x).
%
%  Discussion:
%
%    The unnormalized associated Legendre functions P_N^M(X) have
%    the property that
%
%      Integral ( -1 <= X <= 1 ) ( P_N^M(X) )^2 dX 
%      = 2 * ( N + M )! / ( ( 2 * N + 1 ) * ( N - M )! )
%
%    By dividing the function by the square root of this term,
%    the normalized associated Legendre functions have norm 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%  Parameters:
%
%    Input, integer MM, the number of evaluation points.
%
%    Input, integer N, the maximum first index of the Legendre
%    function, which must be at least 0.
%
%    Input, integer M, the second index of the Legendre function,
%    which must be at least 0, and no greater than N.
%
%    Input, real X(MM,1), the evaluation points.
%
%    Output, real CX(MM,N+1), the function values.
%
  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PMN_POLYNOMIAL_VALUE - Fatal error!\n' );
    fprintf ( 1, '  Input value of M is %d\n', m );
    fprintf ( 1, '  but M must be nonnegative.\n' );
    error ( 'PMN_POLYNOMIAL_VALUE - Fatal error!' );
  end
 
  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PMN_POLYNOMIAL_VALUE - Fatal error!\n' );
    fprintf ( 1, '  Input value of M = %d\n', m );
    fprintf ( 1, '  Input value of N = %d\n', n );
    fprintf ( 1, '  but M must be less than or equal to N.\n' );
    error ( 'PMN_POLYNOMIAL_VALUE - Fatal error!' );
  end

  cx = zeros ( mm, n + 1 );

  if ( m <= n )
    cx(1:mm,m+1) = 1.0; 
    factor = 1.0;
    for j = 1 : m
      cx(1:mm,m+1) = - factor * cx(1:mm,m+1) .* sqrt ( 1.0 - x(1:mm,1).^2 );
      factor = factor + 2.0;
    end
  end

  if ( m + 1 <= n )
    cx(1:mm,m+2) = ( 2 * m + 1 ) * x(1:mm) .* cx(1:mm,m+1);
  end

  for j = m + 2 : n
    cx(1:mm,j+1) = ( ( 2 * j     - 1 ) * x(1:mm,1) .* cx(1:mm,j) ...
                   + (   - j - m + 1 ) *              cx(1:mm,j-1) ) ...  
                   / (     j - m     );
  end
%
%  Normalization.
%
  for j = m : n
    factor = sqrt ( ( ( 2 * j + 1 ) * r8_factorial ( j - m ) ) ...
      / ( 2.0 * r8_factorial ( j + m ) ) );
    cx(1:mm,j+1) = cx(1:mm,j+1) * factor;
  end

  return
end
