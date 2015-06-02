function quad_error = simplex_unit_monomial_quadrature ( dim_num, expon, ...
  point_num, x, w )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_MONOMIAL_QUADRATURE: quadrature of monomials in a unit simplex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
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
%    Input, real X(DIM_NUM,POINT_NUM), the quadrature points.
%
%    Input, real W(POINT_NUM), the quadrature weights.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the unscaled monomial.
%
  scale = simplex_unit_monomial_int ( dim_num, expon );
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( dim_num, point_num, x, expon );
%
%  Compute the weighted sum and divide by the exact value.
%
  volume = simplex_unit_volume ( dim_num );
  quad = volume * ( w * value' ) / scale;
%
%  Error:
%
  exact = 1.0;
  quad_error = abs ( quad - exact );

  return
end
