function [ n_data_new, x, y, fxy ] = beta_values ( n_data )

%*****************************************************************************80
%
%% BETA_VALUES returns some values of the Beta function.
%
%  Formula:
%
%    BETA(X,Y) = ( GAMMA(X) * GAMMA(Y) ) / GAMMA(X+Y)
%
%  Restrictions:
%
%    Both X and Y must be greater than 0.
%
%  Properties:
%
%    BETA(X,Y) = BETA(Y,X).
%    BETA(X,Y) = Integral ( 0 <= T <= 1 ) T**(X-1) (1-T)**(Y-1) dT.
%    BETA(X,Y) = GAMMA(X) * GAMMA(Y) / GAMMA(X+Y)
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
%    Output, real X, Y, the arguments of the function.
%
%    Output, real FXY, the value of the function.
%
  n_max = 17;
  b_vec = [ ...
    5.000000E+00, 2.500000E+00, 1.666667E+00, 1.250000E+00, ...
    5.000000E+00, 2.500000E+00, 1.000000E+00, 1.666667E-01, ...
    0.333333E-01, 7.142857E-03, 1.587302E-03, 0.238095E-01, ...
    5.952381E-03, 1.984127E-03, 7.936508E-04, 3.607504E-04, ...
    8.325008E-05 ];
  x_vec = [ ...
    0.2E+00, 0.4E+00, 0.6E+00, 0.8E+00, ...
    1.0E+00, 1.0E+00, 1.0E+00, 2.0E+00, ...
    3.0E+00, 4.0E+00, 5.0E+00, 6.0E+00, ...
    6.0E+00, 6.0E+00, 6.0E+00, 6.0E+00, ...
    7.0E+00 ];
  y_vec = [ ...
    1.0E+00, 1.0E+00, 1.0E+00, 1.0E+00, ...
    0.2E+00, 0.4E+00, 1.0E+00, 2.0E+00, ...
    3.0E+00, 4.0E+00, 5.0E+00, 2.0E+00, ...
    3.0E+00, 4.0E+00, 5.0E+00, 6.0E+00, ...
    7.0E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    x = 0.0E+00;
    y = 0.0E+00;
    fxy = 0.0E+00;
  else
    x = x_vec(n_data_new);
    y = y_vec(n_data_new);
    fxy = b_vec(n_data_new);
  end

  return
end
