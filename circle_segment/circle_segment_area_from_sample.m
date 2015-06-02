function [ area, seed ] = circle_segment_area_from_sample ( r, c, p1, p2, ...
  n, seed )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_AREA_FROM_CHORD computes the area of a circle segment.
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
%    Another notably feisty problem, with every line of this function
%    the product of a forehead-slapping frustration followed by a strangled
%    curse that the bogus result is a willful miscalculation on the part
%    of the universe, followed by a reluctant hop back into the trenches
%    to dig away yet further.  The function seems to be working now,
%    for at least one set of input.
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
%    Input, real P1(2,1), P2(2,1), the ends of the chord.
%
%    Input, integer N, the number of sample points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real AREA, the area of the circle segment.
%

%
%  Destroy all row vectors!
%
  c = c(:);
  p1 = p1(:);
  p2 = p2(:);
%
%  Determine the angles of the chord endpoints.
%
  omega1 = atan2 ( p1(2,1) - c(2,1), p1(1,1) - c(1,1) );
  while ( omega1 < 0.0 )
    omega1 = omega1 + 2.0 * pi;
  end

  omega2 = atan2 ( p2(2,1) - c(2,1), p2(1,1) - c(1,1) );
  while ( omega2 < omega1 )
    omega2 = omega2 + 2.0 * pi;
  end
%
%  Get N random points in the circle.
%  To simplify angle measurement, take OMEGA1 as your smallest angle.
%  That way, the check OMEGA1 <= ANGLE <= OMEGA2 will be legitimate.
%
  if ( seed == 0 )
    angle = rand ( n, 1 );
  else
    [ angle, seed ] = r8vec_uniform_01 ( n, seed );
  end
  angle = omega1 + 2.0 * pi * angle;
  if ( seed == 0 )
    r2 = rand ( n, 1 );
  else
    [ r2, seed ] = r8vec_uniform_01 ( n, seed );
  end
  r2 = sqrt ( r2 );
  x = c(1,1) + r2 .* cos ( angle );
  y = c(2,1) + r2 .* sin ( angle );
%
%  Determine the vector that touches the circle segment base.
%
  p(1:2,1) = 0.5 * ( p1(1:2,1) + p2(1:2,1) ) - c(1:2,1);
  rmh = norm ( p );
  if ( pi < omega2 - omega1 )
    p(1:2,1) = - p(1:2,1);
    rmh =  - rmh;
  end
%
%  Normalize P.
%
  p = p / norm ( p );
%
%  Compute the projection of each point onto P.
%
  vdotp(1:n,1) = ( x(1:n,1) - c(1,1) ) * p(1,1) + ( y(1:n,1) - c(2,1) ) * p(2,1);
%
%  Points in the segment lie in the sector, and project at least RMH onto P.
%
  i = find ( omega1 < angle & angle < omega2 & rmh < vdotp );
%
%  Count them.
%
  m = length ( i );
%
%  The area of the segment is its relative share of the circle area.
%
  area = pi * r^2 * m / n;

  return
end
