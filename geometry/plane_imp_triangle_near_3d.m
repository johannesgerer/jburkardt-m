function [ dist, num_near, pn ] = plane_imp_triangle_near_3d ( t, a, b, c, d )

%*****************************************************************************80
%
%% PLANE_IMP_TRIANGLE_NEAR_3D: nearest ( implicit plane, triangle ) in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    If DIST = 0, then each point is a point of intersection, and there
%    will be at most 3 such points returned.
%
%    If 0 < DIST, then the points are listed in pairs, with the first
%    being on the triangle, and the second on the plane.  Two points will
%    be listed in the most common case, but possibly 4 or 6.
%
%
%    I need to see to it that the underlying distance routine always returns
%    one of the endpoints if the entire line segment is at zero distance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
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
%    Output, real DIST, the distance between the triangle
%    and the plane.
%
%    Output, integer NUM_NEAR, the number of nearest points returned.
%
%    Output, real PN(3,6), a collection of nearest points.
%
  dim_num = 3;
  num_near = 0;
%
%  Consider the line segment P1 - P2.
%
  [ dist12, p, pt ] = plane_imp_segment_near_3d ( t(1:dim_num,1), t(1:dim_num,2), ...
    a, b, c, d );

  dist = dist12;

  num_near = num_near + 1;
  pn(1:dim_num,num_near) = pt(1:dim_num)';

  if ( 0.0 < dist12 )
    num_near = num_near + 1;
    pn(1:dim_num,num_near) = p(1:dim_num)';
  end
%
%  Consider the line segment P2 - P3.
%
  [ dist23, p, pt ] = plane_imp_segment_near_3d ( t(1:dim_num,2), t(1:dim_num,3), ...
    a, b, c, d );

  if ( dist23 < dist )

    num_near = 0;
    dist = dist23;

    num_near = num_near + 1;
    pn(1:dim_num,num_near) = pt(1:dim_num)';

    if ( 0.0 < dist23 )
      num_near = num_near + 1;
      pn(1:dim_num,num_near) = p(1:dim_num)';
    end

  elseif ( dist23 == dist )

    num_near = num_near + 1;
    pn(1:dim_num,num_near) = pt(1:dim_num)';

    if ( 0.0 < dist23 )
      num_near = num_near + 1;
      pn(1:dim_num,num_near) = p(1:dim_num)';
    end

  end
%
%  Consider the line segment P3 - P1.
%
  [ dist31, p, pt ] = plane_imp_segment_near_3d ( t(1:dim_num,3), t(1:dim_num,1), ...
    a, b, c, d );

  if ( dist31 < dist )

    num_near = 0;
    dist = dist31;

    num_near = num_near + 1;
    pn(1:dim_num,num_near) = pt(1:dim_num)';

    if ( 0.0 < dist31 )
      num_near = num_near + 1;
      pn(1:dim_num,num_near) = p(1:dim_num)';
    end

  elseif ( dist31 == dist )

    num_near = num_near + 1;
    pn(1:dim_num,num_near) = pt(1:dim_num)';

    if ( 0.0 < dist31 )
      num_near = num_near + 1;
      pn(1:dim_num,num_near) = p(1:dim_num)';
    end

  end

  return
end
