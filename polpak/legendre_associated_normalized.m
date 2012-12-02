function cx = legendre_associated_normalized ( n, m, x )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED_NORMALIZED: normalized associated Legendre functions.
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
%    However, we plan to use these functions to build spherical
%    harmonics, so we use a slightly different normalization factor of
%
%      sqrt ( ( ( 2 * N + 1 ) * ( N - M )! ) / ( 4 * pi * ( N + M )! ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%  Parameters:
%
%    Input, integer N, the maximum first index of the Legendre
%    function, which must be at least 0.
%
%    Input, integer M, the second index of the Legendre function,
%    which must be at least 0, and no greater than N.
%
%    Input, real X, the point at which the function is to be
%    evaluated.  X must satisfy -1 <= X <= 1.
%
%    Output, real CX(1:N+1), the values of the first N+1 function.
%
  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!\n' );
    fprintf ( 1, '  Input value of M is %d\n', m );
    fprintf ( 1, '  but M must be nonnegative.\n' );
    error ( 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!' );
  end
 
  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!\n' );
    fprintf ( 1, '  Input value of M = %d\n', m );
    fprintf ( 1, '  Input value of N = %d\n', n );
    fprintf ( 1, '  but M must be less than or equal to N.\n' );
    error ( 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!' );
  end
 
  if ( x < -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!\n' );
    fprintf ( 1, '  Input value of X = %f\n', x );
    fprintf ( 1, '  but X must be no less than -1.\n' );
    error ( 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!' );
  end

  if ( 1.0 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!\n' );
    fprintf ( 1, '  Input value of X = %f\n', x );
    fprintf ( 1, '  but X must be no more than 1.\n' );
    error ( 'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!' );
  end
  
  cx(1:m) = 0.0;

  cx(m+1) = 1.0;
  somx2 = sqrt ( 1.0 - x * x );
 
  fact = 1.0;
  for i = 1 : m
    cx(m+1) = -cx(m+1) * fact * somx2;
    fact = fact + 2.0;
  end
 
  if ( m < n )
    cx(m+2) = x * ( 2 * m + 1 ) * cx(m+1);
  end

  for i = m+2 : n
    cx(i+1) = ( ( 2 * i     - 1 ) * x * cx(i) ...
              + (   - i - m + 1 ) *     cx(i-1) ) ...
              / (     i - m     );
  end
%
%  Normalization.
%
  for mm = m : n
    factor = sqrt ( ( ( 2 * mm + 1 ) * r8_factorial ( mm - m ) ) ...
      / ( 4.0 * pi * r8_factorial ( mm + m ) ) );
    cx(mm+1) = cx(mm+1) * factor;
  end

  return
end
