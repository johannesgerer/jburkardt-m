function [ n_data, x, fx ] = psi_values ( n_data )

%*****************************************************************************80
%
%% PSI_VALUES returns some values of the Psi or Digamma function.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      PolyGamma[x]
%
%    or
%
%      PolyGamma[0,x]
%
%    PSI(X) = d ln ( Gamma ( X ) ) / d X = Gamma'(X) / Gamma(X)
%
%    PSI(1) = -Euler's constant.
%
%    PSI(X+1) = PSI(X) + 1 / X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
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
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 11;

  fx_vec = [ ...
     -0.5772156649015329E+00, ...
     -0.4237549404110768E+00, ...
     -0.2890398965921883E+00, ...
     -0.1691908888667997E+00, ...
     -0.6138454458511615E-01, ...
      0.3648997397857652E-01, ...
      0.1260474527734763E+00, ...
      0.2085478748734940E+00, ...
      0.2849914332938615E+00, ...
      0.3561841611640597E+00, ...
      0.4227843350984671E+00 ];

  x_vec = [ ...
     1.0E+00, ...
     1.1E+00, ...
     1.2E+00, ...
     1.3E+00, ...
     1.4E+00, ...
     1.5E+00, ...
     1.6E+00, ...
     1.7E+00, ...
     1.8E+00, ...
     1.9E+00, ...
     2.0E+00 ];

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
