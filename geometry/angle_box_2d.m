function [ p4, p5 ] = angle_box_2d ( dist, p1, p2, p3 )

%*****************************************************************************80
%
%% ANGLE_BOX_2D "boxes" an angle defined by three points in 2D.
%
%  Discussion:
%
%    The routine is given points P1, P2 and P3, determining the two lines:
%      P1 to P2
%    and
%      P2 to P3
%    and a nonnegative distance
%      DIST.
%
%    The routine returns a pair of "corner" points
%      P4 and P5
%    both of which are a distance DIST from both lines, and in fact,
%    both of which are a distance DIST from P2.
%
%                         /  P3
%                        /   /   /
%     - - - - - - - - -P4 - / -P6 - - -
%                      /   /   /
%    P1---------------/--P2-----------------
%                    /   /   /
%     - - - - - - -P7 - / -P5 - - - - -
%                  /   /   /
%
%    In the illustration, P1, P2 and P3 are the points defining the lines.
%
%    P4 and P5 represent the desired "corner points", which
%    are on the positive or negative sides of both lines.
%
%    P6 and P7 represent the undesired points, which
%    are on the positive side of one line and the negative of the other.
%
%    Special cases:
%
%    if P1 = P2, this is the same as extending the line from
%    P3 through P2 without a bend.
%
%    if P3 = P2, this is the same as extending the line from
%    P1 through P2 without a bend.
%
%    if P1 = P2 = P3 this is an error.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DIST, the nonnegative distance from P1
%    to the computed points P4 and P5.
%
%    Input, real P1(2), P2(2), P3(2).
%    P1 and P2 are distinct points that define a line.
%    P2 and P3 are distinct points that define a line.
%
%    Output, real P4(2), P5(2), points which lie DIST units from
%    the line between P1 and P2, and from the line between P2 and P3.
%
  dim_num = 2;
%
%  If DIST = 0, assume the user knows best.
%
  if ( dist == 0.0 )
    p4(1:dim_num) = p2(1:dim_num);
    p5(1:dim_num) = p2(1:dim_num);
    return
  end
%
%  Fail if all three points are equal.
%
  if ( p1(1:dim_num) == p2(1:dim_num) & p2(1:dim_num) == p3(1:dim_num) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ANGLE_BOX_2D - Fatal error!\n' );
    fprintf ( 1, '  Input points P1 = P2 = P3.\n' );
    r8vec_print ( dim_num, p1, '  P1 = ' );
    error ( 'ANGLE_BOX_2D - Fatal error!' );
  end
%
%  If P1 = P2, extend the line through the doubled point.
%
  if ( p1(1:dim_num) == p2(1:dim_num) )
    u2(1) = p3(2) - p2(2);
    u2(2) = p2(1) - p3(1);
    temp = sqrt ( sum ( u2(1:dim_num).^2 ) );
    u2(1:dim_num) = u2(1:dim_num) / temp;
    p4(1:dim_num) = p2(1:dim_num) + dist * u2(1:dim_num);
    p5(1:dim_num) = p2(1:dim_num) - dist * u2(1:dim_num);
    return
  end
%
%  If P2 = P3, extend the line through the doubled point.
%
  if ( p2(1:dim_num) == p3(1:dim_num) )
    u1(1) = p1(2) - p2(2);
    u1(2) = p2(1) - p1(1);
    temp = sqrt ( sum ( u1(1:dim_num).^2 ) );
    u1(1:dim_num) = u1(1:dim_num) / temp;
    p4(1:dim_num) = p2(1:dim_num) + dist * u1(1:dim_num);
    p5(1:dim_num) = p2(1:dim_num) - dist * u1(1:dim_num);
    return
  end
%
%  Now compute the unit normal vectors to each line.
%  We choose the sign so that the unit normal to line 1 has
%  a positive dot product with line 2.
%
  u1(1) = p1(2) - p2(2);
  u1(2) = p2(1) - p1(1);
  temp = sqrt ( sum ( u1(1:dim_num).^2 ) );
  u1(1:dim_num) = u1(1:dim_num) / temp;

  if ( u1(1:dim_num) * ( p3(1:dim_num) - p2(1:dim_num) )' < 0.0 )
    u1(1:dim_num) = -u1(1:dim_num);
  end

  u2(1) = p3(2) - p2(2);
  u2(2) = p2(1) - p3(1);
  temp = sqrt ( sum ( u2(1:dim_num).^2 ) );
  u2(1:dim_num) = u2(1:dim_num) / temp;

  if ( u2(1:dim_num) * ( p1(1:dim_num) - p2(1:dim_num) )' < 0.0 )
    u2(1:dim_num) = -u2(1:dim_num);
  end
%
%  Try to catch the case where we can't determine the
%  sign of U1, because both U1 and -U1 are perpendicular
%  to (P3-P2)...and similarly for U2 and (P1-P2).
%
  if ( u1(1:dim_num) * ( p3(1:dim_num) - p2(1:dim_num) )' == 0.0 | ...
       u2(1:dim_num) * ( p1(1:dim_num) - p2(1:dim_num) )' == 0.0 )

    if ( u1(1:dim_num) * u2(1:dim_num)' < 0.0 )
      u1(1:dim_num) = -u1(1:dim_num);
    end

  end
%
%  Try to catch a line turning back on itself, evidenced by
%    Cos(theta) = (P3-P2) dot (P2-P1) / ( norm(P3-P2) * norm(P2-P1) )
%  being -1, or very close to -1.
%
  temp = ( p3(1:dim_num) - p2(1:dim_num) ) * ( p2(1:dim_num) - p1(1:dim_num) )';

  temp = temp / ...
        ( sqrt ( sum ( p3(1:dim_num) - p2(1:dim_num) ).^2 ) ...
        * sqrt ( sum ( p2(1:dim_num) - p1(1:dim_num) ).^2 ) );

  if ( temp < -0.99 )
    temp = sqrt ( sum ( ( p2(1:dim_num) - p1(1:dim_num) ).^2 ) );
    p4(1:dim_num) = p2(1:dim_num) + dist * ( p2(1:dim_num) - p1(1:dim_num) ) ...
      / temp + dist * u1(1:dim_num);
    p5(1:dim_num) = p2(1:dim_num) + dist * ( p2(1:dim_num) - p1(1:dim_num) ) ...
      / temp - dist * u1(1:dim_num);
    return
  end
%
%  Compute the "average" unit normal vector.
%
%  The average of the unit normals could be zero, but only when
%  the second line has the same direction and opposite sense
%  of the first, and we've already checked for that case.
%
%  Well, check again!  This problem "bit" me in the case where
%  P1 = P2, which I now treat specially just to guarantee I
%  avoid this problem!
%
  if ( u1(1:dim_num) * u2(1:dim_num)' < 0.0 ) 
    u2(1:dim_num) = -u2(1:dim_num);
  end

  u(1:dim_num) = 0.5 * ( u1(1:dim_num) + u2(1:dim_num) );
  temp = sqrt ( sum ( u(1:dim_num).^2 ) );
  u(1:dim_num) = u(1:dim_num) / temp;
%
%  You must go DIST/STHETA units along this unit normal to
%  result in a distance DIST from line1 (and line2).
%
  stheta = u(1:dim_num) * u1(1:dim_num)';

  p4(1:dim_num) = p2(1:dim_num) + dist * u(1:dim_num) / stheta;
  p5(1:dim_num) = p2(1:dim_num) - dist * u(1:dim_num) / stheta;

  return
end
