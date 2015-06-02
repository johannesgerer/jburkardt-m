function sphere_cubed_grid_line_count_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_LINE_COUNT_TEST tests SPHERE_CUBED_GRID_LINE_COUNT_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_LINE_COUNT_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_LINE_COUNT counts lines on a cubed sphere grid.\n' );
  fprintf ( 1, '  Each square face is divided into NxN subfaces,\n' );
  fprintf ( 1, '  and there are 6 faces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        N      LINE_COUNT\n' );
  fprintf ( 1, '\n' );
  for n = 1 : 10
    line_count = sphere_cubed_grid_line_count ( n );
    fprintf ( 1, '  %8d  %8d\n', n, line_count );
  end

  return
end