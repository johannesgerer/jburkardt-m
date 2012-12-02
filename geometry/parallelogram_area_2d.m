function area = parallelogram_area_2d ( p )

%*****************************************************************************80
%
%% PARALLELOGRAM_AREA_2D computes the area of a parallelogram in 2D.
%
%  Discussion:
%
%    A parallelogram is a polygon having four sides, with the property
%    that each pair of opposite sides is paralell.
%
%    Given the first three vertices of the parallelogram,
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
%    Input, real P(2,4), the parallelogram vertices,
%    given in counterclockwise order.  The fourth vertex is ignored.
%
%    Output, real AREA, the (signed) area.
%

%
%  Compute the cross product vector, which only has a single
%  nonzero component.
%
  area = ( p(1,2) - p(1,1) ) * ( p(2,3) - p(2,1) ) ...
       - ( p(2,2) - p(2,1) ) * ( p(1,3) - p(1,1) );

  return
end
