function value = legendre_3d_monomial_integral ( a, b, p )

%*****************************************************************************80
%
%% LEGENDRE_3D_MONOMIAL_INTEGRAL the Legendre integral of a monomial.
%
%  Discussion:
%
%    The Legendre integral to be evaluated has the form
%
%      I(f) = integral ( z1 <= z <= z2 )
%             integral ( y1 <= y <= y2 ) 
%             integral ( x1 <= x <= x2 ) x^i y^j z^k dx dy dz
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), the lower limits of integration.
%
%    Input, real B(3), the upper limits of integration.
%
%    Input, integer P(3), the exponents of X and Y.
%
%    Output, real VALUE, the value of the exact integral.
%
  value = ( b(1) ^ ( p(1) + 1 ) - a(1) ^ ( p(1) + 1 ) ) / ( p(1) + 1 ) ...
        * ( b(2) ^ ( p(2) + 1 ) - a(2) ^ ( p(2) + 1 ) ) / ( p(2) + 1 ) ...
        * ( b(3) ^ ( p(3) + 1 ) - a(3) ^ ( p(3) + 1 ) ) / ( p(3) + 1 );

  return
end

