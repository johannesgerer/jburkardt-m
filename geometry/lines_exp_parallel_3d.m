function value = lines_exp_parallel_3d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_PARALLEL_3D determines if two lines are parallel in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      the line through the points P1 and P2.
%
%    The points P1, P2 define a direction (P2-P1).  Similarly, the
%    points (Q1,Q2) define a direction (Q2-Q1).  The quantity
%
%      (P2-P1) dot (Q2-Q1) = norm(P2-P1) * norm(Q2-Q1) * cos ( angle )
%
%    Therefore, the following value is between 0 and 1;
%
%      abs ( (P2-P1) dot (Q2-Q1) / ( norm(P2-P1) * norm(Q2-Q1) ) )
%
%    and the lines are parallel if
%
%      abs ( (P2-P1) dot (Q2-Q1) / ( norm(P2-P1) * norm(Q2-Q1) ) ) = 1
%
%    We can rephrase this as requiring:
%
%      ( (P2-P1)dot(Q2-Q1) )**2 = (P2-P1)dot(P2-P1) * (Q2-Q1)dot(Q2-Q1)
%
%    which avoids division and square roots.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2006
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
%    Output, logical VALUE is TRUE if the lines are parallel.
%
  dim_num = 3;

  pdotq = ( p2(1:dim_num,1) - p1(1:dim_num,1) )' * ...
          ( q2(1:dim_num,1) - q1(1:dim_num,1) );

  pdotp = ( p2(1:dim_num,1) - p1(1:dim_num,1) )' * ...
          ( p2(1:dim_num,1) - p1(1:dim_num,1) );

  qdotq = ( q2(1:dim_num,1) - q1(1:dim_num,1) )' * ...
          ( q2(1:dim_num,1) - q1(1:dim_num,1) );

  value = ( pdotq * pdotq == pdotp * qdotq );

  return
end
