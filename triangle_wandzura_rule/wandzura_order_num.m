function order_num = wandzura_order_num ( rule )

%*****************************************************************************80
%
%% WANDZURA_ORDER_NUM returns the order of a Wandzura rule for the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wandzura, Hong Xiao,
%    Symmetric Quadrature Rules on a Triangle,
%    Computers and Mathematics with Applications,
%    Volume 45, Number 12, June 2003, pages 1829-1840.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER_NUM, the order (number of points) of the rule.
%
  suborder_num = wandzura_suborder_num ( rule );

  suborder(1:suborder_num) = wandzura_suborder ( rule, suborder_num );

  order_num = sum ( suborder(1:suborder_num) );

  return
end
