function x = u3_to_ball_unit_3d ( u )

%*****************************************************************************80
%
%% U3_TO_BALL_UNIT_3D maps a point in the unit box to the unit ball in 3D.
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
%    Input, real U(3), a point in the unit box.
%
%    Output, real X(3), the corresponding point in the unit ball.
%

%
%  Pick a uniformly random VDOT, which must be between -1 and 1.
%  This represents the dot product of the random vector with the Z unit vector.
%
%  Note: this works because the surface area of the sphere between
%  Z and Z + dZ is independent of Z.  So choosing Z uniformly chooses
%  a patch of area uniformly.
%
  vdot = 2.0 * u(1) - 1.0;

  phi = arc_cosine ( vdot );
%
%  Pick a uniformly random rotation between 0 and 2 Pi around the
%  axis of the Z vector.
%
  theta = 2.0 * pi * u(2);
%
%  Pick a random radius R.
%
  r = u(3)^( 1.0 / 3.0 );

  x(1) = r * cos ( theta ) * sin ( phi );
  x(2) = r * sin ( theta ) * sin ( phi );
  x(3) = r * cos ( phi );

  return
end

