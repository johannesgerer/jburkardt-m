function camel_test ( )

%*****************************************************************************80
%
%% CAMEL_TEST tests SHORELINE2 with the CAMEL function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CAMEL_TEST\n' );
  fprintf ( 1, '  Test SHORELINE2 using CAMEL as the function.\n' );

  x1 = -2.5;
  x2 = +2.5;
  y1 = -2.5;
  y2 = +2.5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The domain is [%g,%g] x [%g,%g]\n', x1, x2, y1, y2 );

  m = 20;
  n = 20;
  fprintf ( 1, '  The initial sample point grid is %d by %d\n', m, n );

  step_num = 4;
  fprintf ( 1, '  The number of refinement steps is %d\n', step_num );

  f_contour = 0.5;
  fprintf ( 1, '  Seeking the contour line F(X,Y) = %g\n', f_contour );

  [ x, t ] = shoreline2 ( @camel, f_contour, m, n, x1, x2, y1, y2, step_num );
%
%  Plot the triangulation.
%
  h = trimesh ( t', x(1,:), x(2,:) );
  set ( h, 'color', 'k' )
  grid on
  axis equal
  title ( sprintf ( 'CAMEL(x,y) = %g triangulated by SHORELINE2 using %d steps.', ...
    f_contour, step_num ) )

  print ( '-dpng', 'camel.png' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CAMEL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
