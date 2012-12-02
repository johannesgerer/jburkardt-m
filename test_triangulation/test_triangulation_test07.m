function test_triangulation_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests P00_HEX_GRID.
%
%  Discussion:
%
%    P00_HEX_GRID_COUNT and DTABLE_WRITE are also tested.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  file_name = 'p08_hex_grid_points.txt';
  m = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  P00_HEX_GRID returns points inside a region that\n' );
  fprintf ( 1, '    lie on a hexagonal grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P00_HEX_GRID_COUNT counts the number of hex\n' );
  fprintf ( 1, '    grid points inside a region.\n' );
  fprintf ( 1, '  DTABLE_WRITE writes sets of points to a file.\n' );

  test = 8;
  h = 0.0250;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a hex grid spacing of H = %f\n', h );

  n = p00_hex_grid_count ( test, m, h );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P00_HEX_GRID_COUNT reports that the number of\n' );
  fprintf ( 1, '  hex grid points will be %d\n', n );

  point = p00_hex_grid ( test, m, h, n );

  r8mat_write ( file_name, m, n, point );

  r8mat_transpose_print_some ( m, n, point, 1, 1, m, 5, ...
    '  A few of the points:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The hex grid points were written to the file "%s"\n', ...
    file_name );

  return
end
