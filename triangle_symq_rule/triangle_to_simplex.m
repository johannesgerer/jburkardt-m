function s = triangle_to_simplex ( tvert1, tvert2, tvert3, t )

%*****************************************************************************80
%
%% TRIANGLE_TO_SIMPLEX maps points from any triangle to the simplex.
%
%  Discussion:
%
%    The simplex has vertices:
%
%      (  0, 0 )
%      (  1, 0 )
%      (  0, 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TVERT1(2), TVERT2(2), TVERT3(2), the coordinates
%    of the vertices of the triangle.  These vertices will be taken
%    to be the images of (0,0), (1,0) and (0,1) respectively.
%
%    Input, real T(2), the coordinates of a point in the triangle.
%
%    Output, real Q(2), the coordinates of the
%    point in the simplex.
%
  s(1) = ( ( tvert3(2) - tvert1(2) ) * ( t(1)      - tvert1(1) ) ...
         - ( tvert3(1) - tvert1(1) ) * ( t(2)      - tvert1(2) ) ) ...
       / ( ( tvert3(2) - tvert1(2) ) * ( tvert2(1) - tvert1(1) ) ...
         - ( tvert3(1) - tvert1(1) ) * ( tvert2(2) - tvert1(2) ) );

  s(2) = ( ( tvert2(1) - tvert1(1) ) * ( t(2)      - tvert1(2) ) ...
         - ( tvert2(2) - tvert1(2) ) * ( t(1)      - tvert1(1) ) ) ...
       / ( ( tvert3(2) - tvert1(2) ) * ( tvert2(1) - tvert1(1) ) ...
         - ( tvert3(1) - tvert1(1) ) * ( tvert2(2) - tvert1(2) ) );

  return
end
