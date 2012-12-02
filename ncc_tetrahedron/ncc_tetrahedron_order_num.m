function order_num = ncc_tetrahedron_order_num ( rule )

%*****************************************************************************80
%
%% NCC_TETRAHEDRON_ORDER_NUM returns the order of an NCC rule for the tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Silvester,
%    Symmetric Quadrature Formulae for Simplexes,
%    Mathematics of Computation,
%    Volume 24, Number 109, January 1970, pages 95-100.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER_NUM, the order (number of points) of the rule.
%
  suborder_num = ncc_tetrahedron_suborder_num ( rule );

  suborder(1:suborder_num) = ncc_tetrahedron_suborder ( rule, suborder_num );

  order_num = sum ( suborder(1:suborder_num) );

  return
end
