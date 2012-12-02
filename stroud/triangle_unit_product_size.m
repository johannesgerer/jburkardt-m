function order = triangle_unit_product_size ( rule )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_PRODUCT_SIZE sizes a product quadrature rule on a unit triangle.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 April 2008
%
%  Author:
%
%    John Burkardt
%
%  References:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule number, or the order of the 1D rule.
%
%    Output, integer ORDER, the order of the rule.
%
  order = rule * rule;

  return
end
