function order_num = dunavant_order_num ( rule )

%*****************************************************************************80
%
%% DUNAVANT_ORDER_NUM returns the order of a Dunavant rule for the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Dunavant,
%    High Degree Efficient Symmetrical Gaussian Quadrature Rules
%    for the Triangle, 
%    International Journal for Numerical Methods in Engineering,
%    Volume 21, 1985, pages 1129-1148.
%
%    James Lyness, Dennis Jespersen,
%    Moderate Degree Symmetric Quadrature Rules for the Triangle,
%    Journal of the Institute of Mathematics and its Applications,
%    Volume 15, Number 1, February 1975, pages 19-32.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER_NUM, the order (number of points) of the rule.
%
  suborder_num = dunavant_suborder_num ( rule );

  suborder(1:suborder_num) = dunavant_suborder ( rule, suborder_num );

  order_num = sum ( suborder(1:suborder_num) );

  return
end
