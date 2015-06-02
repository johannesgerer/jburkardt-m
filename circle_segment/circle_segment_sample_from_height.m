function [ x, y, seed ] = circle_segment_sample_from_height ( r, h, n, seed )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_SAMPLE_FROM_HEIGHT samples points from a circle segment.
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
%    Input, real H, the height of the circle segment.
%    0 <= H <= 2 * R.
%
%    Input, integer N, the number of sample points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(N,1), Y(N,1), the sample points.
%
  area = circle_segment_area_from_height ( r, h );
%
%  Pick CDF's randomly.
%
  if ( seed == 0 )
    u = rand ( n, 1 );
  else
    [ u, seed ] = r8vec_uniform_01 ( n, seed );
  end
%
%  Choose points randomly by choosing ordered areas randomly.
%
  area2(1:n,1) = u(1:n,1) * area;
%
%  Each area corresponds to a height H2.  Find it.
%
  h2 = zeros ( n, 1 );
  for i = 1 : n
    h2(i,1) = circle_segment_height_from_area ( r, area2(i,1) );
  end
%
%  Determine the half-width WH of the segment for each H2.
%
  wh(1:n,1) = sqrt ( h2(1:n,1) .* ( 2.0 * r - h2(1:n,1) ) );
%
%  Choose an X position randomly in [-WH,+WH].
%
  if ( seed == 0 )
    u = rand ( n, 1 );
  else
    [ u, seed ] = r8vec_uniform_01 ( n, seed );
  end

  x(1:n,1) = ( 2.0 * u(1:n,1) - 1.0 ) .* wh(1:n,1);
%
%  Our circle center is at (0,0).  Our height of H2 is subtracted
%  from the height R at the peak of the circle.  Determine the Y
%  coordinate using this fact.
% 
  y(1:n,1) = r - h2(1:n,1);

  return
end

