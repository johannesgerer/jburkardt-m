function [ inside, p ] = triangle_contains_line_par_3d ( t, p0, pd )

%*****************************************************************************80
%
%% TRIANGLE_CONTAINS_LINE_PAR_3D: finds if a line is inside a triangle in 3D.
%
%  Discussion:
%
%    A line will "intersect" the plane of a triangle in 3D if
%    * the line does not lie in the plane of the triangle
%      (there would be infinitely many intersections), AND
%    * the line does not lie parallel to the plane of the triangle
%      (there are no intersections at all).
%
%    Therefore, if a line intersects the plane of a triangle, it does so
%    at a single point.  We say the line is "inside" the triangle if,
%    regarded as 2D objects, the intersection point of the line and the plane
%    is inside the triangle.
%
%    A triangle in 3D is determined by three points:
%
%      T(1:3,1), T(1:3,2) and T(1:3,3).
%
%    The parametric form of a line in 3D is:
%
%      P(1:3) = P0(1:3) + PD(1:3) * T
%
%    We can normalize by requiring PD to have euclidean norm 1,
%    and the first nonzero entry positive.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer, John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983, page 111.
%
%  Parameters:
%
%    Input, real T(3,3), the three points that define
%    the triangle.
%
%    Input, real P0(3,1), PD(3,1), parameters that define the
%    parametric line.
%
%    Output, logical INSIDE, is TRUE if (the intersection point of)
%    the line is inside the triangle.
%
%    Output, real P(3,1), is the point of intersection of the line
%    and the plane of the triangle, unless they are parallel.
%
  dim_num = 3;

  tol = 0.00001;
%
%  Determine the implicit form (A,B,C,D) of the plane containing the
%  triangle.
%
  a = ( t(2,2) - t(2,1) ) * ( t(3,3) - t(3,1) ) ...
    - ( t(3,2) - t(3,1) ) * ( t(2,3) - t(2,1) );

  b = ( t(3,2) - t(3,1) ) * ( t(1,3) - t(1,1) ) ...
    - ( t(1,2) - t(1,1) ) * ( t(3,3) - t(3,1) );

  c = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
    - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) );

  d = - t(1,2) * a - t(2,2) * b - t(3,2) * c;
%
%  Make sure the plane is well-defined.
%
  norm1 = sqrt ( a * a + b * b + c * c );

  if ( norm1 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_LINE_PAR_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The plane normal vector is null.\n' );
    inside = 0;
    p(1:dim_num,1) = 0.0;
    error ( 'TRIANGLE_LINE_PAR_INT_3D - Fatal error!' );
  end
%
%  Make sure the implicit line is well defined.
%
  norm2 = sqrt ( sum ( pd(1:dim_num,1).^2 ) );

  if ( norm2 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_LINE_PAR_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The line direction vector is null.\n' );
    inside = 0;
    p(1:dim_num,1) = 0.0;
    error ( 'TRIANGLE_LINE_PAR_INT_3D - Fatal error!' );
  end
%
%  Determine the denominator of the parameter in the
%  implicit line definition that determines the intersection
%  point.
%
  denom = a * pd(1,1) + b * pd(2,1) + c * pd(3,1);
%
%  If DENOM is zero, or very small, the line and the plane may be
%  parallel or almost so.
%
  if ( abs ( denom ) < tol * norm1 * norm2 )
%
%  The line may actually lie in the plane.  We're not going
%  to try to address this possibility.
%
    if ( a * p0(1,1) + b * p0(2,1) + c * p0(3,1) + d == 0.0 )

      intersect = 1;
      inside = 0;
      p(1:dim_num,1) = p0(1:dim_num,1);
%
%  The line and plane are parallel and disjoint.
%
    else

      intersect = 0;
      inside = 0;
      p(1:dim_num,1) = 0.0;

    end
%
%  The line and plane intersect at a single point P.
%
  else

    intersect = 1;
    t_int = - ( a * p0(1,1) + b * p0(2,1) + c * p0(3,1) + d ) / denom;
    p(1:dim_num,1) = p0(1:dim_num,1) + t_int * pd(1:dim_num,1);
%
%  To see if P is included in the triangle, sum the angles
%  formed by P and pairs of the vertices.  If the point is in the
%  triangle, we get a total 360 degree view.  Otherwise, we
%  get less than 180 degrees.
%
    v1(1:dim_num,1) = t(1:dim_num,1) - p(1:dim_num,1);
    v2(1:dim_num,1) = t(1:dim_num,2) - p(1:dim_num,1);
    v3(1:dim_num,1) = t(1:dim_num,3) - p(1:dim_num,1);

    norm = sqrt ( sum ( v1(1:dim_num,1).^2 ) );

    if ( norm == 0.0 )
      inside = 1;
      return
    end

    v1(1:dim_num,1) = v1(1:dim_num,1) / norm;

    norm = sqrt ( sum ( v2(1:dim_num,1).^2 ) );

    if ( norm == 0.0 )
      inside = 1;
      return
    end

    v2(1:dim_num,1) = v2(1:dim_num,1) / norm;

    norm = sqrt ( sum ( v3(1:dim_num,1).^2 ) );

    if ( norm == 0.0 )
      inside = 1;
      return
    end

    v3(1:dim_num,1) = v3(1:dim_num,1) / norm;

    angle_sum = r8_acos ( v1(1:3,1)' * v2(1:3,1) ) ...
              + r8_acos ( v2(1:3,1)' * v3(1:3,1) ) ...
              + r8_acos ( v3(1:3,1)' * v1(1:3,1) );

    if ( round ( angle_sum / pi ) == 2 )
      inside = 1;
    else
      inside = 0;
    end

  end

  return
end
