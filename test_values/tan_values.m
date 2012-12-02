function [ n_data, x, fx ] = tan_values ( n_data )

%*****************************************************************************80
%
%% TAN_VALUES returns some values of the tangent function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      Tan[x]
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
  n_max = 15;

  fx_vec = [ ...
     0.00000000000000000000, ...
     0.26794919243112270647, ...
     0.54630248984379051326, ...
     0.57735026918962576451, ...
     1.0000000000000000000, ...
     1.5574077246549022305, ...
     1.7320508075688772935, ...
     3.7320508075688772935, ...
     7.5957541127251504405, ...
    15.257051688265539110, ...
    -2.1850398632615189916, ...
    -0.14254654307427780530, ...
     0.0000000000000000000, ...
     1.1578212823495775831, ...
    -3.3805150062465856370 ];

  x_vec = [ ...
    0.00000000000000000000, ...
    0.26179938779914943654, ...
    0.50000000000000000000, ...
    0.52359877559829887308, ...
    0.78539816339744830962, ...
    1.0000000000000000000, ...
    1.0471975511965977462, ...
    1.3089969389957471827, ...
    1.4398966328953219010, ...
    1.5053464798451092601, ...
    2.0000000000000000000, ...
    3.0000000000000000000, ...
    3.1415926535897932385, ...
    4.0000000000000000000, ...
    5.0000000000000000000 ];

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
