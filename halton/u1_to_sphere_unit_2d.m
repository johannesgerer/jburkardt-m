function x = u1_to_sphere_unit_2d ( u )

%*****************************************************************************80
%
%% U1_TO_SPHERE_UNIT_2D maps a point in the unit interval onto the unit sphere in 2D.
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
%    Input, real U, a point in the unit interval.
%
%    Output, real X(2), the corresponding point on the circle.
%
  angle = 2.0 * pi * u(1);

  x(1) = cos ( angle );
  x(2) = sin ( angle );

  return
end

