function value = lines_exp_parallel_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_PARALLEL_2D determines if two lines are parallel in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      the line through the points P1, P2.
%
%    The test is essentially a comparison of slopes, but should be
%    more accurate than an explicit slope comparison, and unfazed
%    by degenerate cases.
%
%    On the other hand, there is NO tolerance for error.  If the
%    slopes differ by a single digit in the last place, then the
%    lines are judged to be nonparallel.  A more robust test would
%    be to compute the angle between the lines, because then it makes
%    sense to say the lines are "almost" parallel: the angle is small.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2005
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
%    Output, logical VALUE is TRUE if the lines are parallel.
%
  value = ...
  ( ...
    ( p2(1,1) - p1(1,1) ) * ( q2(2,1) - q1(2,1) ) ==
    ( q2(1,1) - q1(1,1) ) * ( p2(2,1) - p1(2,1) ) ...
  );

  return
end
