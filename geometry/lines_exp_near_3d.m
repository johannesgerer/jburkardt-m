function [ pn, qn ] = lines_exp_near_3d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_NEAR_3D computes nearest points on two explicit lines in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      the line through the points P1 and P2.
%
%    This routine uses a method that is essentially independent of dimension.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2006
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
%    Output, real PN(3,1), QN(3,1), nearest points on the lines.
%
  dim_num = 3;
%
%  Let U = (P2-P1) and V = (Q2-Q1) be the direction vectors on
%  the two lines.
%
  u(1:dim_num,1) = p2(1:dim_num,1) - p1(1:dim_num,1);
  v(1:dim_num,1) = q2(1:dim_num,1) - q1(1:dim_num,1);
%
%  Let SN be the unknown coordinate of the nearest point PN on line 1,
%  so that PN = P(SN) = P1 + SN * (P2-P1).
%
%  Let TN be the unknown coordinate of the nearest point QN on line 2,
%  so that QN = Q(TN) = Q1 + TN * (Q2-Q1).
%
%  Let W0 = (P1-Q1).
%
  w0(1:dim_num,1) = p1(1:dim_num,1) - q1(1:dim_num,1);
%
%  The vector direction WC = P(SN) - Q(TC) is unique (among directions)
%  perpendicular to both U and V, so
%
%    U dot WC = 0
%    V dot WC = 0
%
%  or, equivalently:
%
%    U dot ( P1 + SN * (P2 - P1) - Q1 - TN * (Q2 - Q1) ) = 0
%    V dot ( P1 + SN * (P2 - P1) - Q1 - TN * (Q2 - Q1) ) = 0
%
%  or, equivalently:
%
%    (u dot u ) * sn - (u dot v ) tc = -u * w0
%    (v dot u ) * sn - (v dot v ) tc = -v * w0
%
%  or, equivalently:
%
%   ( a  -b ) * ( sn ) = ( -d )
%   ( b  -c )   ( tc )   ( -e )
%
  a = u * u';
  b = u * v';
  c = v * v';
  d = u * w0';
  e = v * w0';
%
%  Check the determinant.
%
  det = - a * c + b * b;

  if ( det == 0.0 )
    sn = 0.0;
    if ( abs ( b ) < abs ( c ) )
      tn = e / c;
    else
      tn = d / b;
    end
  else
    sn = ( c * d - b * e ) / det;
    tn = ( b * d - a * e ) / det;
  end

  pn(1:dim_num,1) = p1(1:dim_num,1) + sn * ( p2(1:dim_num,1) - p1(1:dim_num,1) );
  qn(1:dim_num,1) = q1(1:dim_num,1) + tn * ( q2(1:dim_num,1) - q1(1:dim_num,1) );

  return
end
