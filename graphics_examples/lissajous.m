function lissajous ( )

%*****************************************************************************80
%
%% LISSAJOUS uses MATLAB to draw a closed planar curve.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LISSAJOUS:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a plane curve by connecting a series of points.\n' );

  xy = load ( 'lissajous.txt' );
%
%  Plot the data.
%
  plot ( xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'm' );
  hold on
%
%  To avoid clutter, only plot every 10th point.
%
  plot ( xy(1:10:end,1), xy(1:10:end,2), 'k.' );
  grid on
  axis ( [ -1.2, +1.2, -1.2, +1.2 ] )
  axis equal
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Lissajous, x=sin(3t+pi/2), y=sin(4t)' );
  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LISSAJOUS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
