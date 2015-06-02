function circle_grid_display ( filename )

%*****************************************************************************80
%
%% CIRCLE_GRID_DISPLAY plots a grid of circles.
%
%  Discussion:
%
%    Input is a file containing M rows and N columns of integers, typically
%    0's and 1's.
%
%    The program will display a grid of circles filled with color
%    0: white
%    1: red
%    2: green
%    3: blue
%    4: cyan
%    5: yellow
%    6: magenta
%    7: black
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_GRID_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Display a grid of circles.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    filename = input ( '  Enter name of circle grid datafile in quotes: ' );
  end
%
%  Read data from file.
%
  c = load ( filename );
  [ m, n ] = size ( c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circle grid is %d rows by %d columns.\n', m, n );
%
%  Plot the circles.
%
  clf

  hold on
  r = 0.45;

  for j = 1 : n
    x = j - 0.5;
    for i = 1 : m
      y = m + 0.5 - i;
      if ( c(i,j) == 0 )
        circle_filled ( x, y, r, 'white' );
      elseif ( c(i,j) == 1 )
        circle_filled ( x, y, r, 'red' );
      elseif ( c(i,j) == 2 )
        circle_filled ( x, y, r, 'green' );
      elseif ( c(i,j) == 3 )
        circle_filled ( x, y, r, 'blue' );
      elseif ( c(i,j) == 4 )
        circle_filled ( x, y, r, 'cyan' );
      elseif ( c(i,j) == 5 )
        circle_filled ( x, y, r, 'yellow' );
      elseif ( c(i,j) == 6 )
        circle_filled ( x, y, r, 'magenta' );
      else
        circle_filled ( x, y, r, 'black' );
      end
    end
  end

  title_string = s_escape_tex ( filename );
  title ( title_string )
  axis ( [ 0, n, 0, m ] )
  axis equal
  axis square
  axis tight
%
%  There must be a better way to suppress the tickmarks, but I'll
%  let you go mad trying to find it in the MATLAB graphics documentation.
%
  set ( gca, 'XTick', [], 'YTick', [] )
  grid on
  hold off
%
%  Save a copy of the image to a PNG file.
%
  plot_filename = filename_ext_swap ( filename, 'png' );
  print ( '-dpng', plot_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', plot_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_GRID_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function circle_filled ( x, y, r, color )

%*****************************************************************************80
%
%% CIRCLE_FILLED draws a filled circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the center of the circle.
%
%    Input, real R, the radius of the circle.
%
%    Input, string COLOR, the color of the circle.
%
  ang = 0 : 0.05 : 1.0; 
  xp = x + r * cos ( 2.0 * pi * ang );
  yp = y + r * sin ( 2.0 * pi * ang );
  h = fill ( xp, yp, color );

  return
end
function filename_new = filename_ext_swap ( filename, ext )

%*****************************************************************************80
%
%% FILENAME_EXT_SWAP replaces the current "extension" of a file name.
%
%  Discussion:
%
%    The "extension" of a filename is the string of characters
%    that appears after the LAST period in the name.  A file
%    with no period, or with a period as the last character
%    in the name, has a "null" extension.
%
%  Example:
%
%          Input           Output
%    ================     =============
%    FILENAME     EXT     FILENAME_NEW
%    
%    bob.for      obj     bob.obj
%    bob.bob.bob  txt     bob.bob.txt
%    bob          yak     bob.yak
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, a file name.
%    On output, the extension of the file has been changed.
%
%    Input, string EXT, the extension to be used on the output
%    copy of FILE_NAME, replacing the current extension if any.
%
%    Output, string FILENAME_NEW, a copy of the input file name,
%    with the new extension.
%
  filename_len = length ( filename );

  ext_len = length ( ext );

  period = filename_len + 1;

  for i = filename_len : -1 : 1
    if ( filename(i:i) == '.' )
      period = i;
      break
    end
  end

  filename_new(1:period-1) = filename(1:period-1);
  filename_new(period) = '.';
  filename_new(period+1:period+ext_len) = ext(1:ext_len);

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

    if ( s1(s1_pos) == '\' || ...
         s1(s1_pos) == '_' || ...
         s1(s1_pos) == '^' || ...
         s1(s1_pos) == '{' || ...
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