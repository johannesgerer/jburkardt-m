function result = hexagon_sum ( func, xc, yc, r, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% HEXAGON_SUM applies a quadrature rule inside a hexagon in 2D.
%
%  Discussion:
%
%    The input quadrature rule is assumed to be defined for a unit hexagon.
%
%    The input quadrature rule may be defined by calling HEXAGON_UNIT_SET.
%
%  Integration region:
%
%    The definition is given in terms of THETA, the angle in degrees of the
%    vector (X-XC,Y-YC).  The following six conditions apply, respectively,
%    between the bracketing values of THETA of 0, 60, 120, 180, 240,
%    300, and 360.
%
%      0 <= Y-YC <= -SQRT(3) * (X-XC) + R * SQRT(3)
%      0 <= Y-YC <=                     R * SQRT(3)/2
%      0 <= Y-YC <=  SQRT(3) * (X-XC) + R * SQRT(3)
%      -SQRT(3) * (X-XC) - R * SQRT(3)   <= Y-YC <= 0
%                        - R * SQRT(3)/2 <= Y-YC <= 0
%       SQRT(3) * (X-XC) - R * SQRT(3)   <= Y-YC <= 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
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
%    Input, real XC, YC, the coordinates of the center of the
%    hexagon.
%
%    Input, real R, the radius of the hexagon.
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas.
%
%    Input, real WEIGHT(NORDER), the weights of the rule.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0E+00;
  for i = 1 : norder
    x = xc + r * xtab(i);
    y = yc + r * ytab(i);
    quad = quad + weight(i) * feval ( func, x, y );
  end

  volume = hexagon_area_2d ( r );
  result = quad * volume;

  return
end
