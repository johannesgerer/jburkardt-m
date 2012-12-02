function angle = lines_exp_angle_3d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_ANGLE_3D finds the angle between two explicit lines in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      ( P1, P2 ) = ( (X1,Y1,Z1), (X2,Y2,Z3) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
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
%    Output, real ANGLE, the angle in radians between the two
%    lines.  The angle is computed using the ACOS function, and so lies between
%    0 and PI.  But if one of the lines is degenerate, the angle is
%    returned as -1.0.
%
  dim_num = 3;

  pnorm = sqrt ( sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) );

  if ( pnorm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINES_EXP_ANGLE_3D - Fatal error!\n' );
    fprintf ( 1, '  The line (P1,P2) is degenerate!\n' );
    angle = -1.0;
    return
  end

  qnorm = sqrt ( sum ( ( q2(1:dim_num,1) - q1(1:dim_num,1) ).^2 ) );

  if ( qnorm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINES_EXP_ANGLE_3D - Fatal error!\n' );
    fprintf ( 1, '  The line (Q1,Q2) is degenerate!\n' );
    angle = -1.0;
    return
  end

  pdotq = ( p2(1:dim_num,1) - p1(1:dim_num,1) )' ...
        * ( q2(1:dim_num,1) - q1(1:dim_num,1) );

  ctheta = pdotq / ( pnorm * qnorm );

  angle = r8_acos ( ctheta );

  return
end
