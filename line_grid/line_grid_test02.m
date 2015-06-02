function line_grid_test02 ( )

%*****************************************************************************80
%
%% LINE_GRID_TEST02 tries an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
  a = 0.0;
  b = 1.0;
  c = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_GRID_TEST02\n' );
  fprintf ( 1, '  Create a grid using LINE_GRID.\n' );
  fprintf ( 1, '  Try an increasing number of points.\n' );

  n = 4;

  for test = 1 : 3

    n = 2 * n + 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, '     N     C      A         B\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %4d  %4d  %8.4f  %8.4f\n', n, c, a, b );

    x = line_grid ( n, a, b, c );
    r8vec_print ( n, x, '  Grid points:' );

  end

  return
end
