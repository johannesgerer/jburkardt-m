function p00_plot ( prob )

%*****************************************************************************80
%
%% P00_PLOT plots the data for any of the tests.
%
%  Discussion:
%
%    For now we assume that the data dimension is 2, so that we are simply
%    creating a single X-Y plot.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2012
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

  data_num = p00_data_num ( prob );

  dim_num = p00_dim_num ( prob );
 
  p = p00_data ( prob, dim_num, data_num );

  x = p(1,:);
  y = p(2,:);

  plot ( x, y, 'Linewidth', 2 );
  hold on
  plot ( x, y, 'r.', 'Markersize', 25 )
  grid
  xlabel ( '<---X--->' )
  ylabel ( '<---Y--->' )
  title ( sprintf ( 'TEST\\_INTERP Data Set %d', prob ) );
  hold off

  filename = sprintf ( 'p%02d_plot.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end
