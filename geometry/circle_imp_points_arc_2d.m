function p = circle_imp_points_arc_2d ( r, center, theta1, theta2, n )

%*****************************************************************************80
%
%% CIRCLE_IMP_POINTS_ARC_2D returns N points on an arc of an implicit circle in 2D.
%
%  Discussion:
%
%    The first point is
%      ( CENTER(1) + R * COS ( THETA1 ), CENTER(2) + R * SIN ( THETA1 ) );
%    The last point is
%      ( CENTER(1) + R * COS ( THETA2 ), CENTER(2) + R * SIN ( THETA2 ) );
%    and the intermediate points are evenly spaced in angle between these,
%    and in counterclockwise order.
%
%    An implicit circle in 2D satisfies the equation:
%
%      ( X - CENTER(1) )^2 + ( Y - CENTER(2) )^2 = R^2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, real THETA1, THETA2, the angular coordinates of
%    the first and last points to be drawn, in radians.
%
%    Input, integer N, the number of points desired.  N must be at least 1.
%
%    Output, real P(2,N), the points on the circle.
%

%
%  THETA3 is the smallest angle, no less than THETA1, which
%  coincides with THETA2.
%
  theta3 = theta1 + r8_modp ( theta2 - theta1, 2.0 * pi );

  for i = 1 : n

    if ( 1 < n )
      theta = ( ( n - i     ) * theta1   ...
              + (     i - 1 ) * theta3 ) ...
              / ( n     - 1 );
    else
      theta = 0.5 * ( theta1 + theta3 );
    end

    p(1,i) = center(1,1) + r * cos ( theta );
    p(2,i) = center(2,1) + r * sin ( theta );

  end

  return
end
