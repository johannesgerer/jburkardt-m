function cx = legendre_function_q ( n, x )

%*****************************************************************************80
%
%% LEGENDRE_FUNCTION_Q evaluates the Legendre QN functions.
%
%  Differential equation:
%
%    (1-X*X) Y'' - 2 X Y' + N (N+1) = 0
%
%  First terms:
%
%    Q(0)(X) = 0.5 * log((1+X)/(1-X))
%    Q(1)(X) = Q(0)(X)*X - 1 
%    Q(2)(X) = Q(0)(X)*(3*X*X-1)/4 - 1.5*X
%    Q(3)(X) = Q(0)(X)*(5*X*X*X-3*X)/4 - 2.5*X**2 + 2/3
%    Q(4)(X) = Q(0)(X)*(35*X**4-30*X**2+3)/16 - 35/8 * X**3 + 55/24 * X
%    Q(5)(X) = Q(0)(X)*(63*X**5-70*X**3+15*X)/16 - 63/8*X**4 + 49/8*X**2 - 8/15
%
%  Recursion:
%
%    Q(0) = 0.5 * log ( (1+X) / (1-X) )
%    Q(1) = 0.5 * X * log ( (1+X) / (1-X) ) - 1.0
%
%    Q(N) = ( (2*N-1) * X * Q(N-1) - (N-1) * Q(N-2) ) / N
%
%  Restrictions:
%
%    -1 < X < 1
%
%  Special values:
%
%    Note that the Legendre function Q(N)(X) is equal to the
%    associated Legendre function of the second kind,
%    Q(N,M)(X) with M = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2010
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
%    Input, integer N, the highest order function to evaluate.
%
%    Input, real X, the point at which the functions are to be
%    evaluated.  X must satisfy -1 < X < 1.
%
%    Output, real CX(1:N+1), the values of the first N+1 Legendre
%    functions at the point X.
%

%
%  Check the value of X.
%
  if ( x <= -1.0 || 1.0 <= x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_FUNCTION_Q - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of X = %f\n', x );
    fprintf ( 1, '  But X must be between -1 and 1.\n' );
    error ( 'LEGENDRE_FUNCTION_Q - Fatal error!' );
  end
 
  if ( n < 0 )
    cx = [];
    return
  end

  cx(1) = 0.5 * log ( ( 1.0 + x ) / ( 1.0 - x ) );

  if ( n == 0 )
    return
  end

  cx(2) = x * cx(1) - 1.0;

  for i = 2 : n
    cx(i+1) = ( ( 2 * i - 1 ) * x * cx(i)     ...
            +   (   - i + 1 )     * cx(i-1) ) ...
            /   (     i     );
  end
 
  return
end
