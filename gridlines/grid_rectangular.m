function grid_rectangular ( xmin, xmax, xnum, ymin, ymax, ynum )

%*****************************************************************************80
%
%% GRID_RECTANGULAR draws rectangular grid lines on a graph.
%
%  Discussion:
%
%    The grid lines are drawn in a very pale gray.  To make the lines
%    stronger, or a different color, modify the setting of the internal
%    "gray" variable.
%
%  Example:
%
%    x = rand ( 2, 100 );
%    plot ( x(1,:), x(2,:), 'b*' )
%    grid_rectangular ( 0.0, 1.0, 11, 0.0, 1.0, 11 )
%
%    will plot 100 random numbers, and draw a grid of 11 x 11 lines,
%    creating 100 boxes.
%
%  Gratuitous Aside:
%
%    MATLAB includes a "grid on" command that will draw grid lines, with
%    tastefully chosen linestyle and color.  It also chooses the number
%    of gridlines in each direction.  And if you have a graph that's the
%    same height as width, it can still choose twice as many gridlines in
%    Y as in X.  Buried inside MATLAB's graphics language are various
%    "Properties" such as "XTick" which you can try to manipulate to
%    change this behavior, but after a frustrating series of failed
%    experiments, I decided to stop getting mad.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XMIN, XMAX, the minimum and maximum X values.
%
%    Input, integer XNUM, the number of vertical lines to draw.
%    If XNUM is 1, the single line is halfway between.  Otherwise,
%    the lines are evenly spaced, and include the endoints.
%
%    Input, real YMIN, YMAX, the minimum and maximum Y values.
%
%    Input, integer YNUM, the number of horizontal lines to draw.
%    If YNUM is 1, the single line is halfway between.  Otherwise,
%    the lines are evenly spaced, and include the endoints.
%

%
%  Here's a very pale gray.
%
  color = [ 0.85, 0.85, 0.85 ];
%   
%  Draw verticals.
%
  if ( xnum == 1 )
    x = ( xmin + xmax ) / 2;
    line ( [ x, x ], [ ymin, ymax ], 'Color', color );    
  else
    x = linspace ( xmin, xmax, xnum );
    for i = 1 : xnum
      line ( [ x(i), x(i) ], [ ymin, ymax ], 'Color', color );
    end
  end
%
%  Draw horizontals.
%
  if ( ynum == 1 )
    y = ( ymin + ymax ) / 2;
    line ( [ xmin, xmax ], [ y, y ], 'Color', color );    
  else
    y = linspace ( ymin, ymax, ynum );
    for i = 1 : ynum
      line ( [ xmin, xmax ], [ y(i), y(i) ], 'Color', color );
    end
  end

  return
end
