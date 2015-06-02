function q = triangle_monomial_integral ( i, j, t )

%*****************************************************************************80
%
%% TRIANGLE_MONOMIAL_INTEGRAL integrates a monomial over an arbitrary triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_monomial_integral.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the exponents of X and Y in the monomial.
%    0 <= I, J.
%
%    Input, real T(2,3), the vertices of the triangle.
%
%    Output, real Q, the integral of X^I * Y^J over triangle T.
%

%
%  Get map coefficients from reference RS triangle to general XY triangle.
%    R = a+b*X+c*Y
%    S = d+e*X+f*Y
%
  [ a, b, c, d, e, f ] = rs_to_xy_map ( t );
%
%  Compute
%    P1(R,S) = (a+b*R+c*S)^i.
%    P2(R,S) = (d+e*R+f*S)^j.
%
  d1 = 1;
  p1 = [ a, b, c ];
  [ dp1, pp1 ] = poly_power_linear ( d1, p1, i );

  d2 = 1;
  p2 = [ d, e, f ];
  [ dp2, pp2 ] = poly_power_linear ( d2, p2, j );
%
%  Compute the product 
%    P3(R,S) = (a+b*R+c*S)^i * (d+e*R+f*S)^j.
%
  [ d3, p3 ] = poly_product ( dp1, pp1, dp2, pp2 );
%
%  Compute the integral of P3(R,S) over the reference triangle.
%
  q = triangle01_poly_integral ( d3, p3 );
%
%  Multiply by the area of the physical triangle T(X,Y) divided by
%  the area of the reference triangle.
%
  q = q * triangle_area ( t ) / 0.5;

  return
end
  
