function [ n_data_new, x, fx ] = psi_values ( n_data )

%*****************************************************************************80
%
%% PSI_VALUES returns some values of the Psi or Digamma function.
%
%  Discussion:
%
%    PSI(X) = d LN ( GAMMA ( X ) ) / d X = GAMMA'(X) / GAMMA(X)
%
%    PSI(1) = - Euler's constant.
%
%    PSI(X+1) = PSI(X) + 1 / X.
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
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 11;
  fx_vec = [ ...
    -0.5772156649E+00, -0.4237549404E+00, -0.2890398966E+00, ...
    -0.1691908889E+00, -0.0613845446E+00, -0.0364899740E+00, ...
     0.1260474528E+00,  0.2085478749E+00,  0.2849914333E+00, ...
     0.3561841612E+00,  0.4227843351E+00 ];
  x_vec = [ ...
    1.0E+00,  1.1E+00,  1.2E+00,  ...
    1.3E+00,  1.4E+00,  1.5E+00,  ...
    1.6E+00,  1.7E+00,  1.8E+00,  ...
    1.9E+00,  2.0E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
