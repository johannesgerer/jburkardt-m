function cube3d_grid_plot_test ( )

%*****************************************************************************80
%
%% CUBE3D_GRID_PLOT_TEST demonstrates CUBE3D_GRID_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2013
%
%  Author:
%
%    John Burkardt
%
  figure_num = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE3D_GRID_PLOT_TEST:\n' );
  fprintf ( 1, '  Use CUBE3D_GRID to project hypersphere points onto\n' );
  fprintf ( 1, '  the surface of a 3D cube.\n' );
  fprintf ( 1, '  Use CUBE3D_GRID_PLOT to plot the sampled cube surface,\n' );
  fprintf ( 1, '  and the surface plus projected grid points.\n' );

  n = 16;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  1D Grid index N = %d\n', n );
  fprintf ( 1, '  2D Grid = 2N+1 * N+1 = %d\n', ( 2 * n + 1 ) * ( n + 1 ) );
  fprintf ( 1, '  Do this for a centered, and an offcentered observation point.\n' );

  x0 = [ 0.0; 0.0; 0.0 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot with centered observation [%g,%g,%g]\n', x0 );

  [ x1, x2, x3 ] = cube3d_grid ( n, x0 );

  filename = 'cube_centered';
  figure_num = cube3d_grid_plot ( x1, x2, x3, filename, figure_num );

  x0 = [ 0.8; 0.4; 0.0 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot with offcentered observation [%g,%g,%g]\n', x0 );

  [ x1, x2, x3 ] = cube3d_grid ( n, x0 );

  filename = 'cube_offcentered';
  figure_num = cube3d_grid_plot ( x1, x2, x3, filename, figure_num );

  return
end
