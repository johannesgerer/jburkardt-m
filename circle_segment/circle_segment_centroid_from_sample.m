function [ d, seed ] = circle_segment_centroid_from_sample ( r, c, p1, p2, ...
  n, seed )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_CENTROID_FROM_CHORD estimates a circle segment centroid.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 May 2013
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
%    Input, real P1(2,1), P2(2,1), the ends of the chord.
%
%    Input, integer N, the number of sample points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real D(2,1), the estimated centroid of the circle segment.
%
  [ x, y, seed ] = circle_segment_sample_from_chord ( r, c, p1, p2, n, seed );

  d(1) = sum ( x(1:n,1) ) / n;
  d(2) = sum ( y(1:n,1) ) / n;

  return
end
