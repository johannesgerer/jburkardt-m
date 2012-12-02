function [ point_num, edge_num, face_num, face_order_max ] = ...
  octahedron_size_3d ( )

%*****************************************************************************80
%
%% OCTAHEDRON_SIZE_3D returns size information for an octahedron in 3D.
%
%  Discussion:
%
%    This routine can be called before calling OCTAHEDRON_SHAPE_3D,
%    so that space can be allocated for the arrays.
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
%    Output, integer FACE_ORDER_MAX, the maximum number of vertices 
%    per face.
%
  point_num = 6;
  edge_num = 12;
  face_num = 8;
  face_order_max = 3;

  return
end
