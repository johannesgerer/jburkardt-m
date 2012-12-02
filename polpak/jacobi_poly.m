function cx = jacobi_poly ( n, alpha, beta, x )

%*****************************************************************************80
%
%% JACOBI_POLY evaluates the Jacobi polynomials at X.
%
%  Differential equation:
%
%    (1-X*X) Y'' + (BETA-ALPHA-(ALPHA+BETA+2) X) Y' + N (N+ALPHA+BETA+1) Y = 0
%
%  Recursion:
%
%    P(0,ALPHA,BETA,X) = 1,
%
%    P(1,ALPHA,BETA,X) = ( (2+ALPHA+BETA)*X + (ALPHA-BETA) ) / 2
%
%    P(N,ALPHA,BETA,X)  = 
%      ( 
%        (2*N+ALPHA+BETA-1) 
%        * ((ALPHA**2-BETA**2)+(2*N+ALPHA+BETA)*(2*N+ALPHA+BETA-2)*X) 
%        * P(N-1,ALPHA,BETA,X)
%        -2*(N-1+ALPHA)*(N-1+BETA)*(2*N+ALPHA+BETA) * P(N-2,ALPHA,BETA,X)
%      ) / 2*N*(N+ALPHA+BETA)*(2*N-2+ALPHA+BETA)
%
%  Restrictions:
%
%    -1 < ALPHA
%    -1 < BETA
%
%  Norm:
%
%    Integral ( -1 <= X <= 1 ) ( 1 - X )**ALPHA * ( 1 + X )**BETA 
%      * P(N,ALPHA,BETA,X)**2 dX 
%    = 2**(ALPHA+BETA+1) * Gamma ( N + ALPHA + 1 ) * Gamma ( N + BETA + 1 ) /
%      ( 2 * N + ALPHA + BETA ) * N! * Gamma ( N + ALPHA + BETA + 1 )
%
%  Special values:
%
%    P(N,ALPHA,BETA)(1) = (N+ALPHA)!/(N!*ALPHA!) for integer ALPHA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2004
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
%    Input, integer N, the highest order polynomial to compute.  Note
%    that polynomials 0 through N will be computed.
%
%    Input, real ALPHA, one of the parameters defining the Jacobi
%    polynomials, ALPHA must be greater than -1.
%
%    Input, real BETA, the second parameter defining the Jacobi
%    polynomials, BETA must be greater than -1.
%
%    Input, real X, the point at which the polynomials are to be evaluated.
%
%    Output, real CX(1:N+1), the values of the first N+1 Jacobi
%    polynomials at the point X.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_POLY - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of ALPHA = %f\n', alpha );
    fprintf ( 1, '  But ALPHA must be greater than -1.\n' );
    error ( 'JACOBI_POLY - Fatal error!' );
  end
 
  if ( beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_POLY - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of BETA = %f\n', beta );
    fprintf ( 1, '  But BETA must be greater than -1.\n' );
    error ( 'JACOBI_POLY - Fatal error!' );
  end
  
  if ( n < 0 )
    cx = [];
    return
  end

  cx(1) = 1.0;

  if ( n == 0 )
    return
  end

  cx(2) = ( 1.0 + 0.5 * ( alpha + beta ) ) * x  + 0.5 * ( alpha - beta );
 
  for i = 2 : n

    c1 = 2 * i * ( i + alpha + beta ) * ( 2 * i - 2 + alpha + beta );

    c2 = ( 2 * i - 1 + alpha + beta ) * ( 2 * i + alpha + beta ) ...
      * ( 2 * i - 2 + alpha + beta );

    c3 = ( 2 * i - 1 + alpha + beta ) * ( alpha + beta ) * ( alpha - beta );

    c4 = - 2 * ( i - 1 + alpha ) * ( i - 1 + beta )  * ( 2 * i + alpha + beta );

    cx(i+1) = ( ( c3 + c2 * x ) * cx(i) + c4 * cx(i-1) ) / c1;

  end

  return
end
