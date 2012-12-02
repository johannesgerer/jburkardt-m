function [ point_num, edge_num, face_num, face_order_max ] = ...
  soccer_size_3d ( )

%*****************************************************************************80
%
%% SOCCER_SIZE_3D gives "sizes" for a truncated icosahedron in 3D.
%
%  Discussion:
%
%    The shape is a truncated icosahedron, which is the design used
%    on a soccer ball.  There are 12 pentagons and 20 hexagons.
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
%  Reference:
%
%    http://polyhedra.wolfram.com/uniform/u25.html
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
  point_num = 60;
  edge_num = 90;
  face_num = 32;
  face_order_max = 6;

  return
end
