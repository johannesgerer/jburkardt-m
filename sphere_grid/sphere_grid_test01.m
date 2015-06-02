function sphere_grid_test01 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST01 tests SPHERE_ICOS_POINT_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST01\n' );
  fprintf ( 1, '  SPHERE_ICOS_POINT_NUM determines the size\n' );
  fprintf ( 1, '  (number of vertices, edges and faces) in a grid\n' );
  fprintf ( 1, '  on a sphere, made by subdividing an initial\n' );
  fprintf ( 1, '  projected icosahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N determines the number of subdivisions of each\n' );
  fprintf ( 1, '  edge of the icosahedral faces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N         V         E         F\n' );
  fprintf ( 1, '  --------  --------  --------  --------\n' );
  fprintf ( 1, '\n' );

  for factor = 1 : 20
    point_num = sphere_icos_point_num ( factor );
    edge_num = sphere_icos_edge_num ( factor );
    face_num = sphere_icos_face_num ( factor );
    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', ...
      factor, point_num, edge_num, face_num );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat, but using N constrained by doubling:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N         V         E         F\n' );
  fprintf ( 1, '  --------  --------  --------  --------\n' );
  fprintf ( 1, '\n' );

  factor = 1;
  for factor_log = 0 : 10
    point_num = sphere_icos_point_num ( factor );
    edge_num = sphere_icos_edge_num ( factor );
    face_num = sphere_icos_face_num ( factor );
    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', ...
      factor, point_num, edge_num, face_num );
    factor = factor * 2;
  end

  return
end
