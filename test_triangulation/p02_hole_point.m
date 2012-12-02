function hole_point = p02_hole_point ( hole_index, m )

%*****************************************************************************80
%
%% P02_HOLE_POINT returns a point inside a given hole in problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer HOLE_INDEX, the index of the hole.
%
%    Input, integer M, the spatial dimension.
%
%    Output, real HOLE_POINT(M), a point in the hole
%
  center = [ 0.0, 0.0 ];
  hole_point(1:2) = center(1:2);

  return
end
