function [ w, xyz ] = wedg_unit_rule ( line_order, trig_order )

%*****************************************************************************80
%
%% WEDG_UNIT_RULE returns a quadrature rule for the unit wedge.
%
%  Discussion:
%
%    It is usually sensible to take LINE_ORDER and TRIG_ORDER so that
%    the line and triangle rules are roughly the same precision.  For that
%    criterion, we recommend the following combinations:
%
%      TRIG_ORDER  LINE_ORDER  Precision
%      ----------  ----------  ---------
%          1           1       1 x 1 
%          3           2       2 x 3
%         -3           2       2 x 3
%          6           3       4 x 5
%         -6           2       3 x 3
%          7           3       5 x 5
%         12           4       6 x 7
%
%    The integration region is:
%
%      0 <= X
%      0 <= Y
%      X + Y <= 1
%      -1 <= Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2009
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
%    Input, integer LINE_ORDER, the index of the line rule.
%    The index of the rule is equal to the order of the rule.
%    1 <= LINE_ORDER <= 5.
%
%    Input, integer TRIG_ORDER, the indes of the triangle rule.
%    The index of the rule is 1, 3, -3, 6, -6, 7 or 12.
%
%    Output, real W(LINE_ORDER*abs(TRIG_ORDER)), the weights.
%
%    Output, real XYZ(3,LINE_ORDER*abs(TRIG_ORDER)), the abscissas.
%
  order = line_order * abs ( trig_order );

  w = zeros ( 1, order );
  xyz = zeros ( 3, order );

  if ( line_order == 1 )
    [ line_w, line_x ] = line_unit_o01 ( );
  elseif ( line_order == 2 )
    [ line_w, line_x ] = line_unit_o02 ( );
  elseif ( line_order == 3 )
    [ line_w, line_x ] = line_unit_o03 ( );
  elseif ( line_order == 4 )
    [ line_w, line_x ] = line_unit_o04 ( );
  elseif ( line_order == 5 )
    [ line_w, line_x ] = line_unit_o05 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEDG_UNIT_RULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of LINE_ORDER.\n' );
    stop
  end

  if ( trig_order == 1 )
    [ trig_w, trig_xy ] = trig_unit_o01 ( );
  elseif ( trig_order == 3 )
    [ trig_w, trig_xy ] = trig_unit_o03 ( );
  elseif ( trig_order == - 3 )
    [ trig_w, trig_xy ] = trig_unit_o03b ( );
  elseif ( trig_order == 6 )
    [ trig_w, trig_xy ] = trig_unit_o06 ( );
  elseif ( trig_order == - 6 )
    [ trig_w, trig_xy ] = trig_unit_o06b ( );
  elseif ( trig_order == 7 )
    [ trig_w, trig_xy ] = trig_unit_o07 ( );
  elseif ( trig_order == 12 )
    [ trig_w, trig_xy ] = trig_unit_o12 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEDG_UNIT_RULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TRIG_ORDER.\n' );
    stop
  end

  k = 0;
  for i = 1 : line_order
    for j = 1 : abs ( trig_order )
      k = k + 1;
      w(k) = line_w(i) * trig_w(j);
      xyz(1:2,k) = trig_xy(1:2,j);
      xyz(3,k) = line_x(i);
    end
  end

  return
end
