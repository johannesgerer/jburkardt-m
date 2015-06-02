function result = circle_cum ( func, xc, yc, radius, norder )

%*****************************************************************************80
%
%% CIRCLE_CUM approximates an integral on the circumference of a circle in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      ( X - XC )^2 + ( Y - YC )^2 = RADIUS^2.
%
%  Discussion:
%
%    An NORDER point, (NORDER-1)-th degree formula is used,
%    Stroud number U2:M-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, function VALUE = FUNC ( X, Y ), the name of the user supplied 
%    function of two variables which is to be integrated.  The name should
%    be passed as a quoted string.
%
%    Input, real XC, YC, the coordinates of the center of
%    the circle.
%
%    Input, real RADIUS, the radius of the circle.
%
%    Input, integer NORDER, the number of points to use.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0E+00;

  for i = 1 : norder
    angle = ( 2 * i ) * pi / norder;
    x = xc + radius * cos ( angle );
    y = yc + radius * sin ( angle );
    quad = quad + feval ( func, x, y );
  end

  quad = quad / norder;

  volume = pi * radius * radius;
  result = quad * volume;

  return
end
