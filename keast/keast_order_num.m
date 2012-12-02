function order_num = keast_order_num ( rule )

%*****************************************************************************80
%
%% KEAST_ORDER_NUM returns the order of a Keast rule for the tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Patrick Keast,
%    Moderate Degree Tetrahedral Quadrature Formulas,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 55, Number 3, May 1986, pages 339-348.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER_NUM, the order of the rule.
%
  suborder_num = keast_suborder_num ( rule );

  suborder = keast_suborder ( rule, suborder_num );

  order_num = sum ( suborder(1:suborder_num) );

  return
end
