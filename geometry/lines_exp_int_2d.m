function [ ival, p ] = lines_exp_int_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_INT_2D determines where two explicit lines intersect in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
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
%    Input, real P1(2,1), P2(2,1), two points on the first line.
%
%    Input, real Q1(2,1), Q2(2,1), two points on the second line.
%
%    Output, integer IVAL, reports on the intersection:
%    0, no intersection, the lines may be parallel or degenerate.
%    1, one intersection point, returned in P.
%    2, infinitely many intersections, the lines are identical.
%
%    Output, real P(2,1), if IVAl = 1, P is
%    the intersection point.  Otherwise, P = 0.
%
  ival = 0;
  p(1:2,1) = 0.0;
%
%  Check whether either line is a point.
%
  if ( p1(1:2,1) == p2(1:2,1) )
    point_1 = 1;
  else
    point_1 = 0;
  end

  if ( q1(1:2,1) == q2(1:2,1) )
    point_2 = 1;
  else
    point_2 = 0;
  end
%
%  Convert the lines to ABC format.
%
  if ( ~point_1 )
    [ a1, b1, c1 ] = line_exp2imp_2d ( p1, p2 );
  end

  if ( ~point_2 )
    [ a2, b2, c2 ] = line_exp2imp_2d ( q1, q2 );
  end
%
%  Search for intersection of the lines.
%
  if ( point_1 & point_2 )
    if ( p1(1:2,1) == q1(1:2,1) )
      ival = 1;
      p(1:2,1) = p1(1:2,1);
    end
  elseif ( point_1 )
    if ( a2 * p1(1,1) + b2 * p1(2,1) == c2 )
      ival = 1;
      p(1:2,1) = p1(1:2,1);
    end
  elseif ( point_2 )
    if ( a1 * q1(1,1) + b1 * q1(2,1) == c1 )
      ival = 1;
      p(1:2,1) = q1(1:2,1);
    end
  else
    [ ival, p ] = lines_imp_int_2d ( a1, b1, c1, a2, b2, c2 );
  end

  return
end
