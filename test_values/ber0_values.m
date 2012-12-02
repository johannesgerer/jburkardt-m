function [ n_data, x, fx ] = ber0_values ( n_data )

%*****************************************************************************80
%
%% BER0_VALUES returns some values of the Kelvin BER function of order NU = 0.
%
%  Discussion:
%
%    The function is defined by:
%
%      BER(NU,X) + i * BEI(NU,X) = exp(NU*Pi*I) * J(NU,X*exp(-PI*I/4))
%
%    where J(NU,X) is the J Bessel function.
%
%    In Mathematica, BER(NU,X) can be defined by:
%
%      Re [ Exp [ NU * Pi * I ] * BesselJ [ NU, X * Exp[ -Pi * I / 4 ] ] ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2006
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
%    LC: QA47.A34,
%    ISBN: 0-486-61272-4.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Cambridge University Press, 1999,
%    LC: QA76.95.W65,
%    ISBN: 0-521-64314-7.
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
    1.0000000000000000, ...
    0.9990234639908383, ...
    0.9843817812130869, ...
    0.9210721835462558, ...
    0.7517341827138082, ...
    0.3999684171295313, ...
   -0.2213802495986939, ...
   -1.193598179589928, ...
   -2.563416557258580, ...
   -4.299086551599756, ...
   -6.230082478666358 ];
  x_vec = [;
    0.0, ...
    0.5, ...
    1.0, ...
    1.5, ...
    2.0, ...
    2.5, ...
    3.0, ...
    3.5, ...
    4.0, ...
    4.5, ...
    5.0 ];

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
