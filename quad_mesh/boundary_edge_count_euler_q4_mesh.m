function boundary_num = boundary_edge_count_euler_q4_mesh ( node_num, ...
  element_num, hole_num )

%*****************************************************************************80
%
%% BOUNDARY_EDGE_COUNT_EULER_Q4_MESH counts boundary edges using Euler's formula.
%
%  Discussion:
%
%    We assume we are given information about a quadrilateral mesh
%    of a set of nodes in the plane.
%
%    Given the number of nodes, elements and holes, we are going to apply
%    Euler's formula to determine the number of edges that lie on the
%    boundary of the set of nodes.
%
%    The number of faces, including the infinite face and internal holes,
%    is ELEMENT_NUM + HOLE_NUM + 1.
%
%    Let BOUNDARY_NUM denote the number of edges on the boundary.
%    Each of the ELEMENT_NUM quadrilaterals uses four edges.  Every edge
%    occurs in two different elements, so the number of edges must be
%    ( 4 * ELEMENT_NUM + BOUNDARY_NUM ) / 2.
%
%    The number of nodes used in the mesh is NODE_NUM.
%
%    Euler's formula asserts that, for a simple connected figure in the
%    plane with no edge crossings, NODE_NUM nodes, EDGE_NUM edges and
%    FACE_NUM faces:
%
%      NODE_NUM - EDGE_NUM + FACE_NUM = 2
%
%    In our context, this becomes
%
%      NODE_NUM - ( 4 * ELEMENT_NUM + BOUNDARY_NUM ) / 2
%      + ELEMENT_NUM + HOLE_NUM + 1 = 2
%
%    or
%
%      BOUNDARY_NUM = 2 * NODE_NUM + 2 * HOLE_NUM - 2 * ELEMENT_NUM - 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marc de Berg, Marc Krevald, Mark Overmars, Otfried Schwarzkopf,
%    Computational Geometry, Section 9.1,
%    Springer, 2000.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer HOLE_NUM, the number of internal holes.
%
%    Output, integer BOUNDARY_NUM, the number of edges that
%    lie on the boundary of the mesh.
%
  boundary_num = 2 * node_num + 2 * hole_num - 2 * element_num - 2;

  return
end
