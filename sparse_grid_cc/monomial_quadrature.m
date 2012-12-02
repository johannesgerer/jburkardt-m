function quad_error = monomial_quadrature ( dim_num, expon, point_num, weight, x )

%*****************************************************************************80
%
%% MONOMIAL_QUADRATURE applies a quadrature rule to a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Input, integer POINT_NUM, the number of points in the rule.
%
%    Input, real WEIGHT(POINT_NUM), the quadrature weights.
%
%    Input, real X(DIM_NUM,POINT_NUM), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the unscaled monomial.
%
  scale = monomial_int01 ( dim_num, expon );
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( dim_num, point_num, x, expon );
%
%  Compute the weighted sum and divide by the exact value.
%
  quad = ( weight * transpose ( value ) ) / scale;
%
%  Error:
%
  exact = 1.0;
  quad_error = abs ( quad - exact );

  return
end
