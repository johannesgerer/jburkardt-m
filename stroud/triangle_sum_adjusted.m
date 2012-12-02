function result = triangle_sum_adjusted ( func, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% TRIANGLE_SUM_ADJUSTED carries out an adjusted quadrature rule in a triangle.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      (X,Y) = ALPHA * (X1,Y1) + BETA * (X2,Y2) + ( 1 - ALPHA - BETA ) * (X3,Y3)
%      0 <= ALPHA <= 1 - BETA
%      0 <= BETA <= 1 - ALPHA
%
%  Discussion:
%
%    It is assumed that a quadrature rule approprate for a unit triangle
%    was generated, and then adjusted to a particular triangle by calling
%    TRIANGLE_RULE_ADJUST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function of
%    two variables which is to be integrated, of the form:
%      function value = func ( x, y )
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas.
%
%    Input, real WEIGHT(NORDER), the weights of the rule.
%
%    Output, real RESULT, the approximate integral of the function.
%
  result = 0.0;

  for i = 1 : norder
    result = result + weight(i) * feval ( func, xtab(i), ytab(i) )
  end

  return
end
