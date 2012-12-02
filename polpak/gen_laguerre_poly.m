function cx = laguerre_general ( n, alpha, x )

%*****************************************************************************80
%
%% GEN_LAGUERRE_POLY evaluates generalized Laguerre polynomials.
%
%  Differential equation:
%
%    X * Y'' + (ALPHA+1-X) * Y' + N * Y = 0
%
%  Recursion:
%
%    L(0,ALPHA)(X) = 1
%    L(1,ALPHA)(X) = 1+ALPHA-X
%
%    L(N,ALPHA)(X) = ( (2*N-1+ALPHA-X) * L(N-1,ALPHA)(X) 
%                   - (N-1+ALPHA) * L(N-2,ALPHA)(X) ) / N
%
%  Restrictions:
%
%    -1 < ALPHA
%
%  Special values:
%
%    For ALPHA = 0, the generalized Laguerre polynomial L(N,ALPHA)(X)
%    is equal to the Laguerre polynomial L(N)(X).
%
%    For ALPHA integral, the generalized Laguerre polynomial
%    L(N,ALPHA)(X) equals the associated Laguerre polynomial L(N,ALPHA)(X).
%
%  Norm:
%
%    Integral ( 0 <= X < Infinity ) exp ( - X ) * L(N,ALPHA)(X)**2 dX
%    = Gamma ( N + ALPHA + 1 ) / N!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2010
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
%    Input, integer N, the highest order function to compute.
%
%    Input, real ALPHA, the parameter.  -1 < ALPHA is required.
%
%    Input, real X, the point at which the functions are to be
%    evaluated.
%
%    Output, real CX(1:N+1), the polynomials of 
%    degrees 0 through N evaluated at the point X.
%
  if ( alpha <= -1.0E+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEN_LAGUERRE_POLY - Fatal error!\n' );
    fprintf ( 1, '  The input value of ALPHA is %f\n', alpha );
    fprintf ( 1, '  but ALPHA must be greater than -1.\n' );
    error ( 'GEN_LAGUERRE_POLY - Fatal error!' );
  end
 
  if ( n < 0 )
    cx = [];
    return
  end

  cx(1) = 1.0;

  if ( n == 0 )
    return
  end

  cx(2) = 1.0 + alpha - x;

  for i = 2 : n
    cx(i+1) = ( ( ( 2 * i - 1 ) + alpha - x ) * cx(i)     ...
              + ( (   - i + 1 ) - alpha     ) * cx(i-1) ) ...
                / (     i );
  end

  return
end
