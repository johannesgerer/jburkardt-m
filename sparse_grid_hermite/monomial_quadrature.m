function quad_error = monomial_quadrature ( dim_num, expon, point_num, ...
  weight, x )

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
%    08 October 2007
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
%    Input, real WEIGHT(1,POINT_NUM), the quadrature weights.
%
%    Input, real X(DIM_NUM,POINT_NUM), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the unscaled monomial.
%
  exact = hermite_integral_nd ( dim_num, expon );
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( dim_num, point_num, x, expon );
%
%  Compute the weighted sum.
%
  quad = ( weight * transpose ( value ) );
%
%  If exact value is nonzero, use it to scale the data.
%
  if ( exact == 0.0 )
    quad_error = abs ( quad );
  else
    quad_error = abs ( ( quad - exact ) / exact );
  end

  return
end
