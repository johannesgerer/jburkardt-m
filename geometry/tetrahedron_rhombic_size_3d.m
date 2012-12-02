function [ point_num, edge_num, face_num, face_order_max ] = ...
  tetrahedron_rhombic_size_3d ( )

%*****************************************************************************80
%
%% TETRAHEDRON_RHOMBIC_SIZE_3D gives "sizes" for a rhombic tetrahedron in 3D.
%
%  Discussion:
%
%    Call this routine first, in order to learn the required dimensions
%    of arrays to be set up by TETRAHEDRON_RHOMBIC_SHAPE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer POINT_NUM, the number of vertices.
%
%    Output, integer EDGE_NUM, the number of edges.
%
%    Output, integer FACE_NUM, the number of faces.
%
%    Output, integer FACE_ORDER_MAX, the maximum order of any face.
%
  point_num = 10;
  edge_num = 6;
  face_num = 4;
  face_order_max = 6;

  return
end
