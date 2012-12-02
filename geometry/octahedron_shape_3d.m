function [ point_coord, face_order, face_point ] = octahedron_shape_3d ( ...
  point_num, face_num, face_order_max )

%*****************************************************************************80
%
%% OCTAHEDRON_SHAPE_3D describes an octahedron in 3D.
%
%  Discussion:
%
%    The vertices lie on the unit sphere.
%
%    The dual of the octahedron is the cube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points in the shape.
%
%    Input, integer FACE_NUM, the number of faces in the shape.
%
%    Input, integer FACE_ORDER_MAX, the maximum number of vertices 
%    per face.
%
%    Output, real POINT_COORD(3,POINT_NUM); POINT_COORD(*,J) is
%    the X, Y and Z coordinates of point J.
%
%    Output, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Output, integer FACE_POINT(FACE_ORDER_MAX,FACE_NUM); FACE_POINT(I,J)
%    is the index of the I-th point in the J-th face.  The
%    points are listed in the counter-clockwise direction defined
%    by the outward normal at the face.
%
  dim_num = 3;
%
%  Set point coordinates.
%
  point_coord(1:dim_num,1:point_num) = [ ...
     0.0,  0.0, -1.0; ...
     0.0, -1.0,  0.0; ...
     1.0,  0.0,  0.0; ...
     0.0,  1.0,  0.0; ...
    -1.0,  0.0,  0.0; ...
     0.0,  0.0,  1.0 ]';
%
%  Set the face orders.
%
  face_order(1:face_num) = [ 3, 3, 3, 3, 3, 3, 3, 3 ]';
%
%  Set the faces.
%
  face_point(1:face_order_max,1:face_num) = [ ...
     1, 3, 2; ...
     1, 4, 3; ...
     1, 5, 4; ...
     1, 2, 5; ...
     2, 3, 6; ...
     3, 4, 6; ...
     4, 5, 6; ...
     5, 2, 6 ]';

  return
end
