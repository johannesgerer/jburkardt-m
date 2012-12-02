function cc_grids_animate ( )

%*****************************************************************************80
%
%% CC_GRIDS_ANIMATE displays a sequence of merged 2D Clenshaw-Curtis grids.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 November 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_GRIDS_ANIMATE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display a sequence of merged 2D Clenshaw-Curtis grids.\n' );

  dim_num = 2;
 
  while ( 1 )
 
    fprintf ( 1, '\n' );
    order_max_1d = input ( 'Enter the maximum orders [A,B] or RETURN to exit;' );
    
    if ( isempty ( order_max_1d ) )
      break
    end

    points_old = [];
    points_old_num = 0;

    points = [];
    order_nd = 0;
    
    for order = 1 : max ( order_max_1d(1:2) )

      if ( 0 < order_nd )
        points_old(1:2,points_old_num+1:points_old_num+order_nd) = points(1:2,1:order_nd);
        points_old_num = points_old_num + order_nd;
      end

      clf
%
%  We have to name the axes in order to control the grid.
%
      axes_handle = axes;
%
%  Compute the new points and plot them in red.
%
      order_1d(1:2) = min ( order, order_max_1d(1:2) );
      order_nd = prod ( order_1d(1:2) );
      
      points = cc_grid ( dim_num, order_1d, order_nd );

      handle_new = scatter ( points(1,:), points(2,:), 'r', 'filled' );
%
%  Plot the old points in blue.
%
      hold on

      if ( 0 < points_old_num )
        handle_old = scatter ( points_old(1,:), points_old(2,:), 'b', 'filled' );
      end
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
      s = sprintf ( '%dx%d Clenshaw-Curtis Grid', order_1d(1), order_1d(2) );
      title ( s );

      fprintf ( 1, '+%dx%d Clenshaw-Curtis Grid, Press return\n', ...
        order_1d(1), order_1d(2) );

      pause

      hold off
      
    end

    fprintf ( 1, 'Press return to CLEAR the grid!\n' );
    pause
    clf

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_GRIDS_ANIMATE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
