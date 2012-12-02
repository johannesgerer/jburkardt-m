function [ num_int, pi ] = plane_imp_triangle_int_3d ( a, b, c, d, t )

%*****************************************************************************80
%
%% PLANE_IMP_TRIANGLE_INT_3D: intersection ( implicit plane, triangle ) in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    There may be 0, 1, 2 or 3 points of intersection returned.
%
%    If two intersection points are returned, then the entire line
%    between them comprises points of intersection.
%
%    If three intersection points are returned, then all points of
%    the triangle intersect the plane.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,3), the vertices of the triangle.
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Output, integer NUM_INT, the number of intersection points returned.
%
%    Output, real PI(3,3), the intersection points.
%
  dim_num = 3;
  num_int = 0;
  pi = [];
%
%  Compute the signed distances between the vertices and the plane.
%
  dist1 = a * t(1,1) + b * t(2,1) + c * t(3,1) + d;
  dist2 = a * t(1,2) + b * t(2,2) + c * t(3,2) + d;
  dist3 = a * t(1,3) + b * t(2,3) + c * t(3,3) + d;
%
%  Consider any zero distances.
%
  if ( dist1 == 0.0 )
    num_int = num_int + 1;
    pi(1:dim_num,num_int) = t(1:dim_num,1);
  end

  if ( dist2 == 0.0 )
    num_int = num_int + 1;
    pi(1:dim_num,num_int) = t(1:dim_num,2);
  end

  if ( dist3 == 0.0 )
    num_int = num_int + 1;
    pi(1:dim_num,num_int) = t(1:dim_num,3);
  end
%
%  If 2 or 3 of the nodes intersect, we're already done.
%
  if ( 2 <= num_int )
    return
  end
%
%  If one node intersects, then we're done unless the other two
%  are of opposite signs.
%
  if ( num_int == 1 )

    if ( dist1 == 0.0 )

      [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,2), t(1:dim_num,3), ...
        dist2, dist3, num_int, pi );

    elseif ( dist2 == 0.0 )

      [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,1), t(1:dim_num,3), ...
        dist1, dist3, num_int, pi );

    elseif ( dist3 == 0.0 )

      [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,1), t(1:dim_num,2), ...
        dist1, dist2, num_int, pi );

    end

    return

  end
%
%  All nodal distances are nonzero, and there is at least one
%  positive and one negative.
%
  if ( dist1 * dist2 < 0.0 & dist1 * dist3 < 0.0 )

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,1), t(1:dim_num,2), ...
      dist1, dist2, num_int, pi );

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,1), t(1:dim_num,3), ...
      dist1, dist3, num_int, pi );

  elseif ( dist2 * dist1 < 0.0 & dist2 * dist3 < 0.0 )

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,2), t(1:dim_num,1), ...
      dist2, dist1, num_int, pi );

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,2), t(1:dim_num,3), ...
      dist2, dist3, num_int, pi );

  elseif ( dist3 * dist1 < 0.0 & dist3 * dist2 < 0.0 )

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,3), t(1:dim_num,1), ...
      dist3, dist1, num_int, pi );

    [ num_int, pi ] = plane_imp_triangle_int_add_3d ( t(1:dim_num,3), t(1:dim_num,2), ...
      dist3, dist2, num_int, pi );

  end

  return
end
