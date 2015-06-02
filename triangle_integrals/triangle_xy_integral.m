function q = triangle_xy_integral ( x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% TRIANGLE_XY_INTEGRAL computes the integral of XY over a triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_xy_integral.m
%
%  Discussion:
%
%    This function was written as a special test case for the general
%    problem of integrating a monomial x^alpha * y^beta over a general 
%    triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, X2, Y2, X3, Y3, the coordinates of the
%    triangle vertices.
%
%    Output, real Q, the integral of X*Y over the triangle.
%

%
%  x = x1 * ( 1 - xi - eta )
%    + x2 *       xi
%    + x3 *            eta
%
%  y = y1 * ( 1 - xi - eta )
%    + y2 *       xi
%    + y3 *            eta
%
%  Rewrite as linear polynomials in (xi,eta):
%
%  x = x1 + ( x2 - x1 ) * xi + ( x3 - x1 ) * eta
%  y = y1 + ( y2 - y1 ) * xi + ( y3 - y1 ) * eta
%
%  Jacobian:
%
%    J = [ ( x2 - x1 )  ( x3 - x1 ) ]
%        [ ( y2 - y1 )  ( y3 - y1 ) ]
%
%    det J = ( x2 - x1 ) * ( y3 - y1 ) - ( y2 - y1 ) * ( x3 - x1 )
%
%  Integrand
%
%    x * y = ( x1 + ( x2 - x1 ) * xi + ( x3 - x1 ) * eta )
%          * ( y1 + ( y2 - y1 ) * xi + ( y3 - y1 ) * eta )
%
%  Rewrite as linear combination of monomials:
%
%    x * y = 1      * x1 * y1
%          + eta    * ( x1 * ( y3 - y1 ) + ( x3 - x1 ) * y1 )
%          + xi     * ( x1 * ( y2 - y1 ) + ( x2 - x1 ) * y1 )
%          + eta^2  * ( x3 - x1 ) * ( y3 - y1 )
%          + xi*eta * ( ( x2 - x1 ) * ( y3 - y1 ) + ( x3 - x1 ) * ( y2 - y1 ) )
%          + xi^2   * ( x2 - x1 ) * ( y2 - y1 )
%
  det = ( x2 - x1 ) * ( y3 - y1 ) - ( y2 - y1 ) * ( x3 - x1 );

  p00 = x1 * y1;

  p01 = x1 * ( y3 - y1 ) + ( x3 - x1 ) * y1;
  p10 = x1 * ( y2 - y1 ) + ( x2 - x1 ) * y1;

  p02 = ( x3 - x1 ) * ( y3 - y1 );
  p11 = ( x2 - x1 ) * ( y3 - y1 ) + ( x3 - x1 ) * ( y2 - y1 );
  p20 = ( x2 - x1 ) * ( y2 - y1 );

  q = 0.0;
  q = q + p00 * triangle01_monomial_integral ( 0, 0 );
  q = q + p10 * triangle01_monomial_integral ( 1, 0 );
  q = q + p01 * triangle01_monomial_integral ( 0, 1 );
  q = q + p20 * triangle01_monomial_integral ( 2, 0 );
  q = q + p11 * triangle01_monomial_integral ( 1, 1 );
  q = q + p02 * triangle01_monomial_integral ( 0, 2 );

  q = q * det;

  return
end

