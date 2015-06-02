function sphere_cubed_grid_point_count_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_POINT_COUNT_TEST tests SPHERE_CUBED_GRID_POINT_COUNT_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_POINT_COUNT_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_POINT_COUNT counts points on a cubed sphere grid.\n' );
  fprintf ( 1, '  Each square face is divided into NxN subfaces,\n' );
  fprintf ( 1, '  and there are 6 faces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        N      POINT_COUNT\n' );
  fprintf ( 1, '\n' );
  for n = 1 : 10
    point_count = sphere_cubed_grid_point_count ( n );
    fprintf ( 1, '  %8d  %8d\n', n, point_count );
  end

  return
end