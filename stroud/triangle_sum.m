function result = triangle_sum ( func, xval, yval, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% TRIANGLE_SUM carries out a unit quadrature rule in an arbitrary triangle.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      (X,Y) = ALPHA * (X1,Y1) + BETA * (X2,Y2) + ( 1 - ALPHA - BETA ) * (X3,Y3)
%      0 <= ALPHA <= 1 - BETA
%      0 <= BETA <= 1 - ALPHA
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
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
%    Input, real XVAL(3), YVAL(3), the coordinates of the nodes.
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

    x =         xtab(i)             * xval(1) ...
                        + ytab(i)   * xval(2) ...
      + ( 1.0 - xtab(i) - ytab(i) ) * xval(3);

    y =         xtab(i)             * yval(1) ...
                        + ytab(i)   * yval(2) ... 
      + ( 1.0 - xtab(i) - ytab(i) ) * yval(3);

    quad = quad + weight(i) * feval ( func, x, y );

  end

  volume = triangle_volume ( xval, yval );
  result = quad * volume;

  return
end
