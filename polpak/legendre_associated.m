function cx = legendre_associated ( n, m, x )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED evaluates the associated Legendre functions.
%
%  Differential equation:
%
%    (1-X*X) * Y'' - 2 * X * Y + ( N (N+1) - (M*M/(1-X*X)) * Y = 0
%
%  First terms:
%
%    M = 0  ( = Legendre polynomials of first kind P(N)(X) )
%
%    P00 =    1
%    P10 =    1 X
%    P20 = (  3 X^2 -   1)/2
%    P30 = (  5 X^3 -   3 X)/2
%    P40 = ( 35 X^4 -  30 X^2 +   3)/8
%    P50 = ( 63 X^5 -  70 X^3 +  15 X)/8
%    P60 = (231 X^6 - 315 X^4 + 105 X^2 -  5)/16
%    P70 = (429 X^7 - 693 X^5 + 315 X^3 - 35 X)/16
%
%    M = 1
%
%    P01 =   0
%    P11 =   1 * SQRT(1-X*X)
%    P21 =   3 * SQRT(1-X*X) * X
%    P31 = 1.5 * SQRT(1-X*X) * (5*X*X-1)
%    P41 = 2.5 * SQRT(1-X*X) * (7*X*X*X-3*X)
%
%    M = 2
%
%    P02 =   0
%    P12 =   0
%    P22 =   3 * (1-X*X)
%    P32 =  15 * (1-X*X) * X
%    P42 = 7.5 * (1-X*X) * (7*X*X-1)
%
%    M = 3
%
%    P03 =   0
%    P13 =   0
%    P23 =   0
%    P33 =  15 * (1-X*X)^1.5
%    P43 = 105 * (1-X*X)^1.5 * X
%
%    M = 4
%
%    P04 =   0
%    P14 =   0
%    P24 =   0
%    P34 =   0
%    P44 = 105 * (1-X*X)^2
%
%  Recursion:
%
%    if N < M:
%      P(N,M) = 0
%    if N = M:
%      P(N,M) = (2*M-1)!! * (1-X*X)^(M/2) where N!! means the product of
%      all the odd integers less than or equal to N.
%    if N = M+1:
%      P(N,M) = X*(2*M+1)*P(M,M)
%    if M+1 < N:
%      P(N,M) = ( X*(2*N-1)*P(N-1,M) - (N+M-1)*P(N-2,M) )/(N-M)
%
%  Restrictions:
%
%    -1 <= X <= 1
%     0 <= M <= N
%
%  Special values:
%
%    P(N,0)(X) = P(N)(X), that is, for M=0, the associated Legendre
%    function of the first kind equals the Legendre polynomial of the
%    first kind.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2004
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
    fprintf ( 1, 'LEGENDRE_ASSOCIATED - Fatal error!\n' );
    fprintf ( 1, '  Input value of M is %d\n', m );
    fprintf ( 1, '  but M must be nonnegative.\n' );
    error ( 'LEGENDRE_ASSOCIATED - Fatal error!' );
  end
 
  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED - Fatal error!\n' );
    fprintf ( 1, '  Input value of M = %d\n', m );
    fprintf ( 1, '  Input value of N = %d\n', n );
    fprintf ( 1, '  but M must be less than or equal to N.\n' );
    error ( 'LEGENDRE_ASSOCIATED - Fatal error!' );
  end
 
  if ( x < -1.0E+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED - Fatal error!\n' );
    fprintf ( 1, '  Input value of X = %f\n', x );
    fprintf ( 1, '  but X must be no less than -1.\n' );
    error ( 'LEGENDRE_ASSOCIATED - Fatal error!' );
  end

  if ( 1.0E+00 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_ASSOCIATED - Fatal error!\n' );
    fprintf ( 1, '  Input value of X = %f\n', x );
    fprintf ( 1, '  but X must be no more than 1.\n' );
    error ( 'LEGENDRE_ASSOCIATED - Fatal error!' );
  end
  
  cx(1:m) = 0.0;

  cx(m+1) = 1.0;
  somx2 = sqrt ( 1.0 - x * x );
 
  fact = 1.0;
  for i = 1 : m
    cx(m+1) = -cx(m+1) * fact * somx2;
    fact = fact + 2.0;
  end
 
  if ( m == n )
    return
  end

  cx(m+2) = x * ( 2 * m + 1 ) * cx(m+1);

  for i = m+2 : n
    cx(i+1) = ( ( 2 * i     - 1 ) * x * cx(i) ...
              + (   - i - m + 1 ) *     cx(i-1) ) ...
              / (     i - m     );
  end

  return
end

