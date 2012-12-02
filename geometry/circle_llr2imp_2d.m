function pc = circle_llr2imp_2d ( p1, p2, q1, q2, r )

%*****************************************************************************80
%
%% CIRCLE_LLR2IMP_2D converts a circle from LLR to implicit form in 2D.
%
%  Discussion:
%
%    The LLR form of a circle in 2D is:
%
%      The circle of radius R tangent to the lines L1 and L2.
%
%    The implicit form of a circle in 2D is:
%
%      ( P(1) - PC(1) )**2 + ( P(2) - PC(2) )**2 = R**2
%
%    Let S be the scaled distance of a point on L1 from P1 to P2,
%    and let N1 be a unit normal vector to L1.  Then a point P that is
%    R units from L1 satisfies:
%
%      P = P1 + s * ( P2 - P1 ) + R * N1.
%
%    Let t be the scaled distance of a point on L2 from Q1 to Q2,
%    and let N2 be a unit normal vector to L2.  Then a point Q that is
%    R units from L2 satisfies:
%
%      Q = Q1 + t * ( Q2 - Q1 ) + R * N2.
%
%    For the center of the circle, then, we have P = Q, that is
%
%      ( P2 - P1 ) * s + ( Q2 - Q1 ) * t = - P1 - Q1 - R * ( N1 + N2 )
%
%    This is a linear system for ( s and t ) from which we can compute
%    the points of tangency, and the center.
%
%    Note that we have four choices for the circle based on the use
%    of plus or minus N1 and plus or minus N2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two points on line 1.
%
%    Input, real Q1(2,1), Q2(2,1), two points on line 2.
%
%    Input, real R, the radius of the circle.
%
%    Output, real PC(2,4), the centers of the circles.
%

%
%  Compute the normals N1 and N2.
%
  n1 = line_exp_normal_2d ( p1, p2 );

  n2 = line_exp_normal_2d ( q1, q2 );
%
%  Set the linear system.
%
  a(1:2,1,1) =  p2(1:2,1) - p1(1:2,1);
  a(1:2,2,1) = -q2(1:2,1) + q1(1:2,1);
%
%  Solve the 4 linear systems, using every combination of
%  signs on the normal vectors.
%
  b(1:2,1) = - p1(1:2,1) + q1(1:2,1) + r * n1(1:2,1) + r * n2(1:2,1);

  [ det, x(1:2,1) ] = r8mat_solve_2d ( a, b );

  pc(1:2,1) = p1(1:2,1) + ( p2(1:2,1) - p1(1:2,1) ) * x(1,1) - r * n1(1:2,1);

  b(1:2,1) = - p1(1:2,1) + q1(1:2,1) + r * n1(1:2,1) - r * n2(1:2,1);

  [ det, x(1:2,1) ] = r8mat_solve_2d ( a, b );

  pc(1:2,2) = p1(1:2,1) + ( p2(1:2,1) - p1(1:2,1) ) * x(1,1) - r * n1(1:2,1);

  b(1:2,1) = - p1(1:2,1) + q1(1:2,1) - r * n1(1:2,1) + r * n2(1:2,1);

  [ det, x(1:2,1) ] = r8mat_solve_2d ( a, b );

  pc(1:2,3) = p1(1:2,1) + ( p2(1:2,1) - p1(1:2,1) ) * x(1,1) + r * n1(1:2,1);

  b(1:2,1) = - p1(1:2,1) + q1(1:2,1) - r * n1(1:2,1) - r * n2(1:2,1);

  [ det, x(1:2,1) ] = r8mat_solve_2d ( a, b );

  pc(1:2,4) = p1(1:2,1) + ( p2(1:2,1) - p1(1:2,1) ) * x(1,1) + r * n1(1:2,1);

  return
end
