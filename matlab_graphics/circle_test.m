function figure_num = circle_test ( figure_num )

%*****************************************************************************80
%
%% CIRCLE_TEST plots a circle with and without the "axis equal" command.
%
%  Discussion:
%
%    You plot a circle, and it comes out an ellipse.  What is going on?
%    Briefly, MATLAB uses a rectangle to display your plot.  It takes
%    the X and Y ranges of your data, and stretches them along the horizontal
%    and vertical directions of the rectangle.  This guarantees that a
%    plot that is logically square will be displayed as a rectangle, 
%    and thus a circle becomes an ellipse.  Luckily, the "axis equal"
%    command helps.  MATLAB still plots inside a rectangle, but now
%    it stretches your X and Y data by the same single scale factor,
%    resulting in some new white space to the left and right of your
%    plot of a perfect circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2013
%
%  Author:
%
%    John Burkardt
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_TEST\n' );
  fprintf ( 1, '  Demonstrate why the "axis equal" command is useful.\n' );
%
%  Set up the circle data once.
%
  r = 1.0;
  theta = linspace ( 0.0, 2.0 * pi, 121 );
  x = r * cos ( theta );
  y = r * sin ( theta );
%
%  Plot the circle with the default axis.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  plot ( x, y, 'b-', 'LineWidth', 3 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'A circle drawn with the default axis' )

  filename = 'circle_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file "%s".\n', filename );
%
%  Plot the circle with the equal axis mapping.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  plot ( x, y, 'r-', 'LineWidth', 3 );
  axis equal
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'A circle drawn with "axis equal" command' )

  filename = 'circle_test02.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved graphics file "%s".\n', filename );

  return
end

