function boundary_edge_num = boundary_edge_count_q4_mesh ( element_num, ...
  element_node )

%*****************************************************************************80
%
%% BOUNDARY_EDGE_COUNT_Q4_MESH counts the boundary edges.
%
%  Discussion:
%
%    This routine is given a Q4 mesh, an abstract list of sets of 4 nodes.
%    It is assumed that the nodes in each Q4 are listed
%    in a counterclockwise order, although the routine should work
%    if the nodes are consistently listed in a clockwise order as well.
%
%    It is assumed that each edge of the mesh is either
%    * an INTERIOR edge, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY edge, which will occur only once.
%
%    This routine should work even if the region has holes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), the nodes
%    that make up the elements.  These should be listed in counterclockwise
%    order.
%
%    Output, integer BOUNDARY_EDGE_NUM, the number of boundary
%    edges.
%
  m = 2;
  n = 4 * element_num;
%
%  Set up the edge array.
%
  edge(1:2,              1:  element_num) = element_node(1:2,1:element_num);
  edge(1:2,  element_num+1:2*element_num) = element_node(2:3,1:element_num);
  edge(1:2,2*element_num+1:3*element_num) = element_node(3:4,1:element_num);

  edge(1  ,3*element_num+1:4*element_num) = element_node(4,  1:element_num);
  edge(2  ,3*element_num+1:4*element_num) = element_node(1,  1:element_num);
%
%  In each column, force the smaller entry to appear first.
%
  e1(1,1:n) = min ( edge(1:2,1:n) );
  e2(1,1:n) = max ( edge(1:2,1:n) );

  edge(1,1:n) = e1(1,1:n);
  edge(2,1:n) = e2(1,1:n);
%
%  Ascending sort the column array.
%
  edge = i4col_sort_a ( m, n, edge );
%
%  Get the number of unique columns in EDGE.
%
  unique_num = i4col_sorted_unique_count ( m, n, edge );

  interior_edge_num = 4 * element_num - unique_num;

  boundary_edge_num = 4 * element_num - 2 * interior_edge_num;

  return
end
