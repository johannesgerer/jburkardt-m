function [ n_data, n, m, x, fx ] = legendre_associated_values ( n_data )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED_VALUES returns values of associated Legendre functions.
%
%  Discussion:
%
%    The function considered is the associated Legendre polynomial P^M_N(X).
%
%    In Mathematica, the function can be evaluated by:
%
%      LegendreP [ n, m, x ]
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
%    P33 =  15 * (1-X*X)**1.5
%    P43 = 105 * (1-X*X)**1.5 * X
%
%    M = 4
%
%    P04 =   0
%    P14 =   0
%    P24 =   0
%    P34 =   0
%    P44 = 105 * (1-X*X)**2
%
%  Recursion:
%
%    if N < M:
%      P(N,M) = 0
%    if N = M:
%      P(N,M) = (2*M-1)!! * (1-X*X)**(M/2) where N!! means the product of
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
%    polynomial of the first kind equals the Legendre polynomial of the
%    first kind.
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
%    Output, integer N, integer M, real X, 
%    the arguments of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 20;

  fx_vec = [ ...
      0.0000000000000000E+00, ...
     -0.5000000000000000E+00, ...
      0.0000000000000000E+00, ...
      0.3750000000000000E+00, ...
      0.0000000000000000E+00, ...
     -0.8660254037844386E+00, ...
     -0.1299038105676658E+01, ...
     -0.3247595264191645E+00, ...
      0.1353164693413185E+01, ...
     -0.2800000000000000E+00, ...
      0.1175755076535925E+01, ...
      0.2880000000000000E+01, ...
     -0.1410906091843111E+02, ...
     -0.3955078125000000E+01, ...
     -0.9997558593750000E+01, ...
      0.8265311444100484E+02, ...
      0.2024442836815152E+02, ...
     -0.4237997531890869E+03, ...
      0.1638320624828339E+04, ...
     -0.2025687389227225E+05  ];

  m_vec = [ ...
    0, 0, 0, 0, ...
    0, 1, 1, 1, ...
    1, 0, 1, 2, ...
    3, 2, 2, 3, ...
    3, 4, 4, 5 ];

  n_vec = [ ...
    1,  2,  3,  4, ...
    5,  1,  2,  3, ...
    4,  3,  3,  3, ...
    3,  4,  5,  6, ...
    7,  8,  9, 10 ];

  x_vec = [ ...
     0.00E+00, ...
     0.00E+00, ...
     0.00E+00, ...
     0.00E+00, ...
     0.00E+00, ...
     0.50E+00, ...
     0.50E+00, ...
     0.50E+00, ...
     0.50E+00, ...
     0.20E+00, ...
     0.20E+00, ...
     0.20E+00, ...
     0.20E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00, ...
     0.25E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    m = 0;
    x = 0.0;
    fx = 0.0;
  else
    n = n_vec(n_data);
    m = m_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
