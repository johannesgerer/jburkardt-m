function inside = circle_exp_contains_point_2d ( p1, p2, p3, p )

%*****************************************************************************80
%
%5 CIRCLE_EXP_CONTAINS_POINT_2D: explicit circle contains a point in 2D.
%
%  Discussion:
%
%    The explicit form of a circle in 2D is:
%
%      The circle passing through points P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), P3(2,1), the (X,Y) coordinates
%    of three points that lie on a circle.
%
%    Input, real P(2,1), the point to test.
%
%    Output, integer INSIDE, reports the result:
%    -1, the three points are distinct and noncolinear,
%    and (x,y) lies inside the circle.
%    0, the three points are distinct and noncolinear,
%    and (x,y) lies on the circle.
%    1, the three points are distinct and noncolinear,
%    and (x,y) lies outside the circle.
%    2, the three points are distinct and colinear,
%    and (x,y) lies on the line.
%    3, the three points are distinct and colinear,
%    and (x,y) does not lie on the line.
%    4, two points are distinct, and (x,y) lies on the line.
%    5, two points are distinct, and (x,y) does not lie on the line.
%    6, all three points are equal, and (x,y) is equal to them,
%    7, all three points are equal, and (x,y) is not equal to them.
%
  dim_num = 2;
%
%  P1 = P2?
%
  if ( p1(1:dim_num,1) == p2(1:dim_num,1) )

    if ( p1(1:dim_num,1) == p3(1:dim_num,1) )

      if ( p1(1:dim_num,1) == p(1:dim_num,1) )
        inside = 6;
      else
        inside = 7;
      end

    else

      det = ( p1(1,1) - p3(1,1) ) * ( p(2,1)  - p3(2,1) ) ...
          - ( p(1,1)  - p3(1,1) ) * ( p1(2,1) - p3(2,1) );

      if ( det == 0.0 )
        inside = 4;
      else
        inside = 5;
      end
    end

    return

  end
%
%  P1 does not equal P2.  Does P1 = P3?
%
  if ( p1(1:dim_num,1) == p3(1:dim_num,1) )

    det = ( p1(1,1) - p2(1,1) ) * ( p(2,1)  - p2(2,1) ) ...
        - ( p(1,1)  - p2(1,1) ) * ( p1(2,1) - p2(2,1) );

    if ( det == 0.0 )
      inside = 4;
    else
      inside = 5;
    end

    return

  end
%
%  The points are distinct.  Are they colinear?
%
  det = ( p1(1,1) - p2(1,1) ) * ( p3(2,1) - p2(2,1) ) ...
      - ( p3(1,1) - p2(1,1) ) * ( p1(2,1) - p2(2,1) );

  if ( det == 0.0 )

    det = ( p1(1,1) - p2(1,1) ) * ( p(2,1)  - p2(2,1) ) ...
        - ( p(1,1)  - p2(1,1) ) * ( p1(2,1) - p2(2,1) );

    if ( det == 0.0 )
      inside = 2;
    else
      inside = 3;
    end

    return

  end
%
%  The points are distinct and non-colinear.
%
%  Compute the determinant
%
  a(1,1) = p1(1,1);
  a(1,2) = p1(2,1);
  a(1,3) = p1(1,1) * p1(1,1) + p1(2,1) * p1(2,1);
  a(1,4) = 1.0;

  a(2,1) = p2(1,1);
  a(2,2) = p2(2,1);
  a(2,3) = p2(1,1) * p2(1,1) + p2(2,1) * p2(2,1);
  a(2,4) = 1.0;

  a(3,1) = p3(1,1);
  a(3,2) = p3(2,1);
  a(3,3) = p3(1,1) * p3(1,1) + p3(2,1) * p3(2,1);
  a(3,4) = 1.0;

  a(4,1) = p(1,1);
  a(4,2) = p(2,1);
  a(4,3) = p(1,1) * p(1,1) + p(2,1) * p(2,1);
  a(4,4) = 1.0;

  det = r8mat_det_4d ( a );

  if ( det < 0.0 )
    inside = 1;
  elseif ( det == 0.0 )
    inside = 0;
  else
    inside = -1;
  end

  return
end
