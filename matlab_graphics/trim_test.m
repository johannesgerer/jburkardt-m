function figure_num = trim_test ( figure_num )

%*****************************************************************************80
%
%% TRIM_TEST tries to make a plot without all that wasted margin.
%
%  Discussion:
%
%    Surprisingly, a typical MATLAB plot can involve a lot of empty
%    space.  In the simple case where you are plotting a circle, you
%    will get white space in the grid region itself if you enforce
%    equal axis units, since MATLAB wants to display the grid within
%    a rectangle.  But you will also get a substantial margin of white
%    space around the plot area itself.  This can be annoying when you
%    are trying to prepare graphics for use in a publication, or
%    if you want to put several images side by side - the white space,
%    which contains no information, eats up lots of space.
%
%    Can you cut back that white space?  In particular, if you want to
%    plot a circle (or anything else whose shape doesn't correspond to
%    MATLAB's "golden rectangle"), can you make an image that is
%    mathematically correct, and economic in terms of wasted white space?
%
%    You may try various combinations of "axis equal", "axis square",
%    "axis tight", "axis ( [0,1,0,1] )" and so on, all the time coming
%    halfway to your goal, without ever actually achieving an image 
%    that is square (or whatever aspect ratio you want), doesn't have 
%    wasted graph space, and doesn't have that excessive margin around 
%    the plot.
%
%    After wasting a lot of time, I stumbled across a few commands that,
%    used together, seem to achieve the correct result.  However, in my
%    case, the image still looks rectangular in the MATLAB interactive
%    viewer - but comes out nice and square in the PNG image rendered 
%    by the PRINT command.
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
  fprintf ( 1, 'TRIM_TEST\n' );
  fprintf ( 1, '  Try to suppress the wasted margin.\n' );
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
  gcf = figure ( figure_num );
  plot ( x, y, 'b-', 'LineWidth', 3 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'A circle drawn with the default aspect ratio and margin' )

  filename = 'trim_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file "%s".\n', filename );
%
%  Plot the circle again, using commands I DON'T REALLY UNDERSTAND.
%  But they do seem to result in a PNG image that has lost the margin junk.
%
  figure_num = figure_num + 1;
  gcf = figure ( figure_num );

  set ( gcf, 'PaperUnits', 'inches','PaperPosition', [0, 0, 10, 10] );
  pbaspect ( [ 1.0, 1.0, 1.0 ] );
  set ( gcf, 'Units', 'normal' );
  set ( gca, 'Position', [ 0.05, 0.05, 0.90, 0.90 ] )
 
  plot ( x, y, 'r-', 'LineWidth', 3 );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'A circle drawn with white space trimmed' )

  filename = 'trim_test02.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Saved graphics file "%s".\n', filename );

  return
end

