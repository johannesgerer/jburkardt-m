function boundary_num = triangulation_order6_boundary_edge_count_euler ( ...
  node_num, triangle_num, hole_num, boundary_num )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_BOUNDARY_EDGE_COUNT_EULER counts boundary edges.
%
%  Discussion:
%
%    We assume we are given information about an order 6 triangulation
%    of a set of points in the plane.
%
%    By ignoring the midside nodes, we can determine the corresponding
%    information for an order 3 triangulation, and apply Euler's formula
%    to determine the number of edges that lie on the boundary of the
%    set of points.
%
%    Thus, if we have TRIANGLE_NUM triangles, and NODE_NUM nodes, we
%    imagine that each triangle is replaced by 4 triangles, created
%    by adding the edges created by joining the midside nodes.
%
%    Thus, for 4 * TRIANGLE_NUM triangles, we can apply Euler's formula
%    to compute the number of boundary edges.
%
%    Now, to adjust the data to our order 6 triangles, we divide the
%    number of boundary edges by 2.
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
%  Reference:
%
%    de Berg, Krevald, Overmars and Schwarzkopf,
%    Computational Geometry, Section 9.1,
%    Springer, 2000.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer HOLE_NUM, the number of internal nodes.
%
%    Output, integer BOUNDARY_NUM, the number of edges that lie on the
%    boundary of the triangulation.
%
  boundary_num = ( 2 * node_num + 2 * hole_num - 4 * triangle_num - 2 ) / 2;

  return
end
