function gl_grid_square_display ( )

%*****************************************************************************80
%
%% GL_GRID_SQUARE_DISPLAY displays a 2D square Gauss-Legendre grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GL_GRID_SQUARE_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display a 2D square Gauss-Legendre grid.\n' );

  dim_num = 2;
 
  while ( 1 )
 
    order_1d = input ( 'Enter the quadrature order or RETURN to exit;' );
    
    if ( isempty ( order_1d ) )
      break
    end
    
    clf

    order_nd = order_1d^dim_num;
    
    points = gl_grid_square ( dim_num, order_1d, order_nd );
%
%  We have to name the axes in order to control the grid.
%
    axes_handle = axes;
%
%  Plot the points.
%
    handle = scatter ( points(1,:), points(2,:), 'filled' );
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
    s = sprintf ( '%dx%d Gauss-Legendre Grid', order_1d, order_1d );
    title ( s );
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GL_GRID_SQUARE_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
