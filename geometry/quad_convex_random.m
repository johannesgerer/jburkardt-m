function [ xy, seed ] = quad_convex_random ( seed )

%*****************************************************************************80
%
%% QUAD_CONVEX_RANDOM returns a random convex quadrilateral.
%
%  Description:
%
%    The quadrilateral is constrained in that the vertices must all lie
%    with the unit square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number
%    generator.
%
%    Output, real XY(2,NODE_NUM), the coordinates of the
%    nodes of the quadrilateral, given in counterclockwise order.
%
%    Output, integer SEED, a seed for the random number
%    generator.
%
  node_num = 4;

  while ( 1 )
%
%  Generate 4 random points.
%
    [ xy_random, seed ] = r8mat_uniform_01 ( 2, node_num, seed );
%
%  Determine the convex hull.
%
    [ hull_num, hull ] = points_hull_2d ( node_num, xy_random );
%
%  If NVAL < NODE_NUM, then our convex hull is a triangle.
%  Try again.
%
    if ( hull_num == node_num )
      break
    end

  end
%
%  Make an ordered copy of the random points.
%
  for j = 1 : node_num
    xy(1:2,j) = xy_random(1:2,hull(j));
  end

  return
end
