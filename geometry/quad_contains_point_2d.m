function inside = quad_contains_point_2d ( q, p )

%*****************************************************************************80
%
%% QUAD_CONTAINS_POINT_2D finds if a point is inside a convex quadrilateral in 2D.
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
%    Input, real Q(2,4), the vertices of the quadrilateral.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is in the quadrilateral.
%

%
%  This will only handle convex quadrilaterals.
%
  inside = 0;

  angle_1 = angle_rad_2d ( q(1:2,1), q(1:2,2), q(1:2,3) );
  angle_2 = angle_rad_2d ( q(1:2,1), q(1:2,2), p(1:2,1) );

  if ( angle_1 < angle_2 )
    return
  end

  angle_1 = angle_rad_2d ( q(1:2,2), q(1:2,3), q(1:2,4) );
  angle_2 = angle_rad_2d ( q(1:2,2), q(1:2,3), p(1:2,1) );

  if ( angle_1 < angle_2 )
    return
  end

  angle_1 = angle_rad_2d ( q(1:2,3), q(1:2,4), q(1:2,1) );
  angle_2 = angle_rad_2d ( q(1:2,3), q(1:2,4), p(1:2,1) );

  if ( angle_1 < angle_2 )
    return
  end

  angle_1 = angle_rad_2d ( q(1:2,4), q(1:2,1), q(1:2,2) );
  angle_2 = angle_rad_2d ( q(1:2,4), q(1:2,1), p(1:2,1) );

  if ( angle_1 < angle_2 )
    return
  end

  inside = 1;

  return
end
