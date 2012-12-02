function dist = lines_exp_dist_3d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_DIST_3D computes the distance between two explicit lines in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      the line through the points P1, P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), two points on the first line.
%
%    Input, real Q1(3,1), Q2(3,1), two points on the second line.
%
%    Output, real DIST, the distance between the lines.
%
  dim_num = 3;
%
%  The distance is found by computing the volume of a parallelipiped,
%  and dividing by the area of its base.
%
%  But if the lines are parallel, we compute the distance by
%  finding the distance between the first line and any point
%  on the second line.
%
  a11 = q1(1,1) - p1(1,1);
  a12 = q1(2,1) - p1(2,1);
  a13 = q1(3,1) - p1(3,1);

  a21 = p2(1,1) - p1(1,1);
  a22 = p2(2,1) - p1(2,1);
  a23 = p2(3,1) - p1(3,1);

  a31 = q2(1,1) - q1(1,1);
  a32 = q2(2,1) - q1(2,1);
  a33 = q2(3,1) - q1(3,1);
%
%  Compute the cross product.
%
  cr1 = a22 * a33 - a23 * a32;
  cr2 = a23 * a31 - a21 * a33;
  cr3 = a21 * a32 - a22 * a31;

  bot = sqrt ( cr1 * cr1 + cr2 * cr2 + cr3 * cr3 );

  if ( bot == 0.0 )

    dist = line_exp_point_dist_3d ( p1, p2, q1 );

  else

    top = abs (   a11 * ( a22 * a33 - a23 * a32 ) ...
                - a12 * ( a21 * a33 - a23 * a31 ) ...
                + a13 * ( a21 * a32 - a22 * a31 ) );

    dist = top / bot;

  end

  return
end
