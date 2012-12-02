function [ n_data, x, fx ] = arccosh_values ( n_data )

%*****************************************************************************80
%
%% ARCCOSH_VALUES returns some values of the hyperbolic arc cosine function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      ArcCosh[x]
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
    0.0000000000000000000, ...
    0.14130376948564857735, ...
    0.44356825438511518913, ...
    0.62236250371477866781, ...
    0.75643291085695958624, ...
    0.86701472649056510395, ...
    0.96242365011920689500, ...
    1.3169578969248167086, ...
    1.7627471740390860505, ...
    1.8115262724608531070, ...
    2.0634370688955605467, ...
    2.2924316695611776878, ...
    2.9932228461263808979, ...
    5.2982923656104845907, ...
    7.6009022095419886114 ];

  x_vec = [ ...
       1.0, ...
       1.01, ...
       1.1, ...
       1.2, ...
       1.3, ...
       1.4, ...
       1.5, ...
       2.0, ...
       3.0, ...
       3.1415926535897932385, ...
       4.0, ...
       5.0, ...
      10.0, ...
     100.0, ...
    1000.0 ];

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
