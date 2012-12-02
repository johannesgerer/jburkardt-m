function [ n_data_new, x, fx ] = erf_values ( n_data )

%*****************************************************************************80
%
%% ERF_VALUES returns some values of the ERF or "error" function.
%
%  Definition:
%
%    ERF(X) = ( 2 / sqrt ( PI ) * integral ( 0 <= T <= X ) exp ( - T^2 ) dT
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
  n_max = 21;
  fx_vec = [ ...
    0.0000000000E+00, 0.1124629160E+00, 0.2227025892E+00, 0.3286267595E+00, ...
    0.4283923550E+00, 0.5204998778E+00, 0.6038560908E+00, 0.6778011938E+00, ...
    0.7421009647E+00, 0.7969082124E+00, 0.8427007929E+00, 0.8802050696E+00, ...
    0.9103139782E+00, 0.9340079449E+00, 0.9522851198E+00, 0.9661051465E+00, ...
    0.9763483833E+00, 0.9837904586E+00, 0.9890905016E+00, 0.9927904292E+00, ...
    0.9953222650E+00 ];
  x_vec = [ ...
    0.0E+00, 0.1E+00, 0.2E+00, 0.3E+00, ...
    0.4E+00, 0.5E+00, 0.6E+00, 0.7E+00, ...
    0.8E+00, 0.9E+00, 1.0E+00, 1.1E+00, ...
    1.2E+00, 1.3E+00, 1.4E+00, 1.5E+00, ...
    1.6E+00, 1.7E+00, 1.8E+00, 1.9E+00, ...
    2.0E+00 ];

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
