function cdf = gamma_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% GAMMA_CDF evaluates the Gamma CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    A <= X
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real CDF, the value of the CDF.
%
  x2 = ( x - a ) / b;
  p2 = c;

  cdf = gamma_inc ( p2, x2 );

  return
end
