function [ dist, p, pn ] = plane_imp_segment_near_3d ( p1, p2, a, b, c, d )

%*****************************************************************************80
%
%% PLANE_IMP_SEGMENT_NEAR_3D: nearest ( implicit plane, line segment ) in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), the endpoints of the line
%    segment.
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Output, real DIST, the distance between the line segment and
%    the plane.
%
%    Output, real P(3), the nearest point on the plane.
%
%    Output, real PN(3), the nearest point on the line
%    segment to the plane.  If DIST is zero, the PN is a point of
%    intersection of the plane and the line segment.
%
  dim_num = 3;

  pn(1:dim_num) = 0.0;
  p(1:dim_num) = 0.0;

  norm = sqrt ( a * a + b * b + c * c );

  if ( norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_IMP_SEGMENT_NEAR_3D - Fatal error!\n' );
    fprintf ( 1, '  Plane normal vector is null.\n' );
    error ( 'PLANE_IMP_SEGMENT_NEAR_3D - Fatal error!' );
  end
%
%  The normalized coefficients allow us to compute the (signed) distance.
%
  an = a / norm;
  bn = b / norm;
  cn = c / norm;
  dn = d / norm;
%
%  If the line segment is actually a point, then the answer is easy.
%
  if ( p1(1:dim_num) == p2(1:dim_num) )
    dot1 = an * p1(1) + bn * p1(2) + cn * p1(3) + dn;
    dist = abs ( dot1 );
    pn(1:dim_num) = p1(1:dim_num);
    p(1) = pn(1) - an * dot1;
    p(2) = pn(2) - bn * dot1;
    p(3) = pn(3) - cn * dot1;
    return
  end
%
%  Compute the projections of the two points onto the normal vector.
%
  dot1 = an * p1(1) + bn * p1(2) + cn * p1(3) + dn;
  dot2 = an * p2(1) + bn * p2(2) + cn * p2(3) + dn;
%
%  If these have the same sign, then the line segment does not
%  cross the plane, and one endpoint is the nearest point.
%
  if ( ( 0.0 < dot1 & 0.0 < dot2 ) | ( dot1 < 0.0 & dot2 < 0.0 ) )

    dot1 = abs ( dot1 );
    dot2 = abs ( dot2 );

    if ( dot1 < dot2 )
      pn(1:dim_num) = p1(1:dim_num);
      p(1) = pn(1) - an * dot1;
      p(2) = pn(2) - bn * dot1;
      p(3) = pn(3) - cn * dot1;
      dist = dot1;
    else
      pn(1:dim_num) = p2(1:dim_num);
      dist = dot2;
      p(1) = pn(1) - an * dot2;
      p(2) = pn(2) - bn * dot2;
      p(3) = pn(3) - cn * dot2;
    end
%
%  If the projections differ in sign, the line segment crosses the plane.
%
  else

    if ( dot1 == 0.0 )
      alpha = 0.0;
    elseif ( dot2 == 0.0 )
      alpha = 1.0;
    else
      alpha = dot2 / ( dot2 - dot1 );
    end

    pn(1:dim_num) =             alpha   * p1(1:dim_num) ...
               + ( 1.0D+00 - alpha ) * p2(1:dim_num);

    p(1:dim_num) = pn(1:dim_num);

    dist = 0.0;

  end

  return
end
