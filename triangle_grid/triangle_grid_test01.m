function triangle_grid_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_GRID_TEST01 tests TRIANGLE_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  TRIANGLE_GRID can define a triangular grid\n' );
  fprintf ( 1, '  with N+1 points on a side, based on any triangle.\n' );

  n = 10;

  ng = triangle_grid_count ( n );

  t = [ ...
    0.0, 0.0;
    1.0, 0.0;
    0.5, 0.86602540378443860 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Defining triangle:\n' );
  fprintf ( 1, '     J      X      Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 3
    fprintf ( 1, '  %4d  %12f  %12f\n', j, t(1:2,j) );
  end
  tg = triangle_grid ( n, t );

  r82vec_print_part ( ng, tg, 20, '  Part of the grid point array:' );

  filename = 'triangle_grid_test01.xy';

  r8mat_write ( filename, 2, ng, tg );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );

  return
end
