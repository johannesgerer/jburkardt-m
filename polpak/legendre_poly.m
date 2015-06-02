function [ cx, cpx ] = legendre_poly ( n, x )

%*****************************************************************************80
%
%% LEGENDRE_POLY evaluates the Legendre polynomials P(N)(X) at X.
%
%  Discussion:
%
%    P(N)(1) = 1.
%    P(N)(-1) = (-1)**N.
%    abs ( P(N)(X) ) <= 1 in [-1,1].
%
%    P(N,0)(X) = P(N)(X), that is, for M=0, the associated Legendre
%    function of the first kind and order N equals the Legendre polynomial
%    of the first kind and order N.
%
%    The N zeroes of P(N)(X) are the abscissas used for Gauss-Legendre
%    quadrature of the integral of a function F(X) with weight function 1
%    over the interval [-1,1].
%
%    The Legendre polynomials are orthogonal under the inner product defined
%    as integration from -1 to 1:
%
%      Integral ( -1 <= X <= 1 ) P(I)(X) * P(J)(X) dX 
%        = 0 if I =/= J
%        = 2 / ( 2*I+1 ) if I = J.
%
%    Except for P(0)(X), the integral of P(I)(X) from -1 to 1 is 0.
%
%    A function F(X) defined on [-1,1] may be approximated by the series
%      C0*P(0)(X) + C1*P(1)(X) + ... + CN*P(N)(X)
%    where
%      C(I) = (2*I+1)/(2) * Integral ( -1 <= X <= 1 ) F(X) P(I)(X) dx.
%
%  Differential equation:
%
%    (1-X*X) * P(N)(X)'' - 2 * X * P(N)(X)' + N * (N+1) = 0
%
%  First terms:
%
%    P( 0)(X) =      1
%    P( 1)(X) =      1 X
%    P( 2)(X) = (    3 X^2 -       1)/2
%    P( 3)(X) = (    5 X^3 -     3 X)/2
%    P( 4)(X) = (   35 X^4 -    30 X^2 +     3)/8
%    P( 5)(X) = (   63 X^5 -    70 X^3 +    15 X)/8
%    P( 6)(X) = (  231 X^6 -   315 X^4 +   105 X^2 -     5)/16
%    P( 7)(X) = (  429 X^7 -   693 X^5 +   315 X^3 -    35 X)/16
%    P( 8)(X) = ( 6435 X^8 - 12012 X^6 +  6930 X^4 -  1260 X^2 +   35)/128
%    P( 9)(X) = (12155 X^9 - 25740 X^7 + 18018 X^5 -  4620 X^3 +  315 X)/128
%    P(10)(X) = (46189 X^10-109395 X^8 + 90090 X^6 - 30030 X^4 + 3465 X^2-63 )/256
%
%  Recursion:
%
%    P(0)(X) = 1
%    P(1)(X) = X
%    P(N)(X) = ( (2*N-1)*X*P(N-1)(X)-(N-1)*P(N-2)(X) ) / N
%
%    P'(0)(X) = 0
%    P'(1)(X) = 1
%    P'(N)(X) = ( (2*N-1)*(P(N-1)(X)+X*P'(N-1)(X)-(N-1)*P'(N-2)(X) ) / N
%
%  Formula:
%
%    P(N)(X) = (1/2**N) * sum ( 0 <= M <= N/2 ) C(N,M) C(2N-2M,N) X^(N-2*M)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2004
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
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Input, real X, the point at which the polynomials are to be evaluated.
%
%    Output, real CX(1:N+1), the values of the Legendre polynomials 
%    of order 0 through N at the point X.
%
%    Output, real CPX(1:N+1), the values of the derivatives of the
%    Legendre polynomials of order 0 through N at the point X.
%
  if ( n < 0 )
    cx = [];
    cpx = [];
    return
  end

  cx(1) = 1.0;
  cpx(1) = 0.0;

  if ( n < 1 )
    return
  end

  cx(2) = x;
  cpx(2) = 1.0;
 
  for i = 2 : n
 
    cx(i+1) = ( ( 2 * i - 1 ) * x * cx(i)   ...
              - (     i - 1 ) *     cx(i-1) ) ...
              / (     i     );
 
    cpx(i+1) = ( ( 2 * i - 1 ) * ( cx(i) + x * cpx(i) ) ...
               - (     i - 1 ) *   cpx(i-1)               ) ...
               / (     i     );
 
  end
 
  return
end
