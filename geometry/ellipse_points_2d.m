function p = ellipse_points_2d ( center, r1, r2, psi, n )

%*****************************************************************************80
%
%% ELLIPSE_POINTS_2D returns N points on an tilted ellipse in 2D.
%
%  Discussion:
%
%    The points are "equally spaced" in the angular sense.  They are
%    not equally spaced along the perimeter of the ellipse.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CENTER(2), the center of the ellipse.
%
%    Input, real R1, R2, the "radius" of the ellipse in the major
%    and minor axis directions.  A circle has these values equal.
%
%    Input, real PSI, the angle that the major axis of the ellipse
%    makes with the X axis.  A value of 0.0 means that the major and
%    minor axes of the ellipse will be the X and Y coordinate axes.
%
%    Input, integer N, the number of points desired.  N must be at least 1.
%
%    Output, real P(2,N), points on the ellipse.
%
  dim_num = 2;

  for i = 1 : n

    theta = ( 2.0 * pi * ( i - 1 ) ) / n;

    p(1,i) = center(1) + r1 * cos ( psi ) * cos ( theta ) ...
                       - r2 * sin ( psi ) * sin ( theta );

    p(2,i) = center(2) + r1 * sin ( psi ) * cos ( theta ) ...
                       + r2 * cos ( psi ) * sin ( theta );

  end

  return
end
