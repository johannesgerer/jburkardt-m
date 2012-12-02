function dist_signed = quad_point_dist_signed_2d ( q, p )

%*****************************************************************************80
%
%% QUAD_POINT_DIST_SIGNED_2D: signed distanct ( quadrilateral, point ) in 2D.
%
%  Discussion:
%
%    The quadrilateral must be convex.  DIST_SIGNED is actually the maximum
%    of the signed distances from the point to each of the four lines that
%    make up the quadrilateral.
%
%    Essentially, if the point is outside the convex quadrilateral,
%    only one of the signed distances can be positive, or two can
%    be positive and equal.
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
%    Input, real P(2,1), the point which is to be checked.
%
%    Output, real DIST_SIGNED, the signed distance from the
%    point to the convex quadrilateral.  If DIST_SIGNED is
%    0.0, the point is on the boundary;
%    negative, the point is in the interior;
%    positive, the point is in the exterior.
%

%
%  Compare the signed distance from each line segment to the point,
%  with the signed distance to the midpoint of the opposite line.
%
%  The signed distances should all be negative if the point is inside.
%
%  Side 12
%
  dis12 = line_exp_point_dist_signed_2d ( q(1:2,1), q(1:2,2), p );

  pm(1:2,1) = 0.5 * ( q(1:2,3) + q(1:2,4) );

  dis = line_exp_point_dist_signed_2d ( q(1:2,1), q(1:2,2), pm );

  if ( 0.0 < dis )
    dis = -dis;
    dis12 = -dis12;
  end
%
%  Side 23
%
  dis23 = line_exp_point_dist_signed_2d ( q(1:2,2), q(1:2,3), p );

  pm(1:2,1) = 0.5 * ( q(1:2,4) + q(1:2,1) );

  dis = line_exp_point_dist_signed_2d ( q(1:2,2), q(1:2,3), pm );

  if ( 0.0 < dis )
    dis = -dis;
    dis23 = -dis23;
  end
%
%  Side 34
%
  dis34 = line_exp_point_dist_signed_2d ( q(1:2,3), q(1:2,4), p );

  pm(1:2,1) = 0.5 * ( q(1:2,1) + q(1:2,2) );

  dis = line_exp_point_dist_signed_2d ( q(1:2,3), q(1:2,4), pm );

  if ( 0.0 < dis )
    dis = -dis;
    dis34 = -dis34;
  end
%
%  Side 41
%
  dis41 = line_exp_point_dist_signed_2d ( q(1:2,4), q(1:2,1), p );

  pm(1:2,1) = 0.5 * ( q(1:2,2) + q(1:2,3) );

  dis = line_exp_point_dist_signed_2d ( q(1:2,4), q(1:2,1), pm );

  if ( 0.0 < dis )
    dis = -dis;
    dis41 = -dis41;
  end

  dist_signed = max ( dis12, max ( dis23, max ( dis34, dis41 ) ) );

  return
end
