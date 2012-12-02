function [ n_data_new, n, m, x, fx ] = legendre_associated_values ( n_data )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED_VALUES returns values of associated Legendre functions.
%
%  Discussion:
%
%    The function considered is the associated Legendre function P^M_N(X).
%
%    In Mathematica, the function
%
%      LegendreP [ n, m, x ]
%
%    returns the value of the associated Legendre function P^M_N(X).
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
%    P20 = (  3 X**2 -   1)/2
%    P30 = (  5 X**3 -   3 X)/2
%    P40 = ( 35 X**4 -  30 X**2 +   3)/8
%    P50 = ( 63 X**5 -  70 X**3 +  15 X)/8
%    P60 = (231 X**6 - 315 X**4 + 105 X**2 -  5)/16
%    P70 = (429 X**7 - 693 X**5 + 315 X**3 - 35 X)/16
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
%      P(N,M) = (2*M-1)%% * (1-X*X)**(M/2) where N!! means the product of
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
%    30 May 2004
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
%    Input, integer N_DATA, indicates the index of the previous test data
%    returned, or is 0 if this is the first call.  For repeated calls,
%    set the input value of N_DATA to the output value of N_DATA_NEW
%    from the previous call.
%
%    Output, integer N_DATA_NEW, the index of the test data.
%
%    Output, integer N, integer M, real X, the arguments of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 19;
  n_vec = [ ...
     1,  1,  1,  1, ...
     1,  2,  2,  2, ...
     3,  3,  3,  3, ...
     4,  5,  6,  7, ...
     8,  9, 10 ];
  m_vec = [ ...
     0,  0,  0,  0, ...
     1,  0,  1,  2, ...
     0,  1,  2,  3, ...
     2,  2,  3,  3, ...
     4,  4,  5 ];
  fx_vec = [ ...
     0.000000E+00,  0.500000E+00,  0.707107E+00,  1.000000E+00, ...
    -0.866025E+00, -0.125000E+00, -1.29904E+00,   2.25000E+00, ...
    -0.437500E+00, -0.324759E+00,  5.62500E+00,  -9.74278E+00, ...
     4.21875E+00,  -4.92187E+00,   12.7874E+00,   116.685E+00, ...
    -1050.67E+00,  -2078.49E+00,   30086.2E+00 ];
  x_vec = [ ...
    0.0E+00,       0.5E+00,       0.7071067E+00, 1.0E+00, ...
    0.5E+00,       0.5E+00,       0.5E+00,       0.5E+00, ...
    0.5E+00,       0.5E+00,       0.5E+00,       0.5E+00, ...
    0.5E+00,       0.5E+00,       0.5E+00,       0.5E+00, ...
    0.5E+00,       0.5E+00,       0.5E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    m = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    n = n_vec(n_data_new);
    m = m_vec(n_data_new);
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
