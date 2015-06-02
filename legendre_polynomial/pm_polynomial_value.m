function cx = pm_polynomial_value ( mm, n, m, x )

%*****************************************************************************80
%
%% PM_POLYNOMIAL_VALUE evaluates the Legendre polynomials Pm(n,m,x).
%
%  Differential equation:
%
%    (1-X*X) * Y'' - 2 * X * Y + ( N (N+1) - (M*M/(1-X*X)) * Y = 0
%
%  First terms:
%
%    M = 0  ( = Legendre polynomials of first kind P(N,X) )
%
%    Pm(0,0,x) =    1
%    Pm(1,0,x) =    1 X
%    Pm(2,0,x) = (  3 X^2 -   1)/2
%    Pm(3,0,x) = (  5 X^3 -   3 X)/2
%    Pm(4,0,x) = ( 35 X^4 -  30 X^2 +   3)/8
%    Pm(5,0,x) = ( 63 X^5 -  70 X^3 +  15 X)/8
%    Pm(6,0,x) = (231 X^6 - 315 X^4 + 105 X^2 -  5)/16
%    Pm(7,0,x) = (429 X^7 - 693 X^5 + 315 X^3 - 35 X)/16
%
%    M = 1
%
%    Pm(0,1,x) =   0
%    Pm(1,1,x) =   1 * SQRT(1-X^2)
%    Pm(2,1,x) =   3 * SQRT(1-X^2) * X
%    Pm(3,1,x) = 1.5 * SQRT(1-X^2) * (5*X^2-1)
%    Pm(4,1,x) = 2.5 * SQRT(1-X^2) * (7*X^3-3*X)
%
%    M = 2
%
%    Pm(0,2,x) =   0
%    Pm(1,2,x) =   0
%    Pm(2,2,x) =   3 * (1-X^2)
%    Pm(3,2,x) =  15 * (1-X^2) * X
%    Pm(4,2,x) = 7.5 * (1-X^2) * (7*X^2-1)
%
%    M = 3
%
%    Pm(0,3,x) =   0
%    Pm(1,3,x) =   0
%    Pm(2,3,x) =   0
%    Pm(3,3,x) =  15 * (1-X^2)^1.5
%    Pm(4,3,x) = 105 * (1-X^2)^1.5 * X
%
%    M = 4
%
%    Pm(0,4,x) =   0
%    Pm(1,4,x) =   0
%    Pm(2,4,x) =   0
%    Pm(3,4,x) =   0
%    Pm(4,4,x) = 105 * (1-X^2)^2
%
%  Recursion:
%
%    if N < M:
%      Pm(N,M,x) = 0
%    if N = M:
%      Pm(N,M,x) = (2*M-1)!! * (1-X*X)^(M/2) where N!! means the product of
%      all the odd integers less than or equal to N.
%    if N = M+1:
%      Pm(N,M,x) = X*(2*M+1)*Pm(M,M,x)
%    if M+1 < N:
%      Pm(N,M,x) = ( X*(2*N-1)*Pm(N-1,M,x) - (N+M-1)*Pm(N-2,M,x) )/(N-M)
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
%    Input, real X(MM), the point at which the function is to be
%    evaluated.
%
%    Output, real CX(MM,N+1), the function values.
%

  cx = zeros ( mm, n + 1 );
%
%  J = M is the first nonzero function.
%
  if ( m <= n )
    cx(1:mm,m+1) = 1.0;

    fact = 1.0;
    for j = 1 : m
      cx(1:mm,m+1) = - cx(1:mm,m+1) * fact * sqrt ( 1.0 - x(1:mm).^2 );
      fact = fact + 2.0;
    end

  end
%
%  J = M + 1 is the second nonzero function.
%
  if ( m + 1 <= n )
    cx(1:mm,m+2) = ( 2 * m + 1 ) * x(1:mm) .* cx(1:mm,m+1);
  end
%
%  Now we use a three term recurrence.
%
  for j = m + 2 : n
    cx(1:mm,j+1) = ( ( 2 * j     - 1 ) * x(1:mm) .* cx(1:mm,j) ...
                   + (   - j - m + 1 ) *            cx(1:mm,j-1) ) ...
                   / (     j - m     );
  end

  return
end
