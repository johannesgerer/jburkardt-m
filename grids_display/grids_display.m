function grids_display ( input_file_name1, input_file_name2, rmin, rmax )

%*****************************************************************************80
%
%% GRIDS_DISPLAY displays two 2D or 3D grids or sparse grids.
%
%  Discussion:
%
%    The points of the first grid will be blue, the second red.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDS_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display a pair of 2D or 3D grids or sparse grids.\n' );
%
%  First command line argument is file name1.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY:\n' );
    input_file_name1 = input ( 'Enter the first filename:' );

  end
%
%  Second command line argument is file name2.
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY:\n' );
    input_file_name2 = input ( 'Enter the second filename:' );

  end
%
%  Third command line argument is the lower range.
%
  if ( nargin < 3 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY:\n' );
    rmin = input ( 'Enter the minimum value of the range:' );

  end
%
%  Fourth command line argument is the upper range.
%
  if ( nargin < 4 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY:\n' );
    rmax = input ( 'Enter the maximum value of the range:' );

  end
%
%  Load the data.
%  
  points1 = load ( input_file_name1 )';

  dim_num1 = size ( points1, 1 );
  point_num1 = size ( points1, 2 );

  points2 = load ( input_file_name2 )';

  dim_num2 = size ( points2, 1 );
  point_num2 = size ( points2, 2 );

  if ( dim_num1 ~= dim_num2 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimensions differ.\n' );
    error ( 'GRIDS_DISPLAY - Fatal error' );
  else
    dim_num = dim_num1;
  end
%
%  2D Plot
%
  if ( dim_num == 2 )
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
    h1 = scatter ( points1(1,:), points1(2,:), 'bo' );
    hold on
    h2 = scatter ( points2(1,:), points2(2,:), 'r', 'filled' );
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
    rdelt = ( rmax - rmin ) / 8.0;
    ticks = rmin : rdelt : rmax;
  
    set ( axes_handle, 'xtick', ticks );
    set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', ticks );
    set ( axes_handle, 'yticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
    range = rmax - rmin;
    rmin1 = rmin - 0.05 * range;
    rmax1 = rmax + 0.05 * range;
    axis ( [ rmin1, rmax1, rmin1, rmax1 ] )

    xlabel ( '--X axis--' )
    ylabel ( '--Y axis--' )
%
%  Title
%
    title_string = strcat ( input_file_name1, ' + ' );
    title_string = strcat ( title_string, input_file_name2 );
    title_string = s_escape_tex ( title_string );
    title ( title_string );
%
%  Make an output file name.
%
    output_file_name = 'grids_display.png';
%
%  Save the figure and write it out.
%
    frame = getframe;
    [ image, map ] = frame2im ( frame );

    imwrite ( image, output_file_name, 'PNG' );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY\n' );
    fprintf ( 1, '  The input data "%s" and "%s" was read in, and plotted\n', ...
      input_file_name1, input_file_name2 );
    fprintf ( 1, '  in the PNG file "%s".\n', output_file_name );
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
    handle1 = scatter3 ( points1(1,:), points1(2,:), points1(3,:), ...
      'b', 'filled' );
    hold on
    handle2 = scatter3 ( points2(1,:), points2(2,:), points2(3,:), ...
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
    rdelt = ( rmax - rmin ) / 8.0;
    ticks = rmin : rdelt : rmax;
  
    set ( axes_handle, 'xtick', ticks );
    set ( axes_handle, 'xticklabel', [] );
    set ( axes_handle, 'ytick', ticks );
    set ( axes_handle, 'yticklabel', [] );
    set ( axes_handle, 'ztick', ticks );
    set ( axes_handle, 'zticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
    range = rmax - rmin;
    rmin1 = rmin - 0.05 * range;
    rmax1 = rmax + 0.05 * range;
    axis ( [ rmin1, rmax1, rmin1, rmax1 ] )

    xlabel ( '--X axis--' )
    ylabel ( '--Y axis--' )
    zlabel ( '--Z axis--' )
%
%  Title
%
    title_string = strcat ( input_file_name1, ' + ' );
    title_string = strcat ( title_string, input_file_name2 );
    title_string = s_escape_tex ( title_string );
    title ( title_string );
    
    view ( -10, 15 )
%
%  Make an output file name.
%
    output_file_name = 'grids_display.png';
%
%  Save the figure and write it out.
%
    frame = getframe;
    [ image, map ] = frame2im ( frame );

    imwrite ( image, output_file_name, 'PNG' );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRIDS_DISPLAY\n' );
    fprintf ( 1, '  The input data "%s" and "%s" was read in, and plotted\n', ...
      input_file_name1, input_file_name2 );
    fprintf ( 1, '  in the PNG file "%s".\n', output_file_name );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDS_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
