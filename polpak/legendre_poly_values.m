function [ n_data, n, x, fx ] = legendre_poly_values ( n_data )

%*****************************************************************************80
%
%% LEGENDRE_POLY_VALUES returns values of the Legendre polynomials.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      LegendreP [ n, x ]
%
%  Differential equation:
%
%    (1-X*X) * P(N,X)'' - 2 * X * P(N,X)' + N * (N+1) = 0
%
%  First terms:
%
%    P( 0,X) =       1
%    P( 1,X) =       1 X
%    P( 2,X) =  (    3 X^2 -       1)/2
%    P( 3,X) =  (    5 X^3 -     3 X)/2
%    P( 4,X) =  (   35 X^4 -    30 X^2 +     3)/8
%    P( 5,X) =  (   63 X^5 -    70 X^3 +    15 X)/8
%    P( 6,X) =  (  231 X^6 -   315 X^4 +   105 X^2 -     5)/16
%    P( 7,X) =  (  429 X^7 -   693 X^5 +   315 X^3 -    35 X)/16
%    P( 8,X) =  ( 6435 X^8 - 12012 X^6 +  6930 X^4 -  1260 X^2 +   35)/128
%    P( 9,X) =  (12155 X^9 - 25740 X^7 + 18018 X^5 -  4620 X^3 +  315 X)/128
%    P(10,X) =  (46189 X^10-109395 X^8 + 90090 X^6 - 30030 X^4 + 3465 X^2-63 ) /256
%
%  Recursion:
%
%    P(0,X) = 1
%    P(1,X) = X
%    P(N,X) = ( (2*N-1)*X*P(N-1,X)-(N-1)*P(N-2,X) ) / N
%
%    P'(0,X) = 0
%    P'(1,X) = 1
%    P'(N,X) = ( (2*N-1)*(P(N-1,X)+X*P'(N-1,X)-(N-1)*P'(N-2,X) ) / N
%
%  Formula:
%
%    P(N,X) = (1/2**N) * sum ( 0 <= M <= N/2 ) C(N,M) C(2N-2M,N) X^(N-2*M)
%
%  Orthogonality:
%
%    Integral ( -1 <= X <= 1 ) P(I,X) * P(J,X) dX
%      = 0 if I =/= J
%      = 2 / ( 2*I+1 ) if I = J.
%
%  Approximation:
%
%    A function F(X) defined on [-1,1] may be approximated by the series
%
%      C0*P(0,X) + C1*P(1,X) + ... + CN*P(N,X)
%
%    where
%
%      C(I) = (2*I+1)/(2) * Integral ( -1 <= X <= 1 ) F(X) P(I,X) dx.
%
%  Special values:
%
%    P(N,1) = 1.
%    P(N,-1) = (-1)**N.
%    | P(N,X) | <= 1 in [-1,1].
%
%    P(N,0,X) = P(N,X), that is, for M=0, the associated Legendre
%    function of the first kind and order N equals the Legendre polynomial
%    of the first kind and order N.
%
%    The N zeroes of P(N,X) are the abscissas used for Gauss-Legendre
%    quadrature of the integral of a function F(X) with weight function 1
%    over the interval [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
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
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the order of the function.
%
%    Output, real X, the point where the function is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 22;

  fx_vec = [ ...
      0.1000000000000000E+01, ...
      0.2500000000000000E+00, ...
     -0.4062500000000000E+00, ...
     -0.3359375000000000E+00, ...
      0.1577148437500000E+00, ...
      0.3397216796875000E+00, ...
      0.2427673339843750E-01, ...
     -0.2799186706542969E+00, ...
     -0.1524540185928345E+00, ...
      0.1768244206905365E+00, ...
      0.2212002165615559E+00, ...
      0.0000000000000000E+00, ...
     -0.1475000000000000E+00, ...
     -0.2800000000000000E+00, ...
     -0.3825000000000000E+00, ...
     -0.4400000000000000E+00, ...
     -0.4375000000000000E+00, ...
     -0.3600000000000000E+00, ...
     -0.1925000000000000E+00, ...
      0.8000000000000000E-01, ...
      0.4725000000000000E+00, ...
      0.1000000000000000E+01 ];

  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10,  3, ...
     3,  3,  3, ...
     3,  3,  3, ...
     3,  3,  3, ...
     3 ];

  x_vec = [ ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.00E+00, ...
     0.10E+00, ...
     0.20E+00, ...
     0.30E+00, ...
     0.40E+00, ...
     0.50E+00, ...
     0.60E+00, ...
     0.70E+00, ...
     0.80E+00, ...
     0.90E+00, ...
     1.00E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    x = 0.0;
    fx = 0.0;
  else
    n = n_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
