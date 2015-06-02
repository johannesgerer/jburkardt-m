function [ o, c, e ] = polynomial_scale ( s, m, o, c, e )

%*****************************************************************************80
%
%% POLYNOMIAL_SCALE scales a polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S, the scale factor.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer O, the "order" of the polynomial.
%
%    Input, real C(O), the coefficients of the polynomial.
%
%    Input, integer E(O), the indices of the exponents of the polynomial.
%
%    Output, integer O, the "order" of the scaled polynomial.
%
%    Output, real C(O), the coefficients of the scaled polynomial.
%
%    Output, integer E(O), the indices of the exponents of the 
%    scaled polynomial.
%
  c(1:o) = s * c(1:o);

  return
end

