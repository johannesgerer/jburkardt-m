function quad_error = monomial_quadrature ( dim_num, expon, point_num, ...
  weight, x, rule )

%*****************************************************************************80
%
%% MONOMIAL_QUADRATURE applies a quadrature rule to a monomial.
%
%  Discussion:
%
%    This routine assumes that the integral being approximated is that of
%    a multidimensional monomial, integrated over the [-1,+1] hypercube,
%    with a Legendre weight (that is, w(x) = 1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2008
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
%    Input, integer RULE, the index of the rule.
%    1, "CC", Clenshaw Curtis Closed Fully Nested rule.
%    2, "F1", Fejer 1 Open Fully Nested rule.
%    3, "F2", Fejer 2 Open Fully Nested rule.
%    4, "GP", Gauss Patterson Open Fully Nested rule.
%    5, "GL", Gauss Legendre Open Weakly Nested rule.
%    6, "GH", Gauss Hermite Open Weakly Nested rule.
%    7, "LG", Gauss Laguerre Open Non Nested rule.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the monomial.
%
  if ( 1 <= rule & rule <= 5 )
    exact = monomial_integral_legendre ( dim_num, expon );
  elseif ( rule == 6 )
    exact = monomial_integral_hermite ( dim_num, expon );
  elseif ( rule == 7 )
    exact = monomial_integral_laguerre ( dim_num, expon );
  end 
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( dim_num, point_num, x, expon );
%
%  Compute the quadrature sum.
%
  quad = weight * value';
%
%  Absolute error if EXACT = 0, relative error otherwise:
%
  if ( exact == 0.0 )
    quad_error = abs ( quad - exact );
  else
    quad_error = abs ( quad - exact ) / abs ( exact );
  end

  return
end
