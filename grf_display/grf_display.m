function grf_display ( prefix )

%*****************************************************************************80
%
%% GRF_DISPLAY displays a mathematical graph stored in a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    grf_display ( 'prefix' )
%
%    where
%
%    'prefix'.grf is the name of the GRF file to display.
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the input files.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRF_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a GRF file containing a description of an abstract graph.\n' );
  fprintf ( 1, '  Display the graph in a MATLAB graphics window.\n' );
%
%  If the user did not supply the prefix, request it.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_DISPLAY:\n' );
    prefix = input ( '  Enter the prefix of the GRF filename (in ''quotes''!).\n' );
  end
%
%  Read the GRF data.
%
  grf_filename = strcat ( prefix, '.grf' );

  [ node_num, edge_num ] = grf_header_read ( grf_filename );

  grf_header_print ( node_num, edge_num );

  [ edge_pointer, edge_data, xy ] = grf_data_read ( grf_filename, ...
    node_num, edge_num );
%
%  Convert the GRF data to XY, XYL data.
%
  line_num = 0;
  line_data_num = 0;
  line_pointer(1) = 1;

  for node_i = 1 : node_num
    for edge = edge_pointer(node_i) : edge_pointer(node_i+1) - 1

      node_j = edge_data(edge);

      line_data_num = line_data_num + 1;
      line_data(line_data_num) = node_i;
      line_data_num = line_data_num + 1;
      line_data(line_data_num) = node_j;

      line_num = line_num + 1;
      line_pointer(line_num+1) = line_data_num + 1;

    end
  end
%
%  Get the scale.
%
  xy_min(1) = min ( xy(1,:) );
  xy_max(1) = max ( xy(1,:) );

  xy_min(2) = min ( xy(2,:) );
  xy_max(2) = max ( xy(2,:) );

  xy_range(1:2) = xy_max(1:2) - xy_min(1:2);

  margin = 0.050 * max ( xy_range(1), xy_range(2) );

  x_min = xy_min(1) - margin;
  x_max = xy_max(1) + margin;
  y_min = xy_min(2) - margin;
  y_max = xy_max(2) + margin;
%
%  Draw the picture.
%
  clf
%
%  Draw the lines first.
%
  for i = 1 : line_num
    for index = line_pointer(i) : line_pointer(i+1) - 2
      p = [ line_data(index), line_data(index+1) ];
      line ( xy(1,p), xy(2,p), 'LineWidth', 2.0, 'Color', 'r' );
    end
  end
%
%  Hold the picture of the lines, and add the nodes.
%
  hold on

  point_size = 80;
  point_color = 'b';
  scatter ( xy(1,:), xy(2,:), point_size, point_color, 'filled' );
%
%  Annotate the graph.
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title_string = s_escape_tex ( prefix );
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max ] );
  axis equal
%
%  Suppress the axis markings, axis lines, and, unfortunately,
%  the white background.
%
  axis off
%
%  Restore the white background.
%
  set ( gcf, 'Color', 'White' )

  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRF_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ edge_pointer, edge_data, xy ] = grf_data_read ( input_filename, ...
  node_num, edge_num )

%*****************************************************************************80
%
%% GRF_DATA_READ reads the data of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Output, integer EDGE_POINTER(NODE_NUM+1), pointers to
%    the beginning of edge data for each node.
%
%    Output, integer EDGE_DATA(EDGE_NUM), the edge data.
%
%    Output, real XY(2,NODE_NUM), the node coordinates.
%
  edge_data(1:edge_num) = -1;
  edge_pointer(1:node_num+1) = -1;
  xy(1:2,1:node_num) = Inf;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'rt' );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'GRF_DATA_READ - Error!' );
  end
%
%  Read information about each node.
%
  edge = 0;
  edge_pointer(1) = 1;

  while ( 1 )

    text = fgets ( input_unit );

    if ( text == -1 )
      break;
    end

    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    [ temp, count ] = sscanf ( text, '%f' );

    node_i = temp(1);

    edge_pointer(node_i+1) = edge_pointer(node_i);
%
%  Extract the X, Y coordinates of the node.
%
    xy(1,node_i) = temp(2);
    xy(2,node_i) = temp(3);
%
%  Read the indices of the nodes to which the node is connected.
%
    for i = 4 : count

      edge = edge + 1;
      node_j = temp(i);
      edge_data(edge) = node_j;
      edge_pointer(node_i+1) = edge_pointer(node_i+1) + 1;

    end

  end

  fclose ( input_unit );

  return
end
function grf_header_print ( node_num, edge_num )

%*****************************************************************************80
%
%% GRF_HEADER_PRINT prints the header of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes NODE_NUM = %d\n', node_num );
  fprintf ( 1, '  The number of edges EDGE_NUM = %d\n', edge_num );

  return
end
function [ node_num, edge_num ] = grf_header_read ( input_filename )

%*****************************************************************************80
%
%% GRF_HEADER_READ reads the header of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer EDGE_NUM, the number of edges.
%

%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'GRF_HEADER_READ - Error!' );
  end
%
%  Read information about each node.
%
  node_num = 0;
  edge_num = 0;

  while ( 1 )

    text = fgets ( input_unit );

    if ( text == -1 )
      break;
    end

    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    word_num = s_word_count ( text );

    if ( word_num < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GRF_HEADER_READ - Fatal error!\n' );
      fprintf ( 1, '  Less than 3 items on an input line.\n' );
      error ( 'GRF_HEADER_READ - Fatal error!' );
    end

    node_num = node_num + 1;
    edge_num = edge_num + word_num - 3;

  end

  fclose ( input_unit );

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
