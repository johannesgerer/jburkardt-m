function geometry_test081 ()

%*****************************************************************************80
%
%% TEST081 tests POLYHEDRON_AREA_3D;
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

  area_exact = 2.366025;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST081\n' );
  fprintf ( 1, '  For a polyhedron in 3D:\n' );
  fprintf ( 1, '  POLYHEDRON_AREA_3D computes surface area;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces is %d\n', face_num );

  i4vec_print ( face_num, order, '  Order of each face:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nodes per face:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : face_num
    fprintf ( 1, '  %4d  ', i );
    for j = 1 : order(i)
      fprintf ( 1, '  %4d', node(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  r8mat_transpose_print ( dim_num, node_num, coord, '  Polyhedron nodes' );

  area = polyhedron_area_3d ( coord, maxorder, face_num, node, node_num, order );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Surface area = %f\n', area );
  fprintf ( 1, '  Exact area =   %f\n', area_exact );

  return
end
