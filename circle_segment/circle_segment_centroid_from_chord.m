function d = circle_segment_centroid_from_chord ( r, c, p1, p2 )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_CENTROID_FROM_CHORD computes the centroid of a circle segment.
%
%  Discussion:
%
%    Begin with a circle of radius R.  Choose two points P1 and P2 on the
%    circle, and draw the chord P1:P2.  This chord divides the circle
%    into two pieces, each of which is called a circle segment.
%    Consider one of the pieces.  The "angle" of this segment is the angle 
%    P1:C:P2, where C is the center of the circle.  Let Q be the point on 
%    the chord P1:P2 which is closest to C.  The "height" of the segment
%    is the distance from Q to the perimeter of the circle.
%
%    For this function, we assume that the center of the circle is at (0,0),
%    that the chord is horizontal, and that the circle segment is at the top.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%    0 < R.
%
%    Input, real C(2,1), the center of the circle.
%
%    Input, real P1(2,1), P2(2,1), the coordinates of the endpoints of the chord.
%
%    Output, real D(2,1), the coordinates of the centroid.
%

%
%  Destroy all row vectors.
%
  c = c(:);
  p1 = p1(:);
  p2 = p2(:);
%
%  Get the angle subtended by P1:P2.
%
  theta = circle_segment_angle_from_chord ( r, c, p1, p2 );
%
%  Construct V1, the vector from C to P1.
%
  v1(1:2,1) = p1(1:2,1) - c(1:2,1);
%
%  Rotate V1 through THETA / 2.
%
  thetah = theta / 2.0;

  d(1,1) = cos ( thetah ) * v1(1,1) - sin ( thetah ) * v1(2,1);
  d(2,1) = sin ( thetah ) * v1(1,1) + cos ( thetah ) * v1(2,1);
%
%  Scale this vector so it represents the distance to the centroid
%  relative to R.
%
  s = 4.0 * ( sin ( theta / 2.0 ) ) ^ 3 / 3.0 / ( theta - sin ( theta ) );

  d(1,1) = s * d(1,1);
  d(2,1) = s * d(2,1);
%
%  Add the center.
%
  d(1,1) = d(1,1) + c(1,1);
  d(2,1) = d(2,1) + c(2,1);

  return
end
