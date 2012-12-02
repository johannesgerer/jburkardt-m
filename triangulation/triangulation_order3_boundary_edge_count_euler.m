function boundary_num = triangulation_order3_boundary_edge_count_euler ( ...
  node_num, triangle_num, hole_num )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_BOUNDARY_EDGE_COUNT_EULER returns the number of boundary edges.
%
%  Discussion:
%
%    We assume we are given information about a triangulation
%    of a set of points in the plane.
%
%    Given the number of nodes, triangles and holes, we are going to apply
%    Euler's formula to determine the number of edges that lie on the
%    boundary of the set of points.
%
%    The number of faces, including the infinite face and internal holes, 
%    is TRIANGLE_NUM + HOLE_NUM + 1.
%
%    Let BOUNDARY_NUM denote the number of edges on the boundary.
%    Each of the TRIANGLE_NUM triangles uses three edges.  Every edge
%    occurs in two different faces, so the number of edges must be
%    ( 3 * TRIANGLE_NUM + BOUNDARY_NUM ) / 2.
%
%    The number of points used in the triangulation is NODE_NUM.
%
%    Euler's formula asserts that, for a simple connected figure in the
%    plane with no edge crossings, NODE_NUM points, EDGE_NUM edges and
%    FACE_NUM faces:
%
%      NODE_NUM - EDGE_NUM + FACE_NUM = 2
%
%    In our context, this becomes
%
%      NODE_NUM - ( 3 * TRIANGLE_NUM + BOUNDARY_NUM ) / 2 
%      + TRIANGLE_NUM + HOLE_NUM + 1 = 2
%
%    or
%
%      BOUNDARY_NUM = 2 * NODE_NUM + 2 * HOLE_NUM - TRIANGLE_NUM - 2
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
%    Input, integer HOLE_NUM, the number of holes.
%
%    Output, integer BOUNDARY_NUM, the number of edges that lie on the convex
%    hull of the triangulation.
%
  boundary_num = 2 * node_num + 2 * hole_num - triangle_num - 2;

  return
end
