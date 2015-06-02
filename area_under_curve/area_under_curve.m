function area_under_curve ( x1, x2, f, header )

%*****************************************************************************80
%
%% AREA_UNDER_CURVE displays the area "under the curve" for a given function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, X2, the left and right limits for X.
%
%    Input, function handle F, a handle for the function, which should
%    have the form "function value = f ( x )" where the input X can
%    be a vector.
%
%    Optional input, string HEADER, a title for the plot.  
%

%
%  Sample the X range, and evaluate the function.
%
  x = linspace ( x1, x2, 501 );
  y = f ( x );
%
%  Create a figure window, clear it, and prepare to receive
%  several plot commands.
%
  figure ( 1 )
  clf
  hold on
%
%  Plot the polygonal shape defined by points on the curve, plus
%  the first and last points of the X axis.
%
  h = fill ( [ x, x(end), x(1) ], ...
             [ y, 0.0,    0.0  ], ...
             [ 0.0, 1.0, 0.0 ] );
%
%  Make the filled object semi-transparent.
%
  set ( h, 'EdgeColor', 'none', 'FaceAlpha', 0.3 );
%
%  Plot the X axis in black.
%
  plot ( [x1, x2 ], [ 0.0, 0.0 ], 'k-', 'LineWidth', 3 );
%
%  Plot the curve itself in red.
%
  plot ( x, y, 'r-', 'LineWidth', 3 );
%
%  Annotate the graph.
%
  grid on
  if ( nargin < 3 )
    header = 'Area under the curve Y = F(X)'
  end
  title ( header, 'Fontsize', 24 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y = F(X) --->' );
%
%  Release the "hold"
%
  hold off
%
%  Save a copy of the plot.
%
  filename = 'area_under_curve.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved in file "%s"\n', filename );

  return
end

