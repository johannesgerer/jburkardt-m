function normal = line_exp_normal_2d ( p1, p2 )

%*****************************************************************************80
%
%% LINE_EXP_NORMAL_2D computes a unit normal vector to a line in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      the line through the points P1 and P2.
%
%    The sign of the normal vector N is chosen so that the normal vector
%    points "to the left" of the direction of the line.
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
%    Input, real P1(2,1), P2(2,1), two points on the line.
%
%    Output, real NORMAL(2,1), a unit normal vector to the line.
%
  norm = sqrt ( ( p2(1,1) - p1(1,1) ).^2 + ( p2(2,1) - p1(2,1) ).^2 );

  if ( norm == 0.0 )
    normal(1:2,1) = sqrt ( 2.0 );
    return
  end

  normal(1,1) = - ( p2(2,1) - p1(2,1) ) / norm;
  normal(2,1) =   ( p2(1,1) - p1(1,1) ) / norm;

  return
end
