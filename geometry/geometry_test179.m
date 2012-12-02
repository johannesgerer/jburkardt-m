function geometry_test179 ( )

%*****************************************************************************80
%
%% TEST179 tests SOCCER_SIZE_3D and SOCCER_SHAPE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST179\n' );
  fprintf ( 1, '  For the truncated icosahedron, or soccer ball,\n' );
  fprintf ( 1, '  SOCCER_SIZE_3D returns dimension information;\n' );
  fprintf ( 1, '  SOCCER_SHAPE_3D returns face and order information.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will use this information to compute the\n' );
  fprintf ( 1, '  areas and centers of each face.\n' );

  [ point_num, edge_num, face_num, face_order_max ] = soccer_size_3d ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points =   %d\n', point_num );
  fprintf ( 1, '  Number of edges =    %d\n', edge_num );
  fprintf ( 1, '  Number of faces =    %d\n', face_num );
  fprintf ( 1, '  Maximum face order = %d\n', face_order_max );

  [ point_coord, face_order, face_point ] = soccer_shape_3d ( ...
    point_num, face_num, face_order_max );
%
%  Compute the area of each face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Face  Order  Area\n' );
  fprintf ( 1, '\n' );

  for i = 1 : face_num

    for j = 1 : face_order(i)
      k = face_point(j,i);
      v(1:dim_num,j) = point_coord(1:dim_num,k);
    end

    [ area, normal ] = polygon_area_3d ( face_order(i), v );

    fprintf ( 1, '  %6d  %5d  %8f\n', i, face_order(i), area );

  end
%
%  Find the center of each face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Face  Center\n' );
  fprintf ( 1, '\n' );

  for i = 1 : face_num

    vave(1:dim_num) = 0.0;

    for j = 1 : face_order(i)
      k = face_point(j,i);
      vave(1:dim_num) = vave(1:dim_num) + point_coord(1:dim_num,k)';
    end

    vave(1:dim_num) = vave(1:dim_num) / face_order(i);

    fprintf ( 1, '  %6d  %10f  %10f  %10f\n', i, vave(1:dim_num) );

  end

  return
end
