function [ x, y, seed ] = circle_segment_sample_from_chord ( r, c, p1, p2, ...
  n, seed )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_SAMPLE_FROM_CHORD samples points from a circle segment.
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
%    16 May 2013
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
%    Input, real P1(2,1), P2(2,1), the endpoints of the chord.
%
%    Input, integer N, the number of sample points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(N,1), Y(N,1), the sample points.
%

%
%  Destroy all row vectors!
%
  c = c(:);
  p1 = p1(:);
  p2 = p2(:);
%
%  Determine unit vectors VR and VC.
%  VR points to the center of the chord from the radius.
%  VC points along the chord, from P1 to P2.
%
  vr(1:2,1) = 0.5 * ( p1(1:2,1) + p2(1:2,1) ) - c(1:2,1);
  vr(1:2,1) = vr(1:2,1) / norm ( vr );
  vc(1:2,1) = p2(1:2,1) - p1(1:2,1);
  vc(1:2,1) = vc(1:2,1) / norm ( vc );
%
%  Get the height of the circle segment.
%
  c2 = [ 0.0; 0.0 ];
  h = circle_segment_height_from_chord ( r, c2, p1, p2 );
%
%  Sample (xi,eta) in the reference coordinates, where the chord
%  is horizontal.
%
  [ xi, eta, seed ] = circle_segment_sample_from_height ( r, h, n, seed );
%
%  XI is the left/right coordinate along VC.
%  ETA is the distance along VR.
%
  x(1:n,1) = c(1,1) + eta(1:n,1) * vr(1,1) + xi(1:n,1) * vc(1,1);
  y(1:n,1) = c(2,1) + eta(1:n,1) * vr(2,1) + xi(1:n,1) * vc(2,1);

  return
end

