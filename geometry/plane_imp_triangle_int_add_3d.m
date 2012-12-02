function [ num_int, pint ] = plane_imp_triangle_int_add_3d ( p1, p2, dist1, ...
  dist2, num_int, pint )

%*****************************************************************************80
%
%% PLANE_IMP_TRIANGLE_INT_ADD_3D is a utility for plane/triangle intersections.
%
%  Discussion:
%
%    This routine is called to consider the value of the signed distance
%    from a plane of two nodes of a triangle.  If the two values
%    have opposite signs, then there is a point of intersection between
%    them.  The routine computes this point and adds it to the list.
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
%    Input, real P1(3), P2(3), the coordinates of two vertices 
%    of a triangle.
%
%    Input, real DIST1, DIST2, the signed distances of the 
%    two vertices from a plane.
%
%    Input, integer NUM_INT, the number of intersection points.
%
%    Input, real PINT(3,NUM_INT), the intersection points.
%
%    Output, integer NUM_INT, the updated number of intersection points.
%
%    Output, real PINT(3,NUM_INT), the updated intersection points.
%
  dim_num = 3;

  if ( dist1 == 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = p1(1:dim_num);
  elseif ( dist2 == 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = p2(1:dim_num);
  elseif ( dist1 * dist2 < 0.0 )
    alpha = dist2 / ( dist2 - dist1 );
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = alpha * p1(1:dim_num) + ( 1.0 - alpha ) * p2(1:dim_num);
  end

  return
end
