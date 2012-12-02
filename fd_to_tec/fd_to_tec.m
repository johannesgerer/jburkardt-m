function fd_to_tec ( prefix )

%*****************************************************************************80
%
%% FD_TO_TEC converts an FD model into a TECPLOT ASCII file.
%
%  Usage:
%
%    fd_to_tec ( 'prefix' )
%
%    where 'prefix' is the common prefix for the FD files:
%
%    * 'prefix'_nodes.txt,    the node coordinates.
%    * 'prefix'_values.txt,   the values defined at each node.
%
%    reads the data from these files, 
%    creates a Delaunay triangulation or tetrahedralization of the data, 
%    creates an equivalent TECPLOT ASCII file named 'prefix'.dat
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD_TO_TEC:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an FD model consisting of:\n' );
  fprintf ( 1, '  * a nodes file (2D or 3D),\n' );
  fprintf ( 1, '  * a values file (1 or more values at each node);\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write an equivalent TECPLOT ASCII "dat" file.\n' );
%
%  Get the file prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    prefix = input ( 'Enter the file prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  value_filename = strcat ( prefix, '_values.txt' );
  tec_filename = strcat ( prefix, '.dat' );
%
%  Read the FD data (node coordinates, node values).
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension is %d\n', dim_num );
  fprintf ( 1, '  The number of nodes is %d\n', node_num );

  node_coord = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read node data from "%s".\n', node_filename );

  [ value_num, node_num2 ] = r8mat_header_read ( value_filename );

  if ( node_num2 ~= node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '  The number of nodes in the node coordinate file is %d.\n', ...
      node_num );
    fprintf ( 1, ...
      '  but the number in the node data file is %d\n', node_num2 );
    fprintf ( 1, '  Because of this, no node data will be stored.\n' );
    value_num = 0;
  else
    fprintf ( 1, '  The number of values per node is %d\n', value_num );
    values = r8mat_data_read ( value_filename, value_num, node_num );
    fprintf ( 1, '  Read node value data from "%s".\n', value_filename );
  end
%
%  Triangulate/Tetrahedralize the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Calling DELAUNAYN to create elements.\n' );

  element_node = delaunayn ( node_coord' );
  element_node = element_node';
  [ element_order, element_num ] = size ( element_node );

  fprintf ( 1, '  Number of elements is %d\n', element_num );

  i4mat_write ( element_filename, element_order, element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote element data to "%s"\n', element_filename );
%
%  Write the TEC data.
%
  tec_write ( tec_filename, dim_num, node_num, element_num, ...
    element_order, value_num, node_coord, element_node, values );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the TEC data to "%s".\n', tec_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD_TO_TEC\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = ch_is_alpha ( c )

%*****************************************************************************80
%
%% CH_IS_ALPHA returns TRUE if C is an alphabetic character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character to check.
%
%    Output, logical VALUE is TRUE if C is an alphabetic character.
%
  FALSE = 0;
  TRUE = 1;

  if ( ( 'a' <= c & c <= 'z' ) | ...
       ( 'A' <= c & c <= 'Z' ) )
    value = TRUE;
  else
    value = FALSE;
  end

  return
end
function [ dim_num, node_num, element_num, element_order, value_num, ...
  node_coord, element_node, values ] = fem_read ( node_filename, ...
  element_filename, value_filename )

%*****************************************************************************80
%
%% FEM_READ reads data files associated with a finite element solution.
%
%  Discussion:
%
%    This program reads the node, element and data files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes, 
%    * a set of elements based on those nodes, 
%    * a set of data values associated with each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node coordinate
%    file.  If this argument is not supplied, it will be requested.  If the interactive
%    response is blank, or otherwise defective, then the program terminates.
%
%    Input, string ELEMENT_FILENAME, the name of the element file.  If
%    this argument is not supplied, it will be requested.  If the interactive
%    response is blank, then the program will assume that no element information
%    is to be supplied.  (But the node coordinates must be available and may be plotted.
%    And if a node data file is supplied, then the data can be plotted against
%    the node coordinates without using any finite element structure.)
%
%    Input, string VALUES_FILENAME, the name of the node data file.  If
%    this argument is not supplied, it will be requested.  If the interactive
%    response is blank, then the program will assume that no node data information
%    is to be supplied.  (But the node coordinates will be available and may be plotted.
%    And if an element file is supplied, then the elements can also be displayed.)
%
%    Output, integer DIM_NUM, the spatial dimension, inferred from the
%    "shape" of the data in the node file.
%
%    Output, integer NODE_NUM, the number of nodes, inferred from the 
%    number of lines of data in the node coordinate file.
%
%    Output, integer ELEMENT_NUM, the number of elements, inferred from the
%    number of lines of data in the element file.
%
%    Output, integer ELEMENT_ORDER, the order of the elements, inferred from
%    the number of items in the first line of the element file.
%
%    Output, integer VALUE_NUM, the number of data items per node,
%    inferred from the number of items in the first line of the node data file.
%
%    Output, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Output, real VALUES(VALUE_NUM,NODE_NUM), the data values associated
%    with each node.
%

%
%  Read the node coordinate file.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  [ value_num, node_num2 ] = r8mat_header_read ( value_filename );

  if ( node_num2 ~= node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '  The number of nodes in the node coordinate file is %d.\n', ...
      node_num );
    fprintf ( 1, ...
      '  but the number in the node data file is %d\n', node_num2 );
    fprintf ( 1, '  Because of this, no node data will be stored.\n' );
    value_num = 0;
  end

  node_coord = r8mat_data_read ( node_filename, dim_num, node_num );

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  values = r8mat_data_read ( value_filename, value_num, node_num );

  return
end
function column_num = file_column_count ( input_filename )

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
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_filename );
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
function filename = file_name_inc ( filename )

%*****************************************************************************80
%
% FILE_NAME_INC generates the next filename in a series.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the string to be incremented.
%
%    Output, string FILENAME, the incremented string.
%
  lens = length ( filename );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_INC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_INC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = filename(i);

    if ( '0' <= c & c <= '8' )

      change = change + 1;

      c = c + 1;
      
      filename(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      filename(i) = c;

    end

  end

  if ( change == 0 )
    filename = ' ';
  end

  return
end
function row_num = file_row_count ( input_filename )

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
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_filename );
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
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer TABLE(M,N), the points.
%
%    Input, logical HEADER, is TRUE if the header is to be included.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %12d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
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
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
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
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
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
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function iloc = s_alpha_last ( s )

%*****************************************************************************80
%
%% S_ALPHA_LAST returns the location of the last alphabetic character.
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
%    Input, string S, the string to be searched.
%
%    Output, integer ILOC, the location of the last alphabetic
%    character in the string.  If there are no alphabetic
%    characters, ILOC is returned as -1.
%
  s_len = s_len_trim ( s );

  for i = s_len : -1 : 1
    if ( ch_is_alpha ( s(i) ) )
      iloc = i;
      return
    end
  end

  iloc = -1;

  return
end
function [ s, ierror ] = s_inc ( s )

%*****************************************************************************80
%
%% S_INC "increments" a string.
%
%  Discussion:
%
%    The routine tries to produce the next string, in dictionary order,
%    following the input value of a string.  Digits, spaces, and other
%    nonalphabetic characters are ignored.  Case is respected; in other
%    words, the case of every alphabetic character on input will be the
%    same on output.
%
%    The following error conditions can occur:
%
%      There are no alphabetic characters in the string.  No
%      incrementing is possible.
%
%      All alphabetic characters are equal to 'Z' or 'z'.  In this
%      case, an error value is returned, but the string is also "wrapped
%      around" so that all alphabetic characters are "A" or "a".
%
%    If the word "Tax" were input, the successive outputs would be
%    "Tay", "Taz", "Tba", "Tbb", ...  If the input word "January 4, 1989"
%    were input, the output would be "Januarz 4, 1989".
%
%    This routine could be useful when trying to create a unique file
%    name or variable name at run time.
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
%    Input, character ( len = * ) S, the string whose
%    alphabetic successor is desired.
%
%    Output, character ( len = * ) S, if IERROR = 0,
%    S has been replaced by its successor.  If IERROR = 2,
%    S will be "wrapped around" so that all alphabetic
%    characters equal "A" or "a".
%
%    Output, integer IERROR, an error flag.
%    0, no error.
%    1, no alphabetic characters occur in the string.
%    2, all alphabetic characters are "Z" or "z".  S is wrapped around so
%       that all alphabetic characters are "A" or "a".
%
  ierror = 0;
  ilo = 1;
  ihi = s_len_trim ( s );
%
%  Find the last alphabetic character in the string.
%
  while ( 1 )

    iloc = s_alpha_last ( s(ilo:ihi) );
%
%  If there is no alphabetic character, we can't help.
%
    if ( iloc == 0 )
      ierror = 1;
      break;
    end

    if ( s(iloc) == 'Z' )

      s(iloc) = 'A';
      ihi = iloc - 1;

      if ( ihi <= 0 )
        ierror = 2;
        break;
      end

    elseif ( s(iloc) == 'z' )

      s(iloc) = 'a';
      ihi = iloc - 1;

      if ( ihi <= 0 )
        ierror = 2;
        break;
      end

    else

      s(iloc) = s(iloc) + 1;
      break;

    end

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
function tec_write ( tec_filename, dim_num, node_num, element_num, ...
  element_order, value_num, node_coord, element_node, values )

%*****************************************************************************80
%
%% TEC_WRITE writes finite element data to a TEC file.
%
%  Discussion:
%
%    This program writes the node, element and data files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes, 
%    * a set of elements based on those nodes, 
%    * a set of data values associated with each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILENAME, the name of the node coordinate
%    file.  If this argument is empty, no node coordinate file will be written.
%
%    Input, string ELEMENT_FILENAME, the name of the element file.  If
%    this argument is empty, no element file will be written.
%
%    Input, string VALUES_FILENAME, the name of the node data file.  If
%    this argument is empty, no node data file will be written.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer VALUE_NUM, the number of data items per node.
%
%    Input, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Input, real VALUES(VALUE_NUM,NODE_NUM), the data values associated
%    with each node.
%
  tec_file_unit = fopen ( tec_filename, 'wt' );
%
%  Write the title.
%
  fprintf ( tec_file_unit, 'TITLE = "%s"\n', tec_filename );
%
%  Write the variable names.
%
  fprintf ( tec_file_unit, 'VARIABLES = ' );

  name = 'X';
  for dim = 1 : dim_num
    if ( dim == 1 ) 
      fprintf ( tec_file_unit, '"%s"', name );
    else
      fprintf ( tec_file_unit, ', "%s"', name );
    end
    name = s_inc ( name );
  end

  name = 'data_001';
  for dim = 1 : value_num
    fprintf ( tec_file_unit, ', "%s"', name );
    name = file_name_inc ( name );
  end

  fprintf ( tec_file_unit, '\n' );
%
%  Write the ZONE record.
%
  if ( dim_num == 2 & element_order == 3 )
    zonetype = 'FETRIANGLE';
  elseif ( dim_num == 2 & element_order == 4 )
    zonetype = 'FEQUADRILATERAL';
  elseif ( dim_num == 3 & element_order == 4 )
    zonetype = 'FETETRAHEDRON';
  elseif ( dim_num == 3 & element_order == 8 )
    zonetype = 'FEBRICK';
  else
    zonetype = 'FEUNKNOWN';
  end

  fprintf ( tec_file_unit, 'ZONE N = %d, E = %d, ', node_num, element_num );
  fprintf ( tec_file_unit, 'DATAPACKING = POINT, ZONETYPE = %s\n', ...
    zonetype );
%
%  Write the node coordinates and node data.
%
  for node = 1 : node_num
    for dim = 1 : dim_num
      fprintf ( tec_file_unit, '  %10f', node_coord(dim,node) );
    end
    for data = 1 : value_num
      fprintf ( tec_file_unit, '  %10f', values(data,node) );
    end
    fprintf ( tec_file_unit, '\n' );
  end
%
%  Write the element-node connectivity.
%
  for element = 1 : element_num
    for order = 1 : element_order
      fprintf ( tec_file_unit, '  %6d', element_node(order,element) );
    end
    fprintf ( tec_file_unit, '\n' );
  end

  fclose ( tec_file_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_WRITE wrote all data to "%s".\n', ...
    tec_filename );

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
