function gridlines_test01 ( )

%*****************************************************************************80
%
%% GRIDLINES_TEST01 tests GRID_RECTANGULAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDLINES_TEST01\n' );
  fprintf ( 1, '  GRID_RECTANGULAR draws a rectangular grid.\n' );

  x = rand ( 2, 100 );
  plot ( x(1,:), x(2,:), 'r*' );
  grid_rectangular ( 0.0, 1.0, 11, 0.0, 1.0, 11 );
  xlabel ( 'X' )
  ylabel ( 'Y' )
  title ( '100 random points, 100 boxes' )
  axis equal
  axis square

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Press return to continue.\n' )
  pause
  clf

  return
end
