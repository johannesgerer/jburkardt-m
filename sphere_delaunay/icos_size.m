function [ point_num, edge_num, face_num, face_order_max ] = icos_size ( )

%*****************************************************************************80
%
%% ICOS_SIZE gives "sizes" for an icosahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2007
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
  point_num = 12;
  edge_num = 30;
  face_num = 20;
  face_order_max = 3;

  return
end
