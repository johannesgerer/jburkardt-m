function [ num_int, p ] = circles_imp_int_2d ( r1, center1, r2, center2 )

%*****************************************************************************80
%
%% CIRCLES_IMP_INT_2D: finds the intersection of two implicit circles in 2D.
%
%  Discussion:
%
%    Two circles can intersect in 0, 1, 2 or infinitely many points.
%
%    The 0 and 2 intersection cases are numerically robust; the 1 and
%    infinite intersection cases are numerically fragile.  The routine
%    uses a tolerance to try to detect the 1 and infinite cases.
%
%    An implicit circle in 2D satisfies the equation:
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 = R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, the radius of the first circle.
%
%    Input, real CENTER1(2,1), the center of the first circle.
%
%    Input, real R2, the radius of the second circle.
%
%    Input, real CENTER2(2,1), the center of the second circle.
%
%    Output, integer NUM_INT, the number of intersecting points found.
%    NUM_INT will be 0, 1, 2 or 3.  3 indicates that there are an infinite
%    number of intersection points.
%
%    Output, real P(2,2), if NUM_INT is 1 or 2,
%    the coordinates of the intersecting points.
%
  dim_num = 2;

  tol = eps;

  p(1:dim_num,1:2) = 0.0;;
%
%  Take care of the case in which the circles have the same center.
%
  t1 = ( abs ( center1(1,1) - center2(1,1) ) ...
       + abs ( center1(2,1) - center2(2,1) ) ) / 2.0;

  t2 = ( abs ( center1(1,1) ) + abs ( center2(1,1) ) ...
       + abs ( center1(2,1) ) + abs ( center2(2,1) ) + 1.0 ) / 5.0;

  if ( t1 <= tol * t2 )

    t1 = abs ( r1 - r2 );
    t2 = ( abs ( r1 ) + abs ( r2 ) + 1.0 ) / 3.0;

    if ( t1 <= tol * t2 )
      num_int = 3;
    else
      num_int = 0;
    end

    return

  end

  distsq = sum ( ( center1(1:2,1) - center2(1:2,1) ).^2 );

  root = 2.0 * ( r1 * r1 + r2 * r2 ) * distsq - distsq * distsq ...
    - ( r1 - r2 ) * ( r1 - r2 ) * ( r1 + r2 ) * ( r1 + r2 );

  if ( root < -tol )
    num_int = 0;
    return
  end

  sc1 = ( distsq - ( r2 * r2 - r1 * r1 ) ) / distsq;

  if ( root < tol )
    num_int = 1;
    p(1:dim_num,1) = center1(1:dim_num,1) ...
      + 0.5 * sc1 * ( center2(1:dim_num,1) - center1(1:dim_num,1) );
    return
  end

  sc2 = sqrt ( root ) / distsq;

  num_int = 2;

  p(1,1) = center1(1,1) + 0.5 * sc1 * ( center2(1,1) - center1(1,1) ) ...
                        - 0.5 * sc2 * ( center2(2,1) - center1(2,1) );
  p(2,1) = center1(2,1) + 0.5 * sc1 * ( center2(2,1) - center1(2,1) ) ...
                        + 0.5 * sc2 * ( center2(1,1) - center1(1,1) );

  p(1,2) = center1(1,1) + 0.5 * sc1 * ( center2(1,1) - center1(1,1) ) ...
                        + 0.5 * sc2 * ( center2(2,1) - center1(2,1) );
  p(2,2) = center1(2,1) + 0.5 * sc1 * ( center2(2,1) - center1(2,1) ) ...
                        - 0.5 * sc2 * ( center2(1,1) - center1(1,1) );

  return
end
