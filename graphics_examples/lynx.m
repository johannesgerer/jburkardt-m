function lynx ( )

%*****************************************************************************80
%
%% LYNX uses MATLAB to draw a curve with datapoints marked.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNX:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a curve by connecting a series of data points.\n' );
  fprintf ( 1, '  Mark the data points.\n' );

  xy = load ( 'lynx.txt' );
%
%  Plot the data.
%
  plot ( xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'g' );
  hold on
  plot ( xy(:,1), xy(:,2), 'ko' );
  grid on
  xlabel ( '<--- Year --->' );
  ylabel ( '<--- Lynx Harvest --->' );
  title ( 'Lynx Population Records' );
  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNX:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
