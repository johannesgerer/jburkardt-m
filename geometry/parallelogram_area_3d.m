function area = parallelogram_area_3d ( p )

%*****************************************************************************80
%
%% PARALLELOGRAM_AREA_3D computes the area of a parallelogram in 3D.
%
%  Discussion:
%
%    A parallelogram is a polygon having four sides, with the property
%    that each pair of opposite sides is paralell.
%
%    A parallelogram in 3D must have the property that it is "really"
%    a 2D object, that is, that the four vertices that define it lie
%    in some plane.
%
%    Given the first three vertices of the parallelogram (in 2D or 3D),
%    P1, P2, and P3, the fourth vertex must satisfy
%
%      P4 = P1 + ( P3 - P2 )
%
%    This routine uses the fact that the norm of the cross product
%    of two vectors is the area of the parallelogram they form:
%
%      Area = ( P3 - P2 ) x ( P1 - P2 ).
%
%        P4<-----P3
%        /       /
%       /       /
%      P1----->P2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(3,4), the parallelogram vertices,
%    given in counterclockwise order.  The fourth vertex is ignored.
%
%    Output, real AREA, the area
%

%
%  Compute the cross product vector.
%
  cross(1) = ( p(2,2) - p(2,1) ) * ( p(3,3) - p(3,1) ) ...
           - ( p(3,2) - p(3,1) ) * ( p(2,3) - p(2,1) );

  cross(2) = ( p(3,2) - p(3,1) ) * ( p(1,3) - p(1,1) ) ...
           - ( p(1,2) - p(1,1) ) * ( p(3,3) - p(3,1) );

  cross(3) = ( p(1,2) - p(1,1) ) * ( p(2,3) - p(2,1) ) ....
           - ( p(2,2) - p(2,1) ) * ( p(1,3) - p(1,1) );

  area = sqrt ( sum ( cross(1:3).^2 ) );

  return
end
