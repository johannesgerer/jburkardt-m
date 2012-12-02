function [ n_data_new, n, x, fx ] = hermite_poly_values ( n_data )

%*****************************************************************************80
%
%% HERMITE_POLY_VALUES returns some values of the Hermite polynomial.
%
%  Differential equation:
%
%    Y'' - 2 X Y' + 2 N Y = 0
%
%  First terms:
%
%      1
%      2 X
%      4 X**2     -  2
%      8 X**3     - 12 X
%     16 X**4     - 48 X**2     + 12
%     32 X**5    - 160 X**3    + 120 X
%     64 X**6    - 480 X**4    + 720 X**2    - 120
%    128 X**7   - 1344 X**5   + 3360 X**3   - 1680 X
%    256 X**8   - 3584 X**6  + 13440 X**4  - 13440 X**2   + 1680
%    512 X**9   - 9216 X**7  + 48384 X**5  - 80640 X**3  + 30240 X
%   1024 X**10 - 23040 X**8 + 161280 X**6 - 403200 X**4 + 302400 X**2 - 30240
%
%  Recursion:
%
%    H(0,X) = 1,
%    H(1,X) = 2*X,
%    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
%
%  Norm:
%
%    Integral ( -Infinity < X < Infinity ) exp ( - X**2 ) * H(N,X)**2 dX
%    = sqrt ( PI ) * 2**N * N!
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
     1.0E+00,            10.0E+00,           98.0E+00, ...
     940.0E+00,          8812.0E+00,         80600.0E+00, ...
     717880.0E+00,       6211600.0E+00,      520656800.0E+00, ...
     421271200E+00,      3275529760.0E+00,   24329873600.0E+00, ...
     171237081280.0E+00, 41.0E+00,          -8.0E+00, ...
     3816.0E+00,         3041200.0E+00 ];
  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12,  5,  5, ...
     5,  5 ];
  x_vec = [ ...
    5.0E+00,  5.0E+00,  5.0E+00, ...
    5.0E+00,  5.0E+00,  5.0E+00, ...
    5.0E+00,  5.0E+00,  5.0E+00, ...
    5.0E+00,  5.0E+00,  5.0E+00, ...
    5.0E+00,  0.5E+00,  1.0E+00, ...
    3.0E+00, 10.0E+00 ];

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
