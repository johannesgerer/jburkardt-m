function gridlines_test02 ( )

%*****************************************************************************80
%
%% GRIDLINES_TEST02 tests GRID_POLAR.
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
  fprintf ( 1, 'GRIDLINES_TEST02\n' );
  fprintf ( 1, '  GRID_POLAR draws a polar grid.\n' );
  fprintf ( 1, '  Compare two methods of sampling the circle.\n' );

  r = sqrt ( rand ( 400, 1 ) );
  t = pi * rand ( 400, 1 );
  plot ( r .* cos ( t ), r .* sin ( t ), 'b*' );

  grid_polar ( 0.0, 0.0, 0.1, 1.0, 10, 0, 180, 13 );

  hold on

  r = - rand ( 400, 1 );
  t = pi * rand ( 400, 1 );
  plot ( r .* cos ( t ), r .* sin ( t ), 'r*' );

  grid_polar ( 0.0, 0.0, 0.1, 1.0, 10, 180, 360, 13 );

  xlabel ( 'X' )
  ylabel ( 'Y' )
  title ( 'Blue: R = sqrt(rand), Red: R = - rand' )
  axis equal

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Press return to continue.\n' )
  hold off
  pause
  clf

  return
end
