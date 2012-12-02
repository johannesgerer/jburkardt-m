function p00_dat_plot ( prob )

%*****************************************************************************80
%
%% P00_DATA_PLOT plots the data for a given problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the problem.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLOT_DATA_PLOT\n' );
  fprintf ( 1, '  Plot the data for problem %d\n', prob );

  problem_title = p00_title ( prob );

  fprintf ( 1, '  %s\n', problem_title )

  data_num = p00_data_num ( prob );

  fprintf ( 1, '  DATA_NUM = %d\n', data_num )

  [ xdata, ydata ] = p00_dat ( prob, data_num );

  plot ( xdata, ydata, 'r.', 'MarkerSize', 20 );
  grid;
  xlabel ( '<---X--->' );
  ylabel ( '<---Y--->' );
  title ( problem_title );

  return
end
