function grid_display ( input_filename, rmin, rmax )

%*****************************************************************************80
%
%% GRID_DISPLAY displays a 2D or 3D grid or sparse grid.
%
%  Usage:
%
%    grid_display ( input_filename, rmin, rmax )
%
%    where
%
%    * 'file_name' is the name of the file containing the data points.
%
%    * rmin, rmax is the range in X, Y (and possibly Z) over which the plot
%      is to be displayed.  This is typically either [-1,1] or [0,1].
%      Some grids don't include points on the boundary, so it is useful
%      to be able to specify the plot range, and thus force the boundaries
%      to show up, and to show up "in the same place" for multiple plots.
%      Also, this feature allows you to zoom in on part of the grid, if
%      you wish.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2014
%
%  Author:
%
%    John Burkardt
%
  verbose = 0;

  if ( verbose )
    timestamp ( );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY:\n' );
    fprintf ( 1, '  MATLAB version\n' );
    fprintf ( 1, '  Display a 2D or 3D grid of points.\n' );
  end
%
%  First command line argument is the file name.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY:\n' );
    input_filename = input ( 'Enter the point coordinate filename in quotes:  ' );
  end
%
%  Second command line argument is the lower range.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY:\n' );
    rmin = input ( 'Enter the minimum value of the range: ' );
  elseif ( ischar ( rmin ) )
    rmin = str2num ( rmin );
  end
%
%  Third command line argument is the upper range.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY:\n' );
    rmax = input ( 'Enter the maximum value of the range: ' );
  elseif ( ischar ( rmax ) )
    rmax = str2num ( rmax );
  end

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Range = [%f,%f]\n', rmin, rmax );
  end
%
%  Load the data.
%
  points = load ( input_filename )';

  dim_num = size ( points, 1 );
  point_num = size ( points, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM  = %d\n', dim_num );
  fprintf ( 1, '  Number of points POINT_NUM = %d\n', point_num );
%
%  1D Plot
%
  if ( dim_num == 1 )
%
%  Clear the graphics frame;
%
    clf
%
%  We have to name the axes in order to control the grid.
%
    axes_handle = axes;
%
%  Plot the points.
%  The value "100" controls the size of the dots.
%  If this value is omitted, a default size is used.
%
    points(2,1:point_num) = 0.0;

    markersize = 100;
    handle = scatter ( points(1,:), points(2,:), markersize, 'b', 'filled' );
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
    rdelt = ( rmax - rmin ) / 10.0;
    ticks = rmin : rdelt : rmax;

    set ( axes_handle, 'xtick', ticks );
    set ( axes_handle, 'ytick', 0 );
    set ( axes_handle, 'yticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
    range = rmax - rmin;
    rmin1 = rmin - 0.05 * range;
    rmax1 = rmax + 0.05 * range;
    axis ( [ rmin1, rmax1, rmin1, rmax1 ] )

    xlabel ( '<--- X --->', 'Fontsize', 16 )
%
%  Title
%
    title_string = s_escape_tex ( input_filename );
    title ( title_string, 'Fontsize', 24 );

    filename = 'grid_1d.png';
    print ( '-dpng', filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Plot saved as graphics file "%s"\n', filename );
%
%  2D Plot
%
  elseif ( dim_num == 2 )
%
%  Clear the graphics frame;
%
    clf
%
%  We have to name the axes in order to control the grid.
%
    axes_handle = axes;
%
%  Plot the points.
%  The value "100" controls the size of the dots.
%  If this value is omitted, a default size is used.
%
    if ( point_num < 50 )
      markersize = 60;
    elseif ( point_num < 200 )
      markersize = 30;
    else
      markersize = 15;
    end

    handle = scatter ( points(1,:), points(2,:), markersize, 'b', 'filled' );
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
    rdelt = ( rmax - rmin ) / 10.0;
    ticks = rmin : rdelt : rmax;

    set ( axes_handle, 'xtick', ticks );
%   set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', ticks );
%   set ( axes_handle, 'yticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
    range = rmax - rmin;
    rmin1 = rmin - 0.05 * range;
    rmax1 = rmax + 0.05 * range;
    axis ( [ rmin1, rmax1, rmin1, rmax1 ] )

    xlabel ( '<-- X --->', 'Fontsize', 16 )
    ylabel ( '<-- Y --->', 'Fontsize', 16 )
%
%  Title
%
    title_string = s_escape_tex ( input_filename );
    title ( title_string, 'Fontsize', 24 );

    filename = 'grid_2d.png';
    print ( '-dpng', filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Plot saved as graphics file "%s"\n', filename );
%
%  3D plot
%
  elseif ( dim_num == 3 )
%
%  Clear the graphics frame;
%
    clf
%
%  We have to name the axes in order to control the grid.
%
    axes_handle = axes;
%
%  Plot the points.
%
    if ( point_num < 50 )
      markersize = 60;
    elseif ( point_num < 200 )
      markersize = 30;
    else
      markersize = 15;
    end

    handle = scatter3 ( points(1,:), points(2,:), points(3,:), markersize, 'b', 'filled' );
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
    rdelt = ( rmax - rmin ) / 10.0;
    ticks = rmin : rdelt : rmax;

    set ( axes_handle, 'xtick', ticks );
%   set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', ticks );
%   set ( axes_handle, 'yticklabel', [] );
    set ( axes_handle, 'ztick', ticks );
%   set ( axes_handle, 'zticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
    range = rmax - rmin;
    rmin1 = rmin - 0.05 * range;
    rmax1 = rmax + 0.05 * range;
    axis ( [ rmin1, rmax1, rmin1, rmax1 ] )

    xlabel ( '<--X --->', 'Fontsize', 16 )
    ylabel ( '<--Y --->', 'Fontsize', 16 )
    zlabel ( '<--Z --->', 'Fontsize', 16 )
%
%  Title
%
    title_string = s_escape_tex ( input_filename );
    title ( title_string, 'Fontsize', 24 );

    view ( -10, 15 )

    filename = 'grid_3d.png';
    print ( '-dpng', filename );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Plot saved as graphics file "%s"\n', filename );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Either your data was not 2D or 3D,\n' );
    fprintf ( 1, '  or this program could not interpret your data correctly.\n' );
    fprintf ( 1, '  No plot was created.\n' );

  end
%
%  Terminate.
%
  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_DISPLAY:\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    fprintf ( 1, '\n' );
    timestamp ( );
  end

  return
end
function s2 = s_escape_tex ( s1 )

%*****************************************************************************80
%
%% S_ESCAPE_TEX de-escapes TeX escape sequences.
%
%  Discussion:
%
%    In particular, every occurrence of the characters '\', '_',
%    '^', '{' and '}' will be replaced by '\\', '\_', '\^',
%    '\{' and '\}'.  A TeX interpreter, on seeing these character
%    strings, is then likely to return the original characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the string to be de-escaped.
%
%    Output, string S2, a copy of the string, modified to avoid TeX escapes.
%
  s1_length = length ( s1 );

  s1_pos = 0;
  s2_pos = 0;
  s2 = [];

  while ( s1_pos < s1_length )

    s1_pos = s1_pos + 1;

    if ( s1(s1_pos) == '\' | ...
         s1(s1_pos) == '_' | ...
         s1(s1_pos) == '^' | ...
         s1(s1_pos) == '{' | ...
         s1(s1_pos) == '}' )
      s2_pos = s2_pos + 1;
      s2 = strcat ( s2, '\' );
    end

    s2_pos = s2_pos + 1;
    s2 = strcat ( s2, s1(s1_pos) );

  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
