function result = triangle_unit_sum ( func, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_SUM carries out a quadrature rule in the unit triangle.
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
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function of two variables which is to be integrated,
%    of the form:
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
  quad = 0.0;

  for i = 1 : norder
    quad = quad + weight(i) * feval ( func, xtab(i), ytab(i) );
  end

  volume = triangle_unit_volume ( );
  result = quad * volume;

  return
end
