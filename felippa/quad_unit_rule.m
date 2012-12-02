function [ w, xy ] = quad_unit_rule ( order_1d )

%*****************************************************************************80
%
%% QUAD_UNIT_RULE returns a quadrature rule for the unit quadrilateral.
%
%  Discussion:
%
%    The integration region is:
%
%    - 1.0 <= X <= 1.0
%    - 1.0 <= Y <= 1.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carlos Felippa,
%    A compendium of FEM integration formulas for symbolic work,
%    Engineering Computation,
%    Volume 21, Number 8, 2004, pages 867-890.
%
%  Parameters:
%
%    Input, integer ORDER_1D(2), the order of the rule in
%    each dimension.  1 <= ORDER_1D(I) <= 5.
%
%    Output, real W(ORDER_1D(1)*ORDER_1D(2)), the weights.
%
%    Output, real XY(2,ORDER_1D(1)*ORDER_1D(2)), the abscissas.
%
  dim_num = 2;
  order = prod ( order_1d(1:dim_num) );

  xy = [];
  w = [];

  for dim = 1 : dim_num

    if ( order_1d(dim) == 1 )
      [ w_1d, x_1d ] = line_unit_o01 ( );
    elseif ( order_1d(dim) == 2 )
      [ w_1d, x_1d ] = line_unit_o02 ( );
    elseif ( order_1d(dim) == 3 )
      [ w_1d, x_1d ] = line_unit_o03 ( );
    elseif ( order_1d(dim) == 4 )
      [ w_1d, x_1d ] = line_unit_o04 ( );
    elseif ( order_1d(dim) == 5 )
      [ w_1d, x_1d ] = line_unit_o05 ( );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'QUAD_UNIT_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of ORDER_1D(*).\n' );
      error ( 'QUAD_UNIT_RULE - Fatal error!' );
    end

    xy = r8vec_direct_product ( dim, order_1d(dim), x_1d, ...
      dim_num, order, xy );

    w = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, ...
      dim_num, order, w );

  end

  return
end
