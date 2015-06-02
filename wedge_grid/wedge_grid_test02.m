function wedge_grid_test02 ( )

%*****************************************************************************80
%
%% WEDGE_GRID_TEST02 tests WEDGE_GRID_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_GRID_TEST02\n' );
  fprintf ( 1, '  WEDGE_GRID_PLOT can create GNUPLOT data files\n' );
  fprintf ( 1, '  for displaying a wedge grid.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid order N = %d\n', n );

  ng = wedge_grid_size ( n );

  fprintf ( 1, '  Grid count NG = %d\n', ng );

  g = wedge_grid ( n, ng );

  header = 'wedge';

  wedge_grid_plot ( n, ng, g, header );

  return
end

