function box_display ( m, n, blue, red, title_string )

%*****************************************************************************80
%
%% BOX_DISPLAY plots integer pairs as filled boxes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the greatest X and Y indices.
%
%    Input, function handle BLUE, a function handle, or an anonymous function, 
%    returning a logical value. If blue(x,y) is true, the box will be colored blue.
%
%    Input, function handle RED, a function handle, or an anonymous function, 
%    returning a logical value.  If red(x,y) is true, the box will be colored red, 
%    unless it was already blue. Thus, the red boxes indicate "new" information.
%
%    Input, string TITLE, a title for the plot.
%
  x_data_min = 0;
  x_data_max = m;
  y_data_min = 0;
  y_data_max = n;

  x_plot_min = x_data_min - 0.5;
  x_plot_max = x_data_max + 0.5;

  y_plot_min = y_data_min - 0.5;
  y_plot_max = y_data_max + 0.5;

  x_plot_range = x_plot_max - x_plot_min;
  y_plot_range = y_plot_max - y_plot_min;

  margin = 0.025 * max ( x_plot_range, y_plot_range );

  x_axes_min = x_plot_min - margin;
  x_axes_max = x_plot_max + margin;
  y_axes_min = y_plot_min - margin;
  y_axes_max = y_plot_max + margin;

  clf
%
%  Every box starts out WHITE.
%
  gray = [ 0.9, 0.9, 0.9 ];

  for x = 0 : m

    for y = 0 : n

      a = x - 0.44;
      b = x + 0.44;
      c = y - 0.44;
      d = y + 0.44;

      if ( blue ( x, y ) )
        patch ( [ a, b, b, a ], [ c, c, d, d ], 'b', 'EdgeColor', 'none' );
      elseif ( red ( x, y ) )
        patch ( [ a, b, b, a ], [ c, c, d, d ], 'r', 'EdgeColor', 'none' );
      else
        patch ( [ a, b, b, a ], [ c, c, d, d ], gray, 'EdgeColor', 'none' );
      end

    end
    
  end
%
%  TEMPORARY!
%  Draw a line to indicate desired accuracy level for sparse grids.
%
% line ( [ -0.5, 5.5 ], [ 5.5, -0.5 ], 'LineWidth', 3, 'Color', 'k' )
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title ( title_string )

  axis ( [ x_axes_min, x_axes_max, y_axes_min, y_axes_max ] );
  axis equal
  axis ( [ -0.5, m+0.5, -0.5, n+0.5 ] )

  return
end

