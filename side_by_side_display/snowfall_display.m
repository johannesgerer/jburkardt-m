function snowfall_display ( )

%*****************************************************************************80
%
%% SNOWFALL_DISPLAY plots yearly snowfall data side by side.
%
%  Discussion:
%
%    The file "snowfall.txt" contains snowfall records.
%    Each line contains the year, the snowfall in inches for 8 months, and 
%    the total.
%
%    We want to plot the yearly snowfall curves for 2000 through 2010,
%    side by side in a 3D plot.
%
%    We can use PLOT3(X,Y,Z) to plot a single 3D curve.
%
%    We can use HOLD ON / HOLD OFF to force multiple 3D curves to appear
%    together.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SNOWFALL_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate how to display several curves side by side.\n' );
  fprintf ( 1, '  Here, each curve represents snowfall over a given year.\n' );
%
%  Load all the snowfall data.
%
  data = load ( 'snowfall.txt' );
%
%  Column 1 contains the years.
%
  years = data ( :, 1 );
  offset = years(1) - 1;
%
%  Columns 2 through 9 are snowfall amounts.
%
  snow = data ( :, 2:9);
%
%  Column 10 is the snowfall total.
%
  total = data ( :, 10 );
%
%  Create figure #1 and clear it.
%
  figure ( 1 )
  clf
%
%  Call HOLD ON so multiple curves share one image.
%
%  Call PLOT3 to draw each snowfall curve.
%  
  hold on
  for year = 2000 : 2010
    x(1:8) = year;
    y(1:8) = ( 1 : 8 );
    z(1:8) = snow(year-offset,1:8);
    plot3 ( x, y, z, 'Linewidth', 3 );
  end
%
%  Annotate the plot.
%
  grid on
  xlabel ( 'Year' );
  ylabel ( 'Month' );
  set ( gca, 'yTick', 1 : 8 );
  set ( gca, 'yTickLabel', { 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May' } );
  zlabel ( 'Inches of Snow' );
  title ( 'Michigan Tech Snowfall Records', 'Fontsize', 16 );
%
%  Set the 3D viewing angles in degrees.
%
  azimuth = 45.0;
  elevation = 35.0;
  view ( azimuth, elevation );
%
%  Call HOLD OFF because we are done concatenating plots.
%
  hold off
%
%  Save a copy of the plot as a PNG file.
%
  filename = 'snowfall.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PNG image saved as "%s"\n', filename );

  return
end

