function [ n_data, x, fx ] = ber1_values ( n_data )

%*****************************************************************************80
%
%% BER1_VALUES returns some values of the Kelvin BER function of order NU = 1.
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
%    28 June 2006
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
     0.0000000000000000, ...
    -0.1822431237551121, ...
    -0.3958682610197114, ...
    -0.6648654179597691, ...
    -0.9970776519264285, ...
    -1.373096897645111, ...
   -1.732644221128481, ...
   -1.959644131289749, ...
   -1.869248459031899, ...
   -1.202821631480086, ...
    0.3597766667766728 ];
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
