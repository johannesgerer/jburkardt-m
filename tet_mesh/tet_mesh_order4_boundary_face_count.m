function boundary_face_fun = tet_mesh_order4_boundary_face_count ( ...
  tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_BOUNDARY_FACE_COUNT counts the number of boundary faces.
%
%  Discussion:
%
%    This routine is given a tet mesh, an abstract list of
%    quadruples of nodes.  It is assumed that the nodes forming each
%    face of each tetrahedron are listed in a counterclockwise order,
%    although the routine should work if the nodes are consistently
%    listed in a clockwise order as well.
%
%    It is assumed that each face of the tet mesh is either
%    * an INTERIOR face, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY face, which will occur only once.
%
%    This routine should work even if the region has holes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(4,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Output, integer BOUNDARY_FACE_NUM, the number of boundary faces.
%
  m = 3;
  face_num = 4 * tetra_num;
%
%  Set up the face array:
%  (Omit node 1)
%  (Omit node 2)
%  (Omit node 3)
%  (Omit node 4)
%
  face(1:3,            1:  tetra_num) = tetra_node(2:4,1:tetra_num);

  face(1,    tetra_num+1:2*tetra_num) = tetra_node(1,  1:tetra_num);
  face(2:3,  tetra_num+1:2*tetra_num) = tetra_node(3:4,1:tetra_num);

  face(1:2,2*tetra_num+1:3*tetra_num) = tetra_node(1:2,1:tetra_num);
  face(3,  2*tetra_num+1:3*tetra_num) = tetra_node(4,  1:tetra_num);

  face(1:3,3*tetra_num+1:4*tetra_num) = tetra_node(1:3,1:tetra_num);
%
%  Force the nodes of each face to be listed in ascending order.
%
  face = i4col_sort2_a ( m, face_num, face );
%
%  Ascending sort the columns.
%
  face = i4col_sort_a ( m, face_num, face );
%
%  Get the number of unique columns.
%
  unique_face_num = i4col_sorted_unique_count ( m, face_num, face );
%
%  Determine the number of interior and boundary faces.
%
  interior_face_num = 4 * tetra_num - unique_face_num;

  boundary_face_num = 4 * tetra_num - 2 * interior_face_num;

  return
end
