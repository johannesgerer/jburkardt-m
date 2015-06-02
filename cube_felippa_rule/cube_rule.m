function [ w, xyz ] = cube_rule ( a, b, order_1d )

%*****************************************************************************80
%
%% CUBE_RULE returns a quadrature rule for a cube in 3D.
%
%  Discussion:
%
%    The integration region is:
%
%    The integration region is:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%      A(3) <= Z <= B(3)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2014
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
%    Input, real A(3), B(3), the lower and upper limits.
%
%    Input, integer ORDER_1D(3), the order of the rule in each
%    dimension.  1 <= ORDER_1D(I) <= 5.
%
%    Output, real W(ORDER_1D(1)*ORDER_1D(2)*ORDER_1D(3)), the weights.
%
%    Output, real XYZ(3,ORDER_1D(1)*ORDER_1D(2)*ORDER_1D(3)), the abscissas.
%
  order = prod ( order_1d(1:3) );

  xyz = [];
  w = [];

  for i = 1 : 3

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
      fprintf ( 1, 'CUBE_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of ORDER_1D(*).\n' );
      error ( 'CUBE_RULE - Fatal error!' );
    end
%
%  Transform from [-1,+1] to [Ai,Bi]
%
    w_1d(1:o) = w_1d(1:o) * ( b(i) - a(i) ) / 2.0;
    x_1d(1:o) = ( ( 1.0 - x_1d(1:o) ) * a(i)   ...
                + ( 1.0 + x_1d(1:o) ) * b(i) ) ...
                /   2.0;
%
%  Add this information to the rule.
%
    xyz = r8vec_direct_product ( i, o, x_1d, 3, order, xyz );

    w = r8vec_direct_product2 ( i, o, w_1d, 3, order, w );

  end

  return
end
