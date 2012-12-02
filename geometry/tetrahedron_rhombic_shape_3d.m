function [ point_coord, face_order, face_point ] = ...
  tetrahedron_rhombic_shape_3d ( point_num, face_num, face_order_max )

%*****************************************************************************80
%
%% TETRAHEDRON_RHOMBIC_SHAPE_3D describes a rhombic tetrahedron in 3D.
%
%  Discussion:
%
%    Call TETRAHEDRON_RHOMBIC_SIZE_3D first, to get dimension information.
%
%    The tetrahedron is described using 10 nodes.  If we label the vertices
%    P0, P1, P2 and P3, then the extra nodes lie halfway between vertices,
%    and have the labels P01, P02, P03, P12, P13 and P23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2007
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
%    Input, integer POINT_NUM, the number of points in the shape.
%
%    Input, integer FACE_NUM, the number of faces in the shape.
%
%    Input, integer FACE_ORDER_MAX, the maximum number of vertices per face.
%
%    Output, real POINT_COORD(3,POINT_NUM), the vertices.
%
%    Output, integer FACE_ORDER(FACE_NUM), the number of vertices
%    for each face.
%
%    Output, integer FACE_POINT(FACE_ORDER_MAX,FACE_NUM); FACE_POINT(I,J)
%    contains the index of the I-th point in the J-th face.  The
%    points are listed in the counter clockwise direction defined
%    by the outward normal at the face.
%
  dim_num = 3;

  a =        1.0   / sqrt ( 3.0 );
  b = sqrt ( 2.0 ) / sqrt ( 3.0 );
  c = sqrt ( 3.0 ) /        6.0;
  d =        1.0   / sqrt ( 6.0 );
  z = 0.0;
%
%  Set the point coordinates.
%
  point_coord(1:dim_num,1)  = [ -b,  z,  z ]';
  point_coord(1:dim_num,2)  = [  z, -a,  z ]';
  point_coord(1:dim_num,3)  = [  z,  a,  z ]';
  point_coord(1:dim_num,4)  = [  z,  z,  b ]';
  point_coord(1:dim_num,5)  = [ -d, -c,  z ]';
  point_coord(1:dim_num,6)  = [ -d,  c,  z ]';
  point_coord(1:dim_num,7)  = [ -d,  z,  d ]';
  point_coord(1:dim_num,8)  = [  z,  z,  z ]';
  point_coord(1:dim_num,9)  = [  z, -c,  d ]';
  point_coord(1:dim_num,10) = [  z,  c,  d ]';
%
%  Set the face orders.
%
  face_order(1:face_num) = [ 6, 6, 6, 6 ];
%
%  Set faces.
%
  face_point(1:face_order_max,1:face_num) = [ ...
     1,  5,  2,  9,  4,  7; ...
     2,  8,  3, 10,  4,  9; ...
     3,  6,  1,  7,  4, 10; ...
     1,  6,  3,  8,  2,  5 ]';

  return
end
