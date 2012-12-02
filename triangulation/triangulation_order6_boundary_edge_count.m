function boundary_edge_num = triangulation_order6_boundary_edge_count ( ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_BOUNDARY_COUNT counts the number of boundary edges.
%
%  Discussion:
%
%    This routine is given a triangulation, a set of 6-node triangles.
%    It is assumed that, in each list of 6 nodes, the vertices are listed
%    first, in counterclockwise order, followed by the three midside nodes,
%    in counterclockwise order, starting with the node between vertices
%    1 and 2.
%
%    It is assumed that each edge of the triangulation is either
%    * an INTERIOR edge, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY edge, which will occur only once.
%
%    This routine should work even if the region has holes - as long
%    as the boundary of the hole comprises more than 3 edges!
%
%    Except for the dimension of TRIANGLE, this routine is identical
%    to the routine for the order 3 case.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Output, integer BOUNDARY_EDGE_NUM, the number of boundary edges.
%
  m = 2;
  n = 3 * triangle_num;
%
%  Set up the edge array.
%
  edge(1:2,               1:  triangle_num) = triangle_node(1:2,1:triangle_num);
  edge(1:2,  triangle_num+1:2*triangle_num) = triangle_node(2:3,1:triangle_num);
  edge(1  ,2*triangle_num+1:3*triangle_num) = triangle_node(3,  1:triangle_num);
  edge(2  ,2*triangle_num+1:3*triangle_num) = triangle_node(1,  1:triangle_num);
%
%  In each column, force the smaller entry to appear first.
%
  e1(1:n) = min ( edge(1:2,1:n) );
  e2(1:n) = max ( edge(1:2,1:n) );

  edge(1,1:n) = e1(1:n);
  edge(2,1:n) = e2(1:n);
%
%  Ascending sort the column array.
%
  edge = i4col_sort_a ( m, n, edge );
%
%  Get the number of unique columns in EDGE.
%
  unique_num = i4col_sorted_unique_count ( m, n, edge );

  interior_edge_num = 3 * triangle_num - unique_num;

  boundary_edge_num = 3 * triangle_num - 2 * interior_edge_num;

  return
end
