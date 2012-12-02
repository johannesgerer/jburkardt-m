function [ n_data, x, fx ] = sin_values ( n_data )

%*****************************************************************************80
%
%% SIN_VALUES returns some values of the sine function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      Sin[x]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2007
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
  n_max = 13;

  fx_vec = [ ...
     0.00000000000000000000, ...
     0.25881904510252076235, ...
     0.47942553860420300027, ...
     0.50000000000000000000, ...
     0.70710678118654752440, ...
     0.84147098480789650665, ...
     0.86602540378443864676, ...
     1.00000000000000000000, ...
     0.90929742682568169540, ...
     0.14112000805986722210, ...
     0.00000000000000000000, ...
    -0.75680249530792825137, ...
    -0.95892427466313846889 ];

  x_vec = [ ...
    0.0000000000000000000, ...
    0.26179938779914943654, ...
    0.50000000000000000000, ...
    0.52359877559829887308, ...
    0.78539816339744830962, ...
    1.0000000000000000000, ...
    1.0471975511965977462, ...
    1.5707963267948966192, ...
    2.0000000000000000000, ...
    3.0000000000000000000, ...
    3.1415926535897932385, ...
    4.0000000000000000000, ...
    5.0000000000000000000  ];

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
