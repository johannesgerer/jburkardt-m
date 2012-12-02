function [ point_num, edge_num, face_num, face_order_max ] = ...
  truncated_octahedron_size_3d ( )

%*****************************************************************************80
%
%% TRUNCATED_OCTAHEDRON_SIZE_3D gives "sizes" for a truncated octahedron in 3D.
%
%  Discussion:
%
%    The truncated octahedron is "space-filling".
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
%    Output, integer POINT_NUM, the number of points.
%
%    Output, integer EDGE_NUM, the number of edges.
%
%    Output, integer FACE_NUM, the number of faces.
%
%    Output, integer FACE_ORDER_MAX, the maximum order of any face.
%
  point_num = 24;
  edge_num = 36;
  face_num = 14;
  face_order_max = 6;

  return
end
