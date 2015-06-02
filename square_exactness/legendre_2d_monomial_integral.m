function value = legendre_2d_monomial_integral ( a, b, p )

%*****************************************************************************80
%
%% LEGENDRE_2D_MONOMIAL_INTEGRAL the Legendre integral of a monomial.
%
%  Discussion:
%
%    The Legendre integral to be evaluated has the form
%
%      I(f) = integral ( y1 <= y <= y2 ) 
%             integral ( x1 <= x <= x2 ) x^i y^j dx dy
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), the lower limits of integration.
%
%    Input, real B(2), the upper limits of integration.
%
%    Input, integer P(2), the exponents of X and Y.
%
%    Output, real VALUE, the value of the exact integral.
%
  value = ( b(1) ^ ( p(1) + 1 ) - a(1) ^ ( p(1) + 1 ) ) / ( p(1) + 1 ) ...
        * ( b(2) ^ ( p(2) + 1 ) - a(2) ^ ( p(2) + 1 ) ) / ( p(2) + 1 );

  return
end
