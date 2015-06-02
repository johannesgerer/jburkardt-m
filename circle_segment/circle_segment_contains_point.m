function value = circle_segment_contains_point ( r, c, omega1, omega2, xy )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_CONTAINS_POINT reports whether a point is in a circle segment.
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
%    In this function, we allow the circle to have an arbitrary center C,
%    arbitrary radius R, and we describe the points P1 and P2 by specifying
%    their angles OMEGA1 and OMEGA2.
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
%    Input, real OMEGA1, OMEGA2, the angles of the two points on the
%    circumference of the circle that define the circle segment.
%    OMEGA1 < OMEGA2 <= OMEGA1 + 2 * PI
%
%    Input, real XY(2,1), a point.
%
%    Output, integer VALUE, is TRUE if the point is inside the circle segment.
%
  if ( r <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_SEGMENT_CONTAINS_POINT - Fatal error!\n' );
    fprintf ( 1, '  R <= 0.0.\n' );
    error ( 'CIRCLE_SEGMENT_CONTAINS_POINT - Fatal error!' )
  end

  while ( omega2 < omega1 )
    omega2 = omega2 + 2.0 * pi;
  end
%
%  Destroy all row vectors.
%
  c = c(:);
  xy = xy(:);
%
%  Compute the vector V = XY - C:
%
  v(1:2,1) = xy(1:2,1) - c(1:2,1);
%
%  a: Point must be inside the circle, so ||V|| <= R.
%
  v_r = norm ( v );
  if ( r < v_r )
    value = 0;
    return
  end
%
%  b: Angle made by the vector V must be between OMEGA1 and OMEGA2.
%
  v_omega = atan2 ( v(2), v(1) );

  while ( omega1 <= v_omega + 2.0 * pi )
    v_omega = v_omega - 2.0 * pi;
  end

  while ( v_omega + 2.0 * pi <= omega1 )
    v_omega = v_omega + 2.0 * pi;
  end

  if ( omega2 < v_omega )
    value = 0;
    return
  end
%
%  c: Projection of V onto unit centerline must be at least R-H.
%
  omegah = 0.5 * ( omega1 + omega2 );
  v_project = v(1) * cos ( omegah ) + v(2) * sin ( omegah );

  theta = omega2 - omega1;
  h = circle_segment_height_from_angle ( r, theta );

  if ( v_project < r - h )
    value = 0;
    return
  end

  value = 1;
  
  return
end

