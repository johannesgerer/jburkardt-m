function [ n_data, n, x, fx ] = t_polynomial_values ( n_data )

%*****************************************************************************80
%
%% T_POLYNOMIAL_VALUES returns values of the Chebyshev polynomial T(n,x).
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
%    set the input value of N_DATA to the output value of N_DATA
%    from the previous call.
%
%    Output, integer N_DATA, the index of the test data.
%
%    Output, integer N, the order of the function.
%
%    Output, real X, the point where the function is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 13;
  fx_vec = [ ...
     1.0000000000E+00,  0.8000000000E+00,  0.2800000000E+00, ...
    -0.3520000000E+00, -0.8432000000E+00, -0.9971200000E+00, ...
    -0.7521920000E+00, -0.2063872000E+00,  0.4219724800E+00, ...
     0.8815431680E+00,  0.9884965888E+00,  0.7000513741E+00, ...
     0.1315856097E+00 ];
  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12 ];
  x_vec = [ ...
    0.8E+00,  0.8E+00,  0.8E+00, ...
    0.8E+00,  0.8E+00,  0.8E+00, ...
    0.8E+00,  0.8E+00,  0.8E+00, ...
    0.8E+00,  0.8E+00,  0.8E+00, ...
    0.8E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    n = n_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
