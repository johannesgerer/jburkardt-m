function v = j_polynomial ( m, n, alpha, beta, x )

%*****************************************************************************80
%
%% J_POLYNOMIAL evaluates the Jacobi polynomials J(N,A,B,X).
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
%        * ((ALPHA^2-BETA^2)+(2*N+ALPHA+BETA)*(2*N+ALPHA+BETA-2)*X) 
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
%    Integral ( -1 <= X <= 1 ) ( 1 - X )^ALPHA * ( 1 + X )^BETA 
%      * P(N,ALPHA,BETA,X)^2 dX 
%    = 2^(ALPHA+BETA+1) * Gamma ( N + ALPHA + 1 ) * Gamma ( N + BETA + 1 ) /
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
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.  Note
%    that polynomials 0 through N will be computed.
%
%    Input, real ALPHA, BETA, the parameters.
%    -1 < ALPHA, BETA.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real V(M,1:N+1), the values of the first N+1 Jacobi
%    polynomials at the point X.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'J_POLYNOMIAL - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of ALPHA = %f\n', alpha );
    fprintf ( 1, '  But ALPHA must be greater than -1.\n' );
    error ( 'J_POLYNOMIAL - Fatal error!' );
  end
 
  if ( beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'J_POLYNOMIAL - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of BETA = %f\n', beta );
    fprintf ( 1, '  But BETA must be greater than -1.\n' );
    error ( 'J_POLYNOMIAL - Fatal error!' );
  end
  
  if ( n < 0 )
    v = [];
    return
  end

  v(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  v(1:m,2) = ( 1.0 + 0.5 * ( alpha + beta ) ) * x(1:m,1)  + 0.5 * ( alpha - beta );
 
  for i = 2 : n

    c1 = 2 * i * ( i + alpha + beta ) * ( 2 * i - 2 + alpha + beta );

    c2 = ( 2 * i - 1 + alpha + beta ) * ( 2 * i + alpha + beta ) ...
      * ( 2 * i - 2 + alpha + beta );

    c3 = ( 2 * i - 1 + alpha + beta ) * ( alpha + beta ) * ( alpha - beta );

    c4 = - 2 * ( i - 1 + alpha ) * ( i - 1 + beta )  * ( 2 * i + alpha + beta );

    v(1:m,i+1) = ( ( c3 + c2 * x(1:m) ) .* v(1:m,i) + c4 * v(1:m,i-1) ) / c1;

  end

  return
end
