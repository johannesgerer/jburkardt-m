function xyzf_display ( prefix )

%*****************************************************************************80
%
%% XYZF_DISPLAY displays points and faces in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    xyzf_display ( 'prefix' )
%
%    where 
%
%    'prefix.xyz' contains the point coordinates
%    'prefix.xyzf' contains lists of point indices forming faces.
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the two input files.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZF_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an XYZ file containing coordinates of points in 3D,\n' );
  fprintf ( 1, '  and an XYZF file listing point indices forming faces.\n' );
  fprintf ( 1, '  Display the points and faces in a MATLAB graphics window.\n' );
%
%  First argument is the point file.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZF_DISPLAY:\n' );
    prefix = input ( '  Enter the common prefix of the XYZ and XYZF files (in ''quotes''!).\n' );
  end
%
%  Read the XYZ data.
%
  xyz_filename = strcat ( prefix, '.xyz' );

  node_num = xyz_header_read ( xyz_filename );

  xyz_header_print ( node_num );

  xyz = xyz_data_read ( xyz_filename, node_num );
%
%  Read the XYZF data.
%
  xyzf_filename = strcat ( prefix, '.xyzf' );

  [ face_num, face_data_num ] = xyzf_header_read ( xyzf_filename );

  xyzf_header_print ( node_num, face_num, face_data_num );

  [ face_pointer, face_data ] = xyzf_data_read ( xyzf_filename, ...
    face_num, face_data_num );

  if ( 0 )

    xyzf_data_print ( node_num, face_num, face_data_num, face_pointer, ...
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
  xyz_min(1) = min ( xyz(1,:) );
  xyz_max(1) = max ( xyz(1,:) );

  xyz_min(2) = min ( xyz(2,:) );
  xyz_max(2) = max ( xyz(2,:) );

  xyz_min(3) = min ( xyz(3,:) );
  xyz_max(3) = max ( xyz(3,:) );

  xyz_range(1:3) = xyz_max(1:3) - xyz_min(1:3);

  margin = 0.025 * max ( xyz_range(1), ...
                   max ( xyz_range(2), xyz_range(3) ) );

  x_min = xyz_min(1) - margin;
  x_max = xyz_max(1) + margin;
  y_min = xyz_min(2) - margin;
  y_max = xyz_max(2) + margin;
  z_min = xyz_min(3) - margin;
  z_max = xyz_max(3) + margin;
%
%  Before we begin plotting, create a figure.
%
  figure ( 1 )
  clf
%
%  Display the faces and edges.
%
  face_color = 'blue';

  for face = 1 : face_num
    index = face_pointer(face) : face_pointer(face+1) - 1;
    p = face_data(index);
    patch ( xyz(1,p), xyz(2,p), xyz(3,p), face_color, 'FaceAlpha', 0.1, ...
      'EdgeColor', 'r', 'LineWidth', 2.0 );
  end
%
%  Display the points.
%
  hold on

  plot3 ( xyz(1,1:node_num), xyz(2,1:node_num), xyz(3,1:node_num), 'o', ...
    'markersize', 8, 'markerfacecolor', 'black' )

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title_string = s_escape_tex ( prefix );
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max, z_min, z_max ] );
  axis equal

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZF_DISPLAY\n' );
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

  s_length = s_len_trim ( s );

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
function xyz = xyz_data_read ( input_filename, node_num )

%*****************************************************************************80
%
%% XYZ_DATA_READ reads data from an XYZ file.
%
%  Discussion:
%
%    The number of points in the file can be determined by calling
%    XYZ_HEADER_READ first.
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
%    Output, real XYZ(3,POINT_NUM), the point coordinates.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZ_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'XYZ_DATA_READ - Error!' );
  end

  i = 0;
  xyz = zeros ( 3, node_num );
%
%  Use FGETL, not FGETS, as we don't want the NEWLINE character.
%
  while ( i < node_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    temp = sscanf ( text, '%f %f %f' );

    i = i + 1;
    xyz(1,i) = temp(1);
    xyz(2,i) = temp(2);
    xyz(3,i) = temp(3);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xyz_header_print ( node_num )

%*****************************************************************************80
%
%% XYZ_HEADER_PRINT prints the header of an XYZ file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2009
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
  fprintf ( 1, '  Number of points = %d\n', node_num );

  return
end
function node_num = xyz_header_read ( input_filename )

%*****************************************************************************80
%
%% XYZ_HEADER_READ determines the number of points in an XYZ file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    XYZ coordinates, which each contain one set of real values.
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
  node_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZ_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYZ_HEADER_READ - Error!' );
  end
%
%  Read every line in the file.
%  Use FGETL, not FGETS, as we don't want the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end

    if ( length ( text ) < 1 )
      continue
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    sscanf ( text, '%f %f %f' );

    node_num = node_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xyzf_data_print ( node_num, face_num, face_data_num, ...
  face_pointer, face_data )

%*****************************************************************************80
%
%% XYZF_DATA_PRINT prints the data of an XYZF file.
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
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
%    Input, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Input, integer FACE_DATA(FACE_DATA_NUM), indices
%    of points that form faces.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );
  fprintf ( 1, '  Number of face data items = %d\n', face_data_num );
  fprintf ( 1, '\n' );
  for face = 1 : face_num
    fprintf ( 1, '  %4d  %8d  %8d\n', ...
      face, face_pointer(face) : face_pointer(face+1) - 1 );
  end

  fprintf ( 1, '\n' );
  for face = 1 : face_num
    for i = face_pointer(face) : face_pointer(face+1) - 1
      fprintf ( 1, '  %d', face_data(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
function [ face_pointer, face_data ] = xyzf_data_read ( input_filename, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYZF_DATA_READ reads the data in an XYZF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face.
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
  face_data = zeros ( face_data_num, 1 );
  face_pointer = zeros ( face_num + 1, 1 );
  
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZF_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYZF_DATA_READ - Error!' );
  end

  face = 0;
  face_pointer(1) = 1;
%
%  Use FGETL, not FGETS, because we don't want the NEWLINE character.
%
  while ( face < face_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    face = face + 1;

    n = s_word_count ( text );
    face_pointer(face+1) = face_pointer(face) + n;

    ilo = face_pointer(face);
    ihi = face_pointer(face+1) - 1;

    [ temp, count ] = sscanf ( text, '%d' );

    face_data(ilo:ihi) = temp(1:count);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function xyzf_header_print ( node_num, face_num, face_data_num )

%*****************************************************************************80
%
%% XYZF_HEADER_PRINT prints the header of an XYZF file.
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
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
  fprintf ( 1, ' \n');
  fprintf ( 1, '  Number of points =     %d\n', node_num );
  fprintf ( 1, '  Number of faces =      %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  return
end
function [ face_num, face_data_num ] = xyzf_header_read ( input_filename )

%*****************************************************************************80
%
%% XYZF_HEADER_READ determines the number of face items in an XYZF file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    FACE ITEMS, which are indices of points on a face.
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
    fprintf ( 1, 'XYZF_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYZF_HEADER_READ - Error!' );
  end
%
%  Call FGETL, not FGETS, as we don't want the NEWLINE character.
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
