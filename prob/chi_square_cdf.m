function cdf = chi_square_cdf ( x, a )

%*****************************************************************************80
%
%% CHI_SQUARE_CDF evaluates the Chi squared CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the value of the random deviate.
%
%    Input, real A, the parameter of the distribution, usually
%    the number of degrees of freedom.
%
%    Output, real CDF, the value of the CDF.
%
  x2 = 0.5 * x;

  a2 = 0.0;
  b2 = 1.0;
  c2 = 0.5 * a;

  cdf = gamma_cdf ( x2, a2, b2, c2 );

  cdf = 1.0 - cdf;

  return
end
