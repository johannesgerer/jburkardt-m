function [ n_data_new, n, x, fx ] = laguerre_polynomial_values ( n_data )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_VALUES returns some values of the Laguerre polynomial.
%
%  Differential equation:
%
%    X * Y'' + (1-X) * Y' + N * Y = 0
%
%  First terms:
%
%      1
%     -X    +  1
%   (  X^2 -  4 X     +  2 ) / 2
%   ( -X^3 +  9 X^2 -  18 X    +    6 ) / 6
%   (  X^4 - 16 X^3 +  72 X^2 -   96 X +      24 ) / 24
%   ( -X^5 + 25 X^4 - 200 X^3 +  600 X^2 -  600 x    +  120 ) / 120
%   (  X^6 - 36 X^5 + 450 X^4 - 2400 X^3 + 5400 X^2 - 4320 X + 720 ) / 720
%   ( -X^7 + 49 X^6 - 882 X^5 + 7350 X^4 - 29400 X^3
%      + 52920 X^2 - 35280 X + 5040 ) / 5040
%
%  Recursion:
%
%    L(0)(X) = 1,
%    L(1)(X) = 1-X,
%    N * L(N)(X) = (2*N-1-X) * L(N-1)(X) - (N-1) * L(N-2)(X)
%
%  Orthogonality:
%
%    Integral ( 0 <= X < Infinity ) exp ( - X ) * L(N)(X) * L(M)(X) dX
%    = 0 if N /= M
%    = 1 if N == M
%
%  Special values:
%
%    L(N)(0) = 1.
%
%  Relations:
%
%    L(N)(X) = (-1)^N / N! * exp ( x ) * (d/dx)^n ( exp ( - x ) * X^n )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2004
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
%    Output, integer N, the order of the polynomial.
%
%    Output, real X, the point where the polynomial is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 17;
  fx_vec = [ ...
     1.0000000000E+00,  0.0000000000E+00, -0.5000000000E+00, ...
    -0.6666666667E+00, -0.6250000000E+00, -0.4666666667E+00, ...
    -0.2569444444E+00, -0.0404761905E+00,  0.1539930556E+00, ...
     0.3097442681E+00,  0.4189459325E+00,  0.4801341791E+00, ...
     0.4962122235E+00, -0.4455729167E+00,  0.8500000000E+00, ...
    -3.1666666667E+00, 34.3333333333E+00 ];
  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12,  5,  5, ...
     5,  5 ];
  x_vec = [ ...
    1.0E+00,  1.0E+00,  1.0E+00, ...
    1.0E+00,  1.0E+00,  1.0E+00, ...
    1.0E+00,  1.0E+00,  1.0E+00, ...
    1.0E+00,  1.0E+00,  1.0E+00, ...
    1.0E+00,  0.5E+00,  3.0E+00, ...
    5.0E+00, 10.0E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    n = n_vec(n_data_new);
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
