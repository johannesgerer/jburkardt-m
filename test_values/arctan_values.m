function [ n_data, x, fx ] = arctan_values ( n_data )

%*****************************************************************************80
%
%% ARCTAN_VALUES returns some values of the arc tangent function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      ArcTan[x]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Cambridge University Press, 1999,
%    ISBN: 0-521-64314-7,
%    LC: QA76.95.W65.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 11;

  fx_vec = [ ...
    0.00000000000000000000, ...
    0.24497866312686415417, ...
    0.32175055439664219340, ...
    0.46364760900080611621, ...
    0.78539816339744830962, ...
    1.1071487177940905030, ...
    1.2490457723982544258, ...
    1.3258176636680324651, ...
    1.3734007669450158609, ...
    1.4711276743037345919, ...
    1.5208379310729538578 ];

  x_vec = [ ...
    0.00000000000000000000, ...
    0.25000000000000000000, ...
    0.33333333333333333333, ...
    0.50000000000000000000, ...
    1.0000000000000000000, ...
    2.0000000000000000000, ...
    3.0000000000000000000, ...
    4.0000000000000000000, ...
    5.0000000000000000000, ...
    10.000000000000000000, ...
    20.000000000000000000 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    x = 0.0;
    fx = 0.0;
  else
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
