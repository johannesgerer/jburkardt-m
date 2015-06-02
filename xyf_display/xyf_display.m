function xyf_display ( prefix )

%*****************************************************************************80
%
%% XYF_DISPLAY displays points and faces in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    xyf_display ( 'prefix' )
%
%    where 
%
%    'prefix.xy' contains the point coordinates
%    'prefix.xyf' contains lists of point indices forming faces.
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the two input files.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYF_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an XY file containing coordinates of points in 2D,\n' );
  fprintf ( 1, '  and an XYF file listing point indices forming faces.\n' );
  fprintf ( 1, '  Display the points and faces in a MATLAB graphics window.\n' );
%
%  First argument is the file prefix.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYF_DISPLAY:\n' );
    prefix = input ( '  Enter the common prefix of the XY and XYF files (in ''quotes''!).\n' );
  end
%
%  Read the XY data.
%
  xy_filename = strcat ( prefix, '.xy' );

  point_num = xy_header_read ( xy_filename );

  xy_header_print ( point_num );

  xy = xy_data_read ( xy_filename, point_num );
%
%  Read the XYF data.
%
  xyf_filename = strcat ( prefix, '.xyf' );

  [ face_num, face_data_num ] = xyf_header_read ( xyf_filename );

  xyf_header_print ( point_num, face_num, face_data_num );

  [ face_pointer, face_data ] = xyf_data_read ( xyf_filename, ...
    face_num, face_data_num );

  if ( 0 )

    xyf_data_print ( point_num, face_num, face_data_num, face_pointer, ...
      face_data );

  end
%
%  If necessary, move from 0-based indexing.
%
  if ( min ( face_data(1:face_data_num) ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Moving FACE_DATA from 0 base to 1 base.\n' );
    face_data(1:face_data_num) = face_data(1:face_data_num) + 1;
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
  face_color = 'g';

  for face = 1 : face_num
    index = face_pointer(face) : face_pointer(face+1) - 1;
    p = face_data(index);
    patch ( xy(1,p), xy(2,p), face_color );
  end

  line_color = 'r';

  for face = 1 : face_num
    index = [face_pointer(face) : face_pointer(face+1) - 1, face_pointer(face)];
    p = face_data(index);
    line ( 'XData', xy(1,p), 'YData', xy(2,p), 'Color', line_color );
  end
%
%  May I take a moment hear to complain that MATLAB's graphic capabilities
%  are awkward and poorly documented?  You can draw a line, if you work hard
%  at it.  But can you draw a point?  Nope!  
%
  hold on

  point_size = 40;
  point_color = 'b';
  scatter ( xy(1,:), xy(2,:), point_size, point_color, 'filled' );

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

  hold off
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYF_DISPLAY\n' );
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
         s1(s1_pos) == '}'  )
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
function [ face_pointer, face_data ] = xyf_data_read ( input_filename, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYF_DATA_READ reads the data in an XYF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face, or -1 to terminate a face.
%
%    The routine ignores comments and blanks and returns
%    the number of face items.
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
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
%    Output, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Output, integer FACE_DATA(FACE_DATA_NUM), the face items.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYF_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYF_DATA_READ - Error!' );
  end

  num = 0;
  face_pointer = zeros ( face_num + 1, 1 );
  face_data = zeros ( face_data_num, 1 );
  face_pointer(1) = 1;
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( num < face_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    num = num + 1;

    n = s_word_count ( text );
    face_pointer(num+1) = face_pointer(num) + n;

    ilo = face_pointer(num);
    ihi = face_pointer(num+1) - 1;

    [ temp, count ] = sscanf ( text, '%d' );

    face_data(ilo:ihi) = temp(1:count);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xyf_header_print ( point_num, face_num, face_data_num )

%*****************************************************************************80
%
%% XYF_HEADER_PRINT prints the header of an XYF file.
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
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
  fprintf ( 1, '\n');
  fprintf ( 1, '  Number of points =     %d\n', point_num );
  fprintf ( 1, '  Number of faces =      %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  return
end
function [ face_num, face_data_num ] = xyf_header_read ( input_filename )

%*****************************************************************************80
%
%% XYF_HEADER_READ determines the number of face items in an XYF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face, or -1 to terminate a face.
%
%    The routine ignores comments and blanks and returns
%    the number of face items.
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
%    Output, integer FACE_NUM, the number of faces.
%
%    Output, integer FACE_DATA_NUM, the number of face items.
%
  face_data_num = 0;
  face_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYF_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYF_HEADER_READ - Error!' );
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

    face_data_num = face_data_num + n;

    face_num = face_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
