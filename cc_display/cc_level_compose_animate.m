function cc_level_compose_animate ( )

%*****************************************************************************80
%
%% CC_LEVEL_COMPOSE_ANIMATE displays the grids that compose one level.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_LEVEL_COMPOSE_ANIMATE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display the nested 2D Clenshaw-Curtis grids\n' );
  fprintf ( 1, '  that compose one level.\n' );

  dim_num = 2;
 
  while ( 1 )
%
%  Get user input.
%
    fprintf ( 1, '\n' );
    level = input ( 'Enter the LEVEL or RETURN to exit;' );
    
    if ( isempty ( level ) )
      break
    end
%
%  Generate the entire set of points.
%
    [ grid_num, point_num ] = cc_levels_minmax_size ( dim_num, ...
      level, level );
    
    [ grid_level, grid_order, grid_points ] = cc_levels_minmax ( dim_num, ...
      level, level,  grid_num, point_num );

    [ dim_num, grid_points_num ] = size ( grid_points );
%
%  Display the full set of points as filled blue circles.
%
    clf
    axes_handle = axes;
    handle_new = scatter ( grid_points(1,:), grid_points(2,:), 'b', 'filled' );
    axis square
    grid on
    set ( axes_handle, 'xtick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
    set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
    set ( axes_handle, 'yticklabel', [] );
    axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
    s = sprintf ( 'Entire grid for LEVEL %d', level );
    title ( s );
    fprintf ( 1, 'Press return\n', level );
    pause

    hold off
%
%  Display the full set of points in gray.
%  Display each contributing grid, one at a time, in red.
%
    for gridd = 1 : grid_num

      order_1d(1:2) = grid_order(1:2,gridd)
      order_nd = prod ( order_1d(1:2) );
      grid_points_new = cc_grid ( dim_num, order_1d, order_nd );

      clf
%
%  We have to name the axes in order to control the grid.
%
      axes_handle = axes;
%
%  Plot the OLD points.
%
      handle_old = scatter ( grid_points(1,:), grid_points(2,:), 'bo' );

      hold on

      handle_new = scatter ( grid_points_new(1,:), grid_points_new(2,:), ...
        'r', 'filled' );
%
%  Force the plotting region to be square, not rectangular.
%
      axis square
%
%  Request grid lines.
%
      grid on
%
%  Specify the location of the grid lines, and suppress labeling.
%
      set ( axes_handle, 'xtick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
      set ( axes_handle, 'xticklabel', [] );
      set ( axes_handle, 'ytick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
      set ( axes_handle, 'yticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
      axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
%
%  Title
%
      s = sprintf ( '+ %d * %d CC grid', grid_level(1,gridd), grid_level(2,gridd) );
      title ( s );

      fprintf ( 1, '+ %d*%d CC grid, Press return\n', ...
        grid_level(1,gridd), grid_level(2,gridd) );
      pause

      hold off

    end
%
%  Display the full set of points as filled blue circles.
%
    clf
    axes_handle = axes;
    handle_new = scatter ( grid_points(1,:), grid_points(2,:), 'b', 'filled' );
    axis square
    grid on
    set ( axes_handle, 'xtick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
    set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', [ -1, -.75, -.5, -.25, 0, .25, .50, .75, 1] );
    set ( axes_handle, 'yticklabel', [] );
    axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
    s = sprintf ( 'Entire grid for LEVEL %d', level );
    title ( s );
    fprintf ( 1, 'Press return\n', level );
    pause

    hold off

    fprintf ( 1, 'Press return to CLEAR the grid!\n' );
    pause
    clf

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_LEVEL_COMPOSE_ANIMATE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
