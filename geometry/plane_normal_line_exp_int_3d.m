function [ ival, pint ] = plane_normal_line_exp_int_3d ( pp, normal, p1, p2 )

%*****************************************************************************80
%
%% PLANE_NORMAL_LINE_EXP_INT_3D: intersection of plane and line in 3D.
%
%  Discussion:
%
%    The normal form of a plane in 3D is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The explicit form of a line in 3D is:
%
%      P1, P2 are two points on the line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PP(3), a point on the plane.
%
%    Input, real NORMAL(3), a normal vector to the plane.
%
%    Input, real P1(3), P2(3), two distinct points on the line.
%
%    Output, integer IVAL, the kind of intersection;
%    0, the line and plane seem to be parallel and separate;
%    1, the line and plane intersect at a single point;
%    2, the line and plane seem to be parallel and joined.
%
%    Output, real PINT(3), the coordinates of a
%    common point of the plane and line, when IVAL is 1 or 2.
%
  dim_num = 3;
%
%  Make sure the line is not degenerate.
%
  if ( line_exp_is_degenerate_nd ( dim_num, p1, p2 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_NORMAL_LINE_EXP_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The line is degenerate.\n' );
    error ( 'PLANE_NORMAL_LINE_EXP_INT_3D - Fatal error!' );
  end
%
%  Make sure the plane normal vector is a unit vector.
%
  temp = sqrt ( sum ( normal(1:dim_num).^2 ) );

  if ( temp == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_NORMAL_LINE_EXP_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The normal vector of the plane is degenerate.\n' );
    error ( 'PLANE_NORMAL_LINE_EXP_INT_3D - Fatal error!' );
  end

  normal(1:dim_num) = normal(1:dim_num) / temp;
%
%  Determine the unit direction vector of the line.
%
  direction(1:dim_num) = p2(1:dim_num) - p1(1:dim_num);
  temp = sqrt ( sum ( direction(1:dim_num).^2 ) );
  direction(1:dim_num) = direction(1:dim_num) / temp;
%
%  If the normal and direction vectors are orthogonal, then
%  we have a special case to deal with.
%
  if ( normal(1:dim_num) * direction(1:dim_num)' == 0.0 )

    temp = normal(1:dim_num) * ( p1(1:dim_num) - pp(1:dim_num) )';

    if ( temp == 0.0 )
      ival = 2;
      pint(1:dim_num) = p1(1:dim_num);
    else
      ival = 0;
      pint(1:dim_num) = Inf;
    end

    return
  end
%
%  Determine the distance along the direction vector to the intersection point.
%
  temp = ( ( pp(1:dim_num) - p1(1:dim_num) ) * normal(1:dim_num)' )...
    /  ( direction(1:dim_num) * normal(1:dim_num)' );

  ival = 1;
  pint(1:dim_num) = p1(1:dim_num) + temp * direction(1:dim_num);

  return
end
