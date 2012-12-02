function [ vertex_num, midside_num ] = triangulation_order6_vertex_count ( ...
  node_num, tri_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_VERTEX_COUNT counts the vertex nodes in a triangulation.
%
%  Discussion:
%
%    In a triangulation of order 6, some nodes are midside nodes and some
%    nodes are vertex nodes.
%
%    Especially when an order 6 triangulation is used to handle the
%    Navier Stokes equations, it is useful to know the number of
%    vertex and midside nodes.
%
%  Diagram:
%
%       3
%    s  |\
%    i  | \
%    d  |  \
%    e  6   5  side 2
%       |    \
%    3  |     \
%       |      \
%       1---4---2
%
%         side 1
%
%    The local node numbering.  Local nodes 1, 2 and 3 are "vertex nodes",
%    while nodes 4, 5 and 6 are "midside nodes".
%
%
%   21-22-23-24-25
%    |\    |\    |
%    | \   | \   |
%   16 17 18 19 20
%    |   \ |   \ |
%    |    \|    \|
%   11-12-13-14-15
%    |\    |\    |
%    | \   | \   |
%    6  7  8  9 10
%    |   \ |   \ |
%    |    \|    \|
%    1--2--3--4--5
%
%    A sample grid, which contains 9 vertex nodes and 16 midside nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRI_NUM), lists the nodes that
%    make up each triangle.  The first three nodes are the vertices,
%    in counterclockwise order.  The fourth value is the midside
%    node between nodes 1 and 2; the fifth and sixth values are
%    the other midside nodes in the logical order.
%
%    Output, integer VERTEX_NUM, the number of nodes which are vertices.
%
%    Output, integer MIDSIDE_NUM, the number of nodes which are midsides.
%    This value is inferred from NODE_NUM - VERTEX_NUM, so the value
%    of NODE_NUM needs to be correct on input!
%
  vertices(          1:  tri_num) = triangle_node(1,1:tri_num);
  vertices(  tri_num+1:2*tri_num) = triangle_node(2,1:tri_num);
  vertices(2*tri_num+1:3*tri_num) = triangle_node(3,1:tri_num);

  vertices = i4vec_sort_heap_a ( 3*tri_num, vertices );

  vertex_num = i4vec_sorted_unique ( 3*tri_num, vertices );

  midside_num = node_num - vertex_num;

  return
end
