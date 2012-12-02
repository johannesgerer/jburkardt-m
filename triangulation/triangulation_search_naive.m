function triangle_index = triangulation_search_naive ( node_num, ...
  node_xy, triangle_order, triangle_num, triangle_node, p )

%*****************************************************************************80
%
%% TRIANGULATION_SEARCH_NAIVE searches a triangulation for a point.
%
%  Purpose:
%
%    The algorithm simply checks each triangle to see if point P is
%    contained in it.  Surprisingly, this is not the fastest way to
%    do the check, at least if the triangulation is Delaunay.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the vertices.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), 
%    the nodes that make up each triangle.
%
%    Input, real P(2), the coordinates of a point.
%
%    Output, integer TRIANGLE_INDEX, the index of the triangle 
%    containing the point, or -1 if no triangle was found containing the point.
%
  triangle_index = -1;

  for triangle = 1 : triangle_num
%
%  Get the vertices of triangle TRIANGLE.
%
    a = triangle_node(1,triangle);
    b = triangle_node(2,triangle);
    c = triangle_node(3,triangle);
%
%  Using vertex C as a base, compute the distances to vertices A and B,
%  and the point P.
%
    dxa = node_xy(1,a) - node_xy(1,c);
    dya = node_xy(2,a) - node_xy(2,c);

    dxb = node_xy(1,b) - node_xy(1,c);
    dyb = node_xy(2,b) - node_xy(2,c);

    dxp = p(1)         - node_xy(1,c);
    dyp = p(2)         - node_xy(2,c);

    det = dxa * dyb - dya * dxb;
%
%  Compute the barycentric coordinates of the point P with respect
%  to this triangle.
%
    alpha = ( dxp * dyb - dyp * dxb ) / det;
    beta =  ( dxa * dyp - dya * dxp ) / det;
    gamma = 1.0 - alpha - beta;
%
%  If the barycentric coordinates are all positive, then the point
%  is inside the triangle and we're done.
%
    if ( 0.0 <= alpha & 0.0 <= beta & 0.0 <= gamma )
      triangle_index = triangle;
      return
    end

  end

  return
end
