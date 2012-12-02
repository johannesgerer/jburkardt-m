function x = u2_to_ball_unit_2d ( u )

%*****************************************************************************80
%
%% U2_TO_BALL_UNIT_2D maps a point in the unit box to the unit ball in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U(2), a point in the unit box.
%
%    Output, real X(2), the corresponding point inside the unit ball.
%
  r = sqrt ( u(1) );
  theta = 2.0 * pi * u(2);

  x(1) = r * cos ( theta );
  x(2) = r * sin ( theta );

  return
end

