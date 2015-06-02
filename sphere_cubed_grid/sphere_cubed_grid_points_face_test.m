function sphere_cubed_grid_points_face_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_POINTS_FACE_TEST tests SPHERE_CUBED_GRID_POINTS_FACE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_POINTS_FACE_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_POINTS_FACE computes points associated\n' );
  fprintf ( 1, '  with one face of a cubed sphere grid.\n' );

  n = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of divisions on each face = %d\n', n );

  ns = sphere_cubed_grid_point_count ( n );
  fprintf ( 1, '  Total number of points = %d\n', ns );

  ns2 = 0;
  i1 = 0;
  j1 = 0;
  k1 = 0;
  i2 = n;
  j2 = n;
  k2 = 0;
  xyz = [];
%
%  Bottom face.
%
  [ ns2, xyz ] = ...
    sphere_cubed_grid_points_face ( n, i1, j1, k1, i2, j2, k2, ns2, xyz ); 

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current number of points = %d\n', ns2 );

  r8mat_print ( ns2, 3, xyz,'  XYZ array after call for bottom face:' );

%
%  Compute one more face, but skip points already generated.
%
  i1 = 0;
  j1 = 0;
  k1 = 1;
  i2 = 0;
  j2 = n - 1;
  k2 = n - 1;

  [ ns2, xyz ] = ...
    sphere_cubed_grid_points_face ( n, i1, j1, k1, i2, j2, k2, ns2, xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current number of points = %d\n', ns2 );

  r8mat_print ( ns2, 3, xyz,'  XYZ array after call for a side face face:' );

  return
end
