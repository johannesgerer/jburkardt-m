function geometry_test083 ()

%*****************************************************************************80
%
%% TEST083 tests POLYHEDRON_VOLUME_3D, POLYHEDRON_VOLUME_3D_2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  maxorder = 3;
  face_num = 4;
  dim_num = 3;
  node_num = 4;

  coord = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';
  node = [ ...
    3, 1, 1, 2; ...
    2, 2, 4, 3; ...
    1, 4, 3, 4 ]';
  order = [ 3, 3, 3, 3 ];
  volume_exact = 1.0 / 6.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST083\n' );
  fprintf ( 1, '  For a polyhedron in 3D:\n' );
  fprintf ( 1, '  POLYHEDRON_VOLUME_3D computes volume.\n' );
  fprintf ( 1, '  POLYHEDRON_VOLUME_3D_2 computes volume.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces is %d\n', face_num );

  i4vec_print ( face_num, order, '  Order of each face:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes per face:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : face_num
    fprintf ( 1, '  %4d', i );
    for j = 1 : order(i)
      fprintf ( 1, '  %4d', node(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  r8mat_transpose_print ( dim_num, node_num, coord, '  Polyhedron nodes' );

  volume1 = polyhedron_volume_3d ( coord, maxorder, face_num, node, node_num, ...
    order );

  volume2 = polyhedron_volume_3d_2 ( coord, maxorder, face_num, node, node_num, ...
    order );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume ( method 1 ) = %f\n', volume1 );
  fprintf ( 1, '  Volume ( method 2 ) = %f\n', volume2 );
  fprintf ( 1, '  Volume ( exact ) =    %f\n', volume_exact );

  return
end
