function curvature = segments_curvature_2d ( p1, p2, p3 )

%*****************************************************************************80
%
%% SEGMENTS_CURVATURE_2D computes the curvature of two line segments in 2D.
%
%  Discussion:
%
%    We assume that the segments [P1,P2] and [P2,P3] are given.
%
%    We compute the circle that passes through P1, P2 and P3.
%
%    The inverse of the radius of this circle is the local "curvature".
%
%    If curvature is 0, the two line segments have the same slope,
%    and the three points are collinear.
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
%    Input, real P1(2,1), P2(2,1), P3(2,1), the points.
%
%    Output, real CURVATURE, the local curvature.
%
  [ r, pc ] = circle_exp2imp_2d ( p1, p2, p3 );

  if ( 0.0 < r )
    curvature = 1.0 / r;
  else
    curvature = 0.0;
  end

  return
end
