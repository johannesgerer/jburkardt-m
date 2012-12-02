function neighbors_to_metis_graph ( input_neighbor_file_name )

%*****************************************************************************80
%
%% MAIN is the main program for NEIGHBORS_TO_METIS_GRAPH.
%
%  Discussion:
%
%    A neighbor file (from e.g. triangulation_triangle_neighbor or 
%    tet_mesh_neighbors ) is read, and an output graph file is written in the
%    format used by METIS.
%
%    From this point, one may call either
%
%      pmetis graph_file NPARTS
%
%    or
%
%      kmetis graph_file NPARTS
%
%    Here, NPARTS is the number of parts in the partition.
%
%    PMETIS is recommended for NPARTS < 8, and KMETIS for 8 <= NPARTS.
%
%  Usage:
%
%    neighbors_to_metis_graph ( file.neighbors )
%
%  Modified:
%
%    15 October 2008
%
%  Authors:
%
%    Jeff Borggaard, John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEIGHBORS_TO_METIS_GRAPH:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write triangle or tet mesh neighbors in MeTiS graph file format.\n' );
%
%  If at least one command line argument, it's the neighbor file name.
%
  if ( nargin < 1 ) 
    input_neighbor_file_name = input ( ... 
      '  Please enter the name of the neighbor file.' );
  end
%
%  Read the data.
%
  [ element_faces, element_num ] = i4mat_header_read ( input_neighbor_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', input_neighbor_file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of element faces = %d\n', element_faces );
  fprintf ( 1, '  Number of elements      = %d\n', element_num );

  if ( element_faces ~= 3 && element_faces ~= 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NEIGHBORS_TO_METIS_GRAPH - Fatal error!\n' );
    fprintf ( 1, '  Each element must have 3 or 4 faces.\n' );
    error ( 'NEIGHBORS_TO_METIS_GRAPH - Fatal error!' );
  end

  element_neighbor = i4mat_data_read ( input_neighbor_file_name, ...
    element_faces, element_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', input_neighbor_file_name );

  i4mat_transpose_print_some ( element_faces, element_num, ...
    element_neighbor, 1, 1, element_faces, 10, ...
    '  Portion of ELEMENT_NEIGHBOR:' );
%
%  Write the neighbor information to a file.
%  Create the output file name from the input file name.
%
  output_metis_graph_file_name = file_name_ext_swap ( ...
    input_neighbor_file_name, 'metis_graph' );

  metis_graph_write ( output_metis_graph_file_name, element_faces, ...
    element_num, element_neighbor );

  if ( element_faces == 3 )
    fprintf ( 1, '  Wrote the triangle neighbor information to "%s".\n', ...
      output_metis_graph_file_name );
  else
    fprintf ( 1, '  Wrote the tetrahedron neighbor information to "%s".\n', ...
      output_metis_graph_file_name );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEIGHBORS_TO_METIS_GRAPH:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
  end

  column_num = s_word_count ( line );

  return
end
function file_name_new = file_name_ext_swap ( file_name, ext )

%*****************************************************************************80
%
%% FILE_NAME_EXT_SWAP replaces the current "extension" of a file name.
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
%    FILE_NAME    EXT     FILE_NAME_NEW
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
%    Input, character FILE_NAME(*), a file name.
%    On output, the extension of the file has been changed.
%
%    Input, character EXT(*), the extension to be used on the output
%    copy of FILE_NAME, replacing the current extension if any.
%
%    Output, character FILE_NAME_NEW(*), a copy of the input file name,
%    with the new extension.
%
  file_name_len = length ( file_name );

  ext_len = length ( ext );

  period = file_name_len + 1;

  for i = file_name_len : -1 : 1
    if ( file_name(i:i) == '.' )
      period = i;
      break
    end
  end

  file_name_new(1:period-1) = file_name(1:period-1);
  file_name_new(period) = '.';
  file_name_new(period+1:period+ext_len) = ext(1:ext_len);

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 10;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
function metis_graph_write ( output_file_name, m, n, neighbor )

%*****************************************************************************80
%
%% METIS_GRAPH_WRITE writes the METIS graph file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    Jeff Borggaard and John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILE_NAME, the output file name.
%
%    Input, integer M, the number of graph edges
%
%    Input, integer N, the number of graph vertices.
%
%    Input, integer NEIGHBOR(M,N), the neighbor_file data.
%
  output_unit = fopen ( output_file_name, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'METIS_GRAPH_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'METIS_GRAPH_WRITE - Fatal error!' );
  end

  fprintf ( output_unit, '%%  MeTiS GraphFile "%s".\n', output_file_name );
  fprintf ( output_unit, '%%\n' );
  fprintf ( output_unit, '%%  Each tetrahedron has four neighbors.\n' );
  fprintf ( output_unit, '%%  For each element, the elements that\n' );
  fprintf ( output_unit, '%%  share faces with it are listed.\n' );

  i_positive = 0;
  for j = 1 : n
    for i = 1 : m
      if ( 0 < neighbor(i,j) )
        i_positive = i_positive + 1;
      end
    end
  end

  n_elements = n;
  n_faces = floor ( i_positive / 2 );

  fprintf ( output_unit, '%%\n' );
  fprintf ( output_unit, '%%  Output the number of elements and faces,\n' );
  fprintf ( output_unit, '%%\n' );

  fprintf ( output_unit, '  %d  %d\n', n_elements, n_faces );

  fprintf ( output_unit, '%%\n' );
  fprintf ( output_unit, '%%  For each element, list neighbors\n' );
  fprintf ( output_unit, '%%  that share faces with it.\n' );
  fprintf ( output_unit, '%%\n' );
  for j = 1 : n

    i_positive = 0;

    for i = 1 : m
      if ( 0 < neighbor(i,j) )
        i_positive = i_positive + 1;
        fprintf ( output_unit, '  %d', neighbor(i,j) );
      end
    end

    if ( 0 < i_positive )
      fprintf ( output_unit, '\n' );
    end

  end

  fprintf ( output_unit, '%%\n' );
  fprintf ( output_unit, '%%  End of file\n' );

  fclose ( output_unit );

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

  
