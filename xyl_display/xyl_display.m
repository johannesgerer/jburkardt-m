function xyl_display ( prefix )

%*****************************************************************************80
%
%% XYL_DISPLAY displays points and lines in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    xyl_display ( 'prefix' )
%
%    where 
%
%    'prefix.xy' contains the point coordinates
%    'prefix.xyl' contains lists of point indices forming lines.
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the two input files.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYL_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an XY file containing coordinates of points in 2D,\n' );
  fprintf ( 1, '  and an XYL file listing point indices forming lines.\n' );
  fprintf ( 1, '  Display the points and lines in a MATLAB graphics window.\n' );
%
%  First argument is the point file.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYL_DISPLAY:\n' );
    prefix = input ( '  Enter the common prefix of the XY and XYL files (in ''quotes''!).\n' );
  end
%
%  Read the XY data.
%
  xy_filename = strcat ( prefix, '.xy' );

  point_num = xy_header_read ( xy_filename );

  xy_header_print ( point_num );

  xy = xy_data_read ( xy_filename, point_num );
%
%  Read the XYL data.
%
  xyl_filename = strcat ( prefix, '.xyl' );

  [ line_num, line_data_num ] = xyl_header_read ( xyl_filename );

  xyl_header_print ( point_num, line_num, line_data_num );

  [ line_pointer, line_data ] = xyl_data_read ( xyl_filename, ...
    line_num, line_data_num );

  if ( 0 )

    xyl_data_print ( point_num, line_num, line_data_num, line_pointer, ...
      line_data );

  end
%
%  If necessary, move from 0-based indexing.
%
  if ( min ( line_data(1:line_data_num) ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Moving LINE_DATA from 0 base to 1 base.\n' );
    line_data(1:line_data_num) = line_data(1:line_data_num) + 1;
  end
%
%  Get the scale.
%
  xy_min(1) = min ( xy(1,:) );
  xy_max(1) = max ( xy(1,:) );

  xy_min(2) = min ( xy(2,:) );
  xy_max(2) = max ( xy(2,:) );

  xy_range(1:2) = xy_max(1:2) - xy_min(1:2);

  margin = 0.025 * max ( xy_range(1), xy_range(2) );

  x_min = xy_min(1) - margin;
  x_max = xy_max(1) + margin;
  y_min = xy_min(2) - margin;
  y_max = xy_max(2) + margin;
%
%  Draw the picture.
%
  point_size = 40;
  point_color = 'r';
  scatter ( xy(1,:), xy(2,:), point_size, point_color, 'filled' );

  for i = 1 : line_num
    for index = line_pointer(i) : line_pointer(i+1) - 2
      p = [ line_data(index), line_data(index+1) ];
      line ( xy(1,p), xy(2,p) );
    end
  end

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title_string = s_escape_tex ( prefix );
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max ] );
  axis equal

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYL_DISPLAY\n' );
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
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

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
function xy = xy_data_read ( input_filename, point_num )

%*****************************************************************************80
%
%% XY_DATA_READ reads data from an XY file.
%
%  Discussion:
%
%    The number of points in the file can be determined by calling
%    XY_HEADER_READ first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XY_DATA_READ - Error!' );
  end

  i = 0;
  xy = zeros ( 2, point_num );
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( i < point_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    temp = sscanf ( text, '%f %f' );

    i = i + 1;
    xy(1,i) = temp(1);
    xy(2,i) = temp(2);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xy_header_print ( point_num )

%*****************************************************************************80
%
%% XY_HEADER_PRINT prints the header of an XY file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
  fprintf ( 1, '\n');
  fprintf ( 1, '  Number of points = %d\n', point_num );

  return
end
function point_num = xy_header_read ( input_filename )

%*****************************************************************************80
%
%% XY_HEADER_READ determines the number of pairs of data in an XY file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    XY coordinates, which each contain one pair of real values.
%
%    The routine ignores comments and blank lines and returns
%    the number of lines containing XY coordinates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer POINT_NUM, the number of points in the file.
%
  point_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XY_HEADER_READ - Error!' );
  end
%
%  Read every line in the file.
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    sscanf ( text, '%f %f' );

    point_num = point_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function [ line_pointer, line_data ] = xyl_data_read ( input_filename, ...
  line_num, line_data_num )

%*****************************************************************************80
%
%% XYL_DATA_READ reads the data in an XYL file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    LINE ITEMS, which are indices of points on a line.
%
%    The routine ignores comments and blanks and returns
%    the number of line items.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
%    Output, integer LINE_POINTER(LINE_NUM+1), pointers to the
%    first line item for each line.
%
%    Output, integer LINE_DATA(LINE_DATA_NUM), the line items.
%
  line_pointer = zeros ( line_num + 1, 1 );
  line_data = zeros ( line_data_num, 1 );
  
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYL_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYL_DATA_READ - Error!' );
  end

  line = 0;
  line_pointer(1) = 1;
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( line < line_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    line = line + 1;

    n = s_word_count ( text );
    line_pointer(line+1) = line_pointer(line) + n;

    ilo = line_pointer(line);
    ihi = line_pointer(line+1) - 1;

    [ temp, count ] = sscanf ( text, '%d' );

    line_data(ilo:ihi) = temp(1:count);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xyl_header_print ( point_num, line_num, line_data_num )

%*****************************************************************************80
%
%% XYL_HEADER_PRINT prints the header of an XYL file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
  fprintf ( 1, '\n');
  fprintf ( 1, '  Number of points =     %d\n', point_num );
  fprintf ( 1, '  Number of lines =      %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  return
end
function [ line_num, line_data_num ] = xyl_header_read ( input_filename )

%*****************************************************************************80
%
%% XYL_HEADER_READ determines the number of line items in an XYL file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    LINE ITEMS, which are indices of points on a line.
%
%    The routine ignores comments and blanks and returns
%    the number of line items.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer LINE_NUM, the number of lines.
%
%    Output, integer LINE_DATA_NUM, the number of line items.
%
  line_data_num = 0;
  line_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYL_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYL_HEADER_READ - Error!' );
  end
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    n = s_word_count ( text );

    line_data_num = line_data_num + n;

    line_num = line_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
