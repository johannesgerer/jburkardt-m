function line_grid_test01 ( )

%*****************************************************************************80
%
%% LINE_GRID_TEST01 uses simple parameters.
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
  n = 11;
  a = -1.0;
  b = +1.0;
  c = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_GRID_TEST01\n' );
  fprintf ( 1, '  Create a grid using LINE_GRID.\n' );
  fprintf ( 1, '  Use simple parameters.\n' );
  fprintf ( 1, '  Number of grid points N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     C      A         B\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %8.4f  %8.4f\n', n, c, a, b );

  x = line_grid ( n, a, b, c );
  r8vec_print ( n, x, '  Grid points:' );

  return
end
