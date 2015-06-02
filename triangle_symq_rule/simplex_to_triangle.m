function t = simplex_to_triangle ( tvert1, tvert2, tvert3, s )

%*****************************************************************************80
%
%% SIMPLEX_TO_TRIANGLE maps points from the simplex to a triangle.
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
%    Input, real S(2), the coordinates of the point in the simplex.
%
%    Output, real T(2), the coordinates of the point in
%    the triangle.
%
  for i = 1 : 2
    t(i) = tvert1(i) * ( 1.0 - s(1) - s(2) ) ...
         + tvert2(i) * s(1) ...
         + tvert3(i) * s(2);
  end

  return
end