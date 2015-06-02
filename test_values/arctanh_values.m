function [ n_data, x, fx ] = arctanh_values ( n_data )

%*****************************************************************************80
%
%% ARCTANH_VALUES returns some values of the hyperbolic arc tangent function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      ArcTanh[x]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2007
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
    -0.54930614433405484570, ...
     0.00000000000000000000, ...
     0.0010000003333335333335, ...
     0.10033534773107558064, ...
     0.20273255405408219099, ...
     0.30951960420311171547, ...
     0.42364893019360180686, ...
     0.54930614433405484570, ...
     0.69314718055994530942, ...
     0.86730052769405319443, ...
     1.0986122886681096914, ...
     1.4722194895832202300, ...
     2.6466524123622461977, ...
     3.8002011672502000318, ...
     7.2543286192620472067 ];

  x_vec = [ ...
    -0.5, ...
     0.0, ...
     0.001, ...
     0.1, ...
     0.2, ...
     0.3, ...
     0.4, ...
     0.5, ...
     0.6, ...
     0.7, ...
     0.8, ...
     0.9, ...
     0.99, ...
     0.999, ...
     0.999999 ];

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
