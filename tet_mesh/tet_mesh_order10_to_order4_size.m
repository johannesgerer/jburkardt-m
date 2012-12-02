function [ node_num2, tetra_num2 ] = tet_mesh_order10_to_order4_size ( ...
  node_num1, tetra_num1 )

%*****************************************************************************80
%
%% TET_MESH_ORDER10_TO_ORDER4_SIZE sizes a linear tet mesh from a quadratic one.
%
%  Discussion:
%
%    A linear (4 node) tet mesh can be derived from a quadratic
%    (10 node) tet mesh using the same set of nodes, but reassigning
%    the nodes of each quadratic tet among 8 linear subtets.
%
%    This routine returns the number of nodes and tetrahedra in the
%    linear mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anwei Liu, Barry Joe,
%    Quality Local Refinement of Tetrahedral Meshes Based
%    on 8-Subtetrahedron Subdivision,
%    Mathematics of Computation,
%    Volume 65, Number 215, July 1996, pages 1183-1200.
%
%  Parameters:
%
%    Input, integer TETRA_NUM1, the number of tetrahedrons in the
%    quadratic mesh.
%
%    Input, integer NODE_NUM1, the number of nodes in the quadratic mesh.
%
%    Output, integer TETRA_NUM2, the number of tetrahedrons in the
%    linear mesh.
%
%    Output, integer NODE_NUM2, the number of nodes for the linear mesh.
%
  node_num2 = node_num1;
  tetra_num2 = 8 * tetra_num1;

  return
end
