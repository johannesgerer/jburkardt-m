function [ w, xy ] = square_rule ( a, b, order_1d )

%*****************************************************************************80
%
%% SQUARE_RULE returns a quadrature rule for a square in 2D.
%
%  Discussion:
%
%    The integration region is defined as:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
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
%    Input, real A(2), B(2), the lower and upper limits.
%
%    Input, integer ORDER_1D(2), the order of the rule in
%    each dimension.  1 <= ORDER_1D(I) <= 5.
%
%    Output, real W(ORDER_1D(1)*ORDER_1D(2),1), the weights.
%
%    Output, real XY(2,ORDER_1D(1)*ORDER_1D(2)), the abscissas.
%
  order = order_1d(1) * order_1d(2);

  xy = zeros ( 2, order );
  w = zeros ( order, 1 );

  for i = 1 : 2

    o = order_1d(i);

    if ( o == 1 )
      [ w_1d, x_1d ] = line_unit_o01 ( );
    elseif ( o == 2 )
      [ w_1d, x_1d ] = line_unit_o02 ( );
    elseif ( o == 3 )
      [ w_1d, x_1d ] = line_unit_o03 ( );
    elseif ( o == 4 )
      [ w_1d, x_1d ] = line_unit_o04 ( );
    elseif ( o == 5 )
      [ w_1d, x_1d ] = line_unit_o05 ( );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SQUARE_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of ORDER_1D(*).\n' );
      error ( 'SQUARE_RULE - Fatal error!' );
    end
%
%  Transform from [-1,+1] to [Ai,Bi]
%
    for j = 1 : o
      w_1d(j) = w_1d(j) * ( b(i) - a(i) ) / 2.0;
      x_1d(j) = ( ( 1.0 - x_1d(j) ) * a(i)   ...
                + ( 1.0 + x_1d(j) ) * b(i) ) ...
                /   2.0;
    end
%
%  Add this information to the rule.
%
    xy = r8vec_direct_product ( i, o, x_1d, 2, order, xy );

    w = r8vec_direct_product2 ( i, o, w_1d, 2, order, w );

  end

  return
end
