function [ point_coord, face_order, face_point ] = cube_shape_3d ( ...
  point_num, face_num, face_order_max )

%*****************************************************************************80
%
%% CUBE_SHAPE_3D describes a cube in 3D.
%
%  Discussion:
%
%    The vertices lie on the unit sphere.
%
%    The dual of the cube is the octahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
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
%    in a face.
%
%    Output, real POINT_COORD(3,POINT_NUM), the vertices.
%
%    Output, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Output, integer FACE_POINT(FACE_ORDER_MAX,FACE_NUM); FACE_POINT(I,J)
%    contains the index of the I-th point in the J-th face.  The
%    points are listed in the counter-clockwise direction defined
%    by the outward normal at the face.
%
  dim_num = 3;
%
%  Set point coordinates.
%
  a = sqrt ( 1.0 / 3.0 );

  point_coord(1:dim_num,1:point_num) = [ ...
     -a, -a, -a; ...
      a, -a, -a; ...
      a,  a, -a; ...
     -a,  a, -a; ...
     -a, -a,  a; ...
      a, -a,  a; ...
      a,  a,  a; ...
     -a,  a,  a ]';
%
%  Set the face orders.
%
  face_order(1:face_num) = [ 4, 4, 4, 4, 4, 4 ]';
%
%  Set the faces.
%
  face_point(1:face_order_max,1:face_num) = [ ...
     1, 4, 3, 2; ...
     1, 2, 6, 5; ...
     2, 3, 7, 6; ...
     3, 4, 8, 7; ...
     1, 5, 8, 4; ...
     5, 6, 7, 8 ]';

  return
end
