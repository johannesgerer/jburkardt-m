function angle = lines_exp_angle_nd ( dim_num, p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_ANGLE_ND returns the angle between two explicit lines in ND.
%
%  Discussion:
%
%    The explicit form of a line in ND is:
%
%      ( P1(1:DIM_NUM), P2(1:DIM_NUM) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real P1(DIM_NUM,1), P2(DIM_NUM,1), two points on the first line.
%
%    Input, real Q1(DIM_NUM,1), Q2(DIM_NUM,1), two points on the second line.
%
%    Output, real ANGLE, the angle in radians between the two
%    lines.  The angle is computed using the ACOS function, and so lies
%    between 0 and PI.  But if one of the lines is degenerate, the angle
%    is returned as -1.0.
%
  pnorm = sqrt ( sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) );
  qnorm = sqrt ( sum ( ( q2(1:dim_num,1) - q1(1:dim_num,1) ).^2 ) );

  pdotq = ( p2(1:dim_num,1) - p1(1:dim_num,1) )' ...
        * ( q2(1:dim_num,1) - q1(1:dim_num,1) );

  if ( pnorm == 0.0 | qnorm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINES_EXP_ANGLE_ND - Fatal error!\n' );
    fprintf ( 1, '  One of the lines is degenerate!\n' );
    angle = -1.0;
  else
    ctheta = pdotq / ( pnorm * qnorm );
    angle = r8_acos ( ctheta );
  end

  return
end
