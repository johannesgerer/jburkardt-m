function [ n_data, n, x, fx ] = cheby_w_poly_values ( n_data )

%*****************************************************************************80
%
%% CHEBY_W_POLY_VALUES returns values of Chebyshev polynomials W(n,x).
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      u = Sqrt[(x+1)/2],
%      ChebyshevU[2*n,u]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2012
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
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the order of the function.
%
%    Output, real X, the point where the function is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 13;

  fx_vec = [ ...
     1.000000000000000E+00, ...
     2.600000000000000E+00, ...
     3.160000000000000E+00, ...
     2.456000000000000E+00, ...
     0.769600000000000E+00, ...
    -1.224640000000000E+00, ...
    -2.729024000000000E+00, ...
    -3.141798400000000E+00, ...
    -2.297853440000000E+00, ...
    -0.534767104000000E+00, ...
     1.442226073600000E+00, ...
     2.842328821760000E+00, ...
     3.105500041216000E+00 ];

  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12 ];

  x_vec = [ ...
     0.8E+00, ... 
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    x = 0.0;
    fx = 0.0;
  else
    n = n_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
