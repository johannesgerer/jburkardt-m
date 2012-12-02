function order_num = fekete_order_num ( rule )

%*****************************************************************************80
%
%% FEKETE_ORDER_NUM returns the order of a Fekete rule for the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Taylor, Beth Wingate, Rachel Vincent,
%    An Algorithm for Computing Fekete Points in the Triangle,
%    SIAM Journal on Numerical Analysis,
%    Volume 38, Number 5, 2000, pages 1707-1720.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER_NUM, the order (number of points) of the rule.
%
  suborder_num = fekete_suborder_num ( rule );

  suborder(1:suborder_num) = fekete_suborder ( rule, suborder_num );

  order_num = sum ( suborder(1:suborder_num) );

  return
end
