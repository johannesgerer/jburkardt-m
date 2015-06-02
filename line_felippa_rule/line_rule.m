function [ w, x ] = line_rule ( a, b, order )

%*****************************************************************************80
%
%% LINE_RULE returns a quadrature rule for a line segment in 1D.
%
%  Discussion:
%
%    The integration region is:
%      A <= X <= B
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
%    Input, real A, B, the lower and upper limits.
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights.
%
%    Output, real X(ORDER), the abscissas.
%
  if ( order == 1 )
    [ w, x ] = line_unit_o01 ( );
  elseif ( order == 2 )
    [ w, x ] = line_unit_o02 ( );
  elseif ( order == 3 )
    [ w, x ] = line_unit_o03 ( );
  elseif ( order == 4 )
    [ w, x ] = line_unit_o04 ( );
  elseif ( order == 5 )
    [ w, x ] = line_unit_o05 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_RULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER.\n' );
    error ( 'LINE_RULE - Fatal error!' );
  end
%
%  Transform from [-1,+1] to [A,B]
%
  for j = 1 : order
    w(j) = w(j) * ( b - a ) / 2.0;
    x(j) = ( ( 1.0 - x(j) ) * a   ...
           + ( 1.0 + x(j) ) * b ) ...
           /   2.0;
  end

  return
end