function [ xtab, ytab, weight ] = triangle_unit_product_set ( rule, order )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_PRODUCT_SET sets a product quadrature rule on a unit triangle.
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
%    Output, real XTAB(ORDER), YTAB(ORDER), the abscissas.
%
%    Output, real WEIGHT(ORDER), the weights of the rule.
%
  a = -1.0;
  b = +1.0;
  c =  0.0;
  d = +1.0;

  order0 = rule;
  [ xtab0, weight0 ] = legendre_set ( order0 );
  [ xtab0, weight0 ] = rule_adjust ( a, b, c, d, order0, xtab0, weight0 );

  order1 = rule;
  [ xtab1, weight1 ] = legendre_set_x1 ( order1 );
  [ xtab1, weight1 ] = rule_adjust ( a, b, c, d, order1, xtab1, weight1 );

  k = 0;
  for j = 1 : order1
    for i = 1 : order0
      k = k + 1;
      xtab(k) = 1.0 - xtab1(j);
      ytab(k) = xtab0(i) * xtab1(j);
      weight(k) = weight0(i) * weight1(j);
    end
  end

  return
end
