function p00_plot ( prob )

%*****************************************************************************80
%
%% P00_PLOT plots the data for any of the tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
  prob_num = p00_prob_num;

  if ( prob < 1 || prob_num < prob )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_PLOT - Fatal error!\n' );
    fprintf ( 1, '  Values of PROB must be between 1 and %d.\n', prob_num );
    error ( 'P00_PLOT - Fatal error!' );
  end

  xmin = 0.0;
  xmax = 1.0;
  n = 501;

  x = r8vec_linspace ( n, xmin, xmax );

  y = p00_f ( prob, n, x );
  ymin = min ( y );
  ymax = max ( y );
  yrange = ymax - ymin;

  t = p00_title ( prob );

  plot ( x, y, 'Linewidth', 2 );
  grid
  xlabel ( '<---X--->' )
  ylabel ( '<---Y--->' )
  title ( t );
  axis ( [ xmin, xmax, ymin - 0.05 * yrange, ymax + 0.05 * yrange ] );

  filename = sprintf ( 'p%02d_plot.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
