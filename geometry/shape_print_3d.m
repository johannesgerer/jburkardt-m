function shape_print_3d ( point_num, face_num, face_order_max, point_coord, ...
  face_order, face_point )

%*****************************************************************************80
%
%% SHAPE_PRINT_3D prints information about a polyhedron in 3D.
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
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points in the shape.
%
%    Input, integer FACE_NUM, the number of faces in the shape.
%
%    Input, integer FACE_ORDER_MAX, the number of vertices per face.
%
%    Input, real POINT_COORD(3,POINT_NUM), the vertices.
%
%    Input, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Input, integer FACE_POINT(FACE_ORDER_MAX,FACE_NUM); FACE_POINT(I,J)
%    contains the index of the I-th point in the J-th face.  The
%    points are listed in the counter-clockwise direction defined
%    by the outward normal at the face.
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHAPE_PRINT_3D\n' );
  fprintf ( 1, '  Information about a polytope.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of vertices is %d\n', point_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vertices:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Index          X               Y               Z\n' );
  fprintf ( 1, '\n' );
  for j = 1 : point_num
    fprintf ( 1, '  %8d  ', j );
    for i = 1 : dim_num
      fprintf ( 1, '%16f', point_coord(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of faces is %d\n', face_num );
  fprintf ( 1, '  The maximum order of any face is %d\n', face_order_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Index     Order         Indices of Nodes in Face\n' );
  fprintf ( 1, '                      ' );
  for i = 1 : face_order_max
    fprintf ( 1, '%8d', i );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  for j = 1 : face_num
    fprintf ( 1, '  %8d  %8d  ', j, face_order(j) );
    for i = 1 : face_order(j)
      fprintf ( 1, '%8d', face_point(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
