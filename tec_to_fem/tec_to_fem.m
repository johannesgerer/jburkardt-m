function tec_to_fem ( prefix )

%*****************************************************************************80
%
%% TEC_TO_FEM converts the data in a TECPLOT ASCII file into an FEM model.
%
%  Usage:
%
%    tec_to_fem ( 'prefix' )
%
%    where
%
%    * 'prefix'.dat, is the name of the input TECPLOT file;
%    * 'prefix'_nodes.txt is the name of the output FEM node file;
%    * 'prefix'_elements.txt is the name of the output FEM element file;
%    * 'prefix'_values.txt is the name of the output FEM value file;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common file prefix.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_TO_FEM:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a TECPLOT ASCII file containing finite element data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write files for an equivalent FEM model consisting of:\n' );
  fprintf ( 1, '  * a node file,\n' );
  fprintf ( 1, '  * an element file,\n' );
  fprintf ( 1, '  * a value file;\n' );
%
%  Get the PREFIX.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_TO_FEM:\n' );
    prefix = input ( 'Enter the common filename prefix:  ' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  value_filename = strcat ( prefix, '_values.txt' );
  tec_filename = strcat ( prefix, '.dat' );
%
%  Read the TEC data.
%
  [ dim_num, node_num, element_num, element_order, node_data_num, ...
    node_coord, element_node, node_data ] = tec_read ( tec_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data from "%s".\n', tec_filename );
%
%  Write the FEM data.
%
  fem_write ( node_filename, element_filename, value_filename, ...
    dim_num, node_num, element_num, element_order, node_data_num, ...
    node_coord, element_node, node_data )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the nodes to "%s".\n', node_filename );
  fprintf ( 1, '  Wrote the elements to "%s".\n', element_filename );
  fprintf ( 1, '  Wrote the values to "%s".\n', value_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_TO_FEM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function truefalse = ch_eqi ( c1, c2 )

%*****************************************************************************80
%
%% CH_EQI is a case insensitive comparison of two characters for equality.
%
%  Example:
%
%    CH_EQI ( 'A', 'a' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C1, C2, the characters to compare.
%
%    Output, logical TRUEFALSE, is TRUE (1) if the characters are equal.
%
  FALSE = 0;
  TRUE = 1;

  if ( ch_cap ( c1 ) == ch_cap ( c2 ) )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function fem_write ( node_coord_file_name, element_file_name, ...
  node_data_file_name, dim_num, node_num, element_num, element_order, ...
  node_data_num, node_coord, element_node, node_data )

%*****************************************************************************80
%
%% FEM_WRITE reads data files associated with a finite element solution.
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
%    25 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_COORD_FILE_NAME, the name of the node coordinate
%    file.  If this argument is empty, no node coordinate file will be written.
%
%    Input, string ELEMENT_FILE_NAME, the name of the element file.  If
%    this argument is empty, no element file will be written.
%
%    Input, string NODE_DATA_FILE_NAME, the name of the node data file.  If
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
%    Input, integer NODE_DATA_NUM, the number of data items per node.
%
%    Input, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Input, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%

%
%  Write the node coordinate file.
%
  if ( ~isempty ( node_coord_file_name ) & ...
    0 < s_len_trim ( node_coord_file_name ) )

    r8mat_write ( node_coord_file_name, dim_num, node_num, node_coord );

  end
%
%  Write the element file.
%
  if ( ~isempty ( element_file_name ) & ...
    0 < s_len_trim ( element_file_name )  )

    i4mat_write ( element_file_name, element_order, element_num, ...
      element_node );

  end
%
%  Write the node data file.
%
  if ( ~isempty ( node_data_file_name ) & ...
    0 < s_len_trim ( node_data_file_name ) )

    r8mat_write ( node_data_file_name, node_data_num, node_num, ...
      node_data );

  end 

  return
end
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2009
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
    return;
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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
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
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
    return;
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function s = s_adjustl ( s )

%*****************************************************************************80
%
%% S_ADJUSTL flushes a string left.
%
%  Discussion:
%
%    Both blanks and tabs are treated as "white space".
%
%    This routine is similar to the FORTRAN90 ADJUSTL routine.
%
%  Example:
%
%    Input             Output
%
%    '     Hello'      'Hello     '
%    ' Hi there!  '    'Hi there!   '
%    'Fred  '          'Fred  '
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be shifted left.
%
%    Output, string S, has been shifted left.
%
  TAB = char ( 9 );
%
%  Check the length of the string to the last nonblank.
%  If nonpositive, return.
%
  len = s_len_trim ( s );

  if ( len <= 0 )
    return
  end
%
%  Find NONB, the location of the first nonblank, nontab.
%
  nonb = 0;

  for i = 1 : len

    if ( s(i) ~= ' ' & s(i) ~= TAB )
      nonb = i;
      break
    end

  end

  if ( nonb == 0 )
    s = ' ';
    return
  end
%
%  Shift the string left.
%
  if ( 1 < nonb )
    for i = 1 : len + 1 - nonb
      s(i) = s(i+nonb-1);
    end
  end
%
%  Blank out the end of the string.
%
  s(len+2-nonb:len) = ' ';

  return
end
function value = s_begin ( s1, s2 )

%*****************************************************************************80
%
%% S_BEGIN is TRUE if one string matches the beginning of the other.
%
%  Discussion:
%
%    The strings are compared, ignoring blanks and capitalization.
%
%  Examples:
%
%     S1              S2      S_BEGIN
%
%    'Bob'          'BOB'     TRUE
%    '  B  o b '    ' bo b'   TRUE
%    'Bob'          'Bobby'   TRUE
%    'Bobo'         'Bobb'    FALSE
%    ' '            'Bob'     FALSE    (Do not allow a blank to match
%                                       anything but another blank string.)
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
%    Input, character S1(*), S2(*), the strings to be compared.
%
%    Output, logical S_BEGIN, is TRUE if the strings match up to
%    the end of the shorter string, ignoring case.
%
  len1 = s_len_trim ( s1 );
  len2 = s_len_trim ( s2 );
%
%  If either string is blank, then both must be blank to match.
%  Otherwise, a blank string matches anything, which is not
%  what most people want.
%
  if ( len1 == 0 | len2 == 0 )

    if ( len1 == 0 & len2 == 0 )
      value = 1;
    else
      value = 0;
    end

    return

  end

  i1 = 0;
  i2 = 0;
%
%  Find the next nonblank in S1.
%
  while ( 1 )

    while ( 1 )

      i1 = i1 + 1;

      if ( len1 < i1 )
        value = 1;
        return
      end

      if ( s1(i1) ~= ' ' )
        break
      end

    end
%
%  Find the next nonblank in S2.
%
    while ( 1 )

      i2 = i2 + 1;

      if ( len2 < i2 )
        value = 1;
        return
      end

      if ( s2(i2) ~= ' ' )
        break
      end

    end
%
%  If the characters match, get the next pair.
%
    if ( ~ch_eqi ( s1(i1), s2(i2) ) )
      break
    end

  end

  value = 0;

  return
end
function s = s_behead_substring ( s, sub )

%*****************************************************************************80
%
%% S_BEHEAD_SUBSTRING "beheads" a string, removing a given substring.
%
%  Discussion:
%
%    Initial blanks in the string are removed first.
%
%    Then, if the initial part of the string matches the substring,
%    that part is removed and the remainder shifted left.
%
%    Initial blanks in the substring are NOT ignored.
%
%    Capitalization is ignored.
%
%    If the substring is equal to the string, then the resultant
%    string is returned as a single blank.
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
%    Input, string S, the string to be transformed.
%
%    Input, string SUB, the substring to be removed from
%    the beginning of the string.
%
%    Output, string S, the string to be transformed.
%

%
%  Remove leading blanks from the string.
%
  s = s_adjustl ( s );
%
%  Get lengths.
%
  s_len = s_len_trim ( s );
  sub_len = s_len_trim ( sub );

  if ( s_len < sub_len )
    return
  end
%
%  If the string begins with the substring, chop it off.
%
  if ( s_eqi ( s(1:sub_len), sub(1:sub_len) ) )

    if ( sub_len < s_len )
      s = s(sub_len+1:s_len);
      s = s_adjustl ( s );
    else
      s = ' ';
    end

  end

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = FALSE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = FALSE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  value = TRUE;

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
% S_LEN_TRIM returns the length of a character string to the last nonblank.
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
function s = s_replace_ch ( s, c1, c2 )

%*****************************************************************************80
%
%% S_REPLACE_CH replaces all occurrences of one character by another.
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
%    Input/output, character S(*), the string.
%
%    Input, character C1, C2, the character to be replaced, and the
%    replacement character.
%
  for i = 1 : length ( s )
    if ( s(i) == c1 )
      s(i) = c2;
    end
  end

  return
end
function ival = s_to_i4 ( s )

%*****************************************************************************80
%
%% S_TO_I4 reads an integer value from a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string to be examined.
%
%    Output, integer IVAL, the integer value read from the string.
%
  sgn = 1;
  state = 0;
  ival = 0;

  i = 0;

  while ( i < s_len_trim ( s ) )

    i = i + 1;
    c = s(i);

    if ( state == 0 )

      if ( c == ' ' )

      elseif ( c == '-' )
        state = 1;
        sgn = -1;
      elseif ( c == '+' )
        state = 1;
        sgn = +1;
      elseif ( '0' <= c & c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character %c while in state %d.\n', c, state );
        return;
      end
%
%  Have read the sign, now expecting the first digit.
%
    elseif ( state == 1 )

      if ( c == ' ' )

      elseif ( '0' <= c & c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character %c while in state %d.\n', c, state );
        return
      end
%
%  Have read at least one digit, expecting more.
%
    elseif ( state == 2 )

      if ( '0' <= c & c <= '9' )
        ival = 10 * ival + c - '0';
      else
        ival = sgn * ival;
        return;
      end

    end

  end
%
%  If we read all the characters in the string, see if we're OK.
%
  if ( state ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'S_TO_I4 - Fatal error!\n' );
    fprintf ( '  Did not read enough information to define an integer!\n' );
    return;
  end

  ival = sgn * ival;

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
%    Input, character ( len = * ) S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_len = s_len_trim ( s );

  if ( s_len <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_len

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

  end

  return
end
function [ w, s ] = s_word_extract ( s )

%*****************************************************************************80
%
%% S_WORD_EXTRACT extracts the next word from a string.
%
%  Discussion:
%
%    A "word" is a string of characters terminated by a blank or
%    the end of the string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string..
%
%    Output, string W, the leading word of the string.
%
%    Output, string S, the first word of the input string has been removed, 
%    and the remaining string has been shifted left.
%
  w = ' ';

  s_len = s_len_trim ( s );

  if ( s_len < 1 )
    return
  end
%
%  Find the first nonblank.
%
  get1 = 0;

  while ( 1 )

    get1 = get1 + 1;

    if ( s_len < get1 )
      return
    end

    if ( s(get1) ~= ' ' )
      break
    end

  end
%
%  Look for the last contiguous nonblank.
%
  get2 = get1;

  while ( 1 )

    if ( s_len <= get2 )
      break
    end

    if ( s(get2+1) == ' ' )
      break
    end

    get2 = get2 + 1;

  end
%
%  Copy the word.
%
  w = s(get1:get2);
%
%  Shift the string.
%
  s(1:get2) = ' ';
  s = s_adjustl ( s(get2+1:s_len) );

  return
end
function [ dim_num, node_num, element_num, element_order, node_data_num, ...
  node_coord, element_node, node_data ] = tec_read ( tec_file_name )

%*****************************************************************************80
%
%% TEC_READ reads finite element data from a TEC file.
%
%  Discussion:
%
%    This program reads a TEC file containing finite element data,
%    and writes that data out to three files that constitute an FEM model,
%    that is,
%    * a file of node coordinates;
%    * a file of elements defined by the nodes that form them;
%    * a file of node data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character TEC_FILE_NAME(*), the name of the TEC file.
%
%    Output, integer DIM_NUM, the spatial dimension, inferred from the
%    names of the variables.
%
%    Output, integer NODE_NUM, the number of nodes, determined by the 
%    "N=" argument.
%
%    Output, integer ELEMENT_NUM, the number of elements, inferred from the
%    "E=" argument.
%
%    Output, integer ELEMENT_ORDER, the order of the elements, inferred from
%    the "ZONETYPE=" argument.
%
%    Output, integer NODE_DATA_NUM, the number of data items per node,
%    inferred from the the number of node data items, minus those which are
%    inferred to be spatial coordinates.
%
%    Output, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Output, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%
  dim_num = -1;
  node_num = -1;
  element_num = -1;
  element_order = -1; 
  node_data_num = -1;
  node_coord = []; 
  element_node = []; 
  node_data = [];

  tec_file_unit = fopen ( tec_file_name );

  if ( tec_file_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', tec_file_name );
    error ( 'TEC_READ - Error!' );
    return;
  end
%
%  Read and parse the TITLE line.
%  But it is optional, so you may have just read the VARIABLES line instead!
%
  line = ' ';

  while ( s_len_trim ( line ) == 0 )
    line = fgetl ( tec_file_unit );
  end    
%
%  Read the VARIABLES line.
%
%  Because the TITLE line is apparently optional, we may have already
%  read the VARIABLES line!
%
  if ( s_begin ( line, 'TITLE=' ) )
    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end
  end

  if ( ~s_begin ( line, 'VARIABLES=' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Fatal error!\n' );
    fprintf ( 1, '  The VARIABLES = line is missing in the file.\n' );
    error ( 'TEC_READ - Fatal error!' );
  end
%
%  Parse the VARIABLES line.
%  VARIABLES = name1 name2 name3...
%  The names may be quoted, and are separated by quotes, commas or spaces.
%
  [ variable_num, variable_name_length, variable_name ] ...
    = tec_variable_line_parse ( line );
%
%  Based on the variable names, determine the spatial dimension and the number
%  of node data items.
%
%  For now, we SIMPLY ASSUME that the spatial coordinates are listed first.
%  Hence, when we read the node data, we assume that the first DIM_NUM values
%  represent X, Y and possibly Z.
%
  dim_num = 0;
  node_data_num = variable_num;

  begin = 0;
  for variable = 1 : variable_num
    if ( variable_name_length(variable) == 1 )
      name = variable_name(begin+1);
      if ( ch_eqi ( name, 'X' ) | ... 
          ch_eqi ( name, 'Y' ) | ...
          ch_eqi ( name, 'Z' ) )
        dim_num = dim_num + 1;
        node_data_num = node_data_num - 1;
      end
    end
    begin = begin + variable_name_length(variable);
  end
%
%  Read and parse the ZONE line.
%
  line = ' ';
  while ( s_len_trim ( line ) == 0 )
    line = fgetl ( tec_file_unit );
  end
    
  if ( ~s_begin ( line, 'ZONE' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Fatal error!\n' );
    fprintf ( 1, '  The ZONE = line is missing in the file.\n' );
    error ( 'TEC_READ - Fatal error!' );
  end

  [ node_num, element_num, element_type ] = tec_zone_line_parse ( line );
%
%  Based on ELEMENT_TYPE, determine the element order.
%
  if ( s_eqi ( element_type, 'FETRIANGLE' ) )
    element_order = 3;
  elseif ( s_eqi ( element_type, 'FEQUADRILATERAL' ) )
    element_order = 4;
  elseif ( s_eqi ( element_type, 'FETETRAHEDRON' ) )
    element_order = 4;
  elseif ( s_eqi ( element_type, 'FEBRICK' ) )
    element_order = 8;
  else
    element_order = -1;
  end
%
%  Build up the format string for reading DIM_NUM + NODE_DATA_NUM reals.
%
  format = ' ';

  for i = 1 : dim_num + node_data_num
    format = strcat ( format, ' %f' );
  end

  node_coord = zeros ( dim_num, node_num );
  node_data = zeros ( node_data_num, node_num );
%
%  Now read the node coordinates and node data.
%
  for node = 1 : node_num

    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end

    [ x, count ] = sscanf ( line, format );

    if ( count == dim_num + node_data_num )
      node_coord(1:dim_num,node) = x(1:dim_num);

      node_data(1:node_data_num,node) = x(dim_num+1:dim_num+node_data_num);
    end

  end
%
%  Build up the format string for reading ELEMENT_ORDER integers.
%
  format = ' ';

  for element = 1 : element_order
    format = strcat ( format, ' %d' );
  end

  element_node = zeros ( element_order, element_num );
%
%  Now read the element data.
%
  for element = 1 : element_num

    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end

    [ x, count ] = sscanf ( line, format );

    if ( count == element_order )
      element_node(1:element_order,element) = x(1:element_order);
    end

  end

  fclose ( tec_file_unit );

  return
end
function [ variable_num, variable_name_length, variable_name ] ...
  = tec_variable_line_parse ( line )

%*****************************************************************************80
%
%% TEC_VARIABLE_LINE_PARSE parses the "VARIABLES=" line of a TEC file.
%
%  Discussion:
%
%    The string begins with the substring "VARIABLES=" and is followed by
%    a sequence of variable names which may be quoted.  The names are
%    separated by spaces, commas or quotes.  Blanks may appear here and there.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string LINE, a string of characters, representing the
%    "VARIABLES=" line of the file.
%
%    Output, integer VARIABLE_NUM, the number of variable names found.
%
%    Output, integer VARIABLE_NAME_LENGTH, the length of the variable
%    names.
%
%    Output, string VARIABLE_NAME(*), the variable names, packed in
%    sequence.
%

%
%  Remove the initial "VARIABLES="
%
  line = s_behead_substring ( line, 'VARIABLES' );
  line = s_behead_substring ( line, '=' );
%
%  Replace single quotes, double quotes, commas and periods by blanks.
%
  line = s_replace_ch ( line, '''', ' ' );
  line = s_replace_ch ( line, '"', ' ' );
  line = s_replace_ch ( line, ',', ' ' );
  line = s_replace_ch ( line, '.', ' ' );
%
%  Count the words.
%
  variable_num = s_word_count ( line );
%
%  Extract the words.
%
  begin = 0;
  for variable = 1 : variable_num
    [ name, line ] = s_word_extract ( line );
    name_len = s_len_trim ( name );
    variable_name_length(variable) = name_len;
    variable_name(begin+1:begin+name_len) = name(1:name_len);
    begin = begin+name_len;
  end

  return
end
function [ node_num, element_num, element_type ] = tec_zone_line_parse ( line )

%*****************************************************************************80
%
%% TEC_ZONE_LINE_PARSE parses the "ZONE" line of a TEC file.
%
%  Discussion:
%
%    The string begins with the substring "ZONE" and is followed by
%    a sequence of keywords and values joined by an equals sign.
%
%    We expect the following, but in arbitrary order, separated 
%    by spaces or commas:
%
%      N = number of nodes
%      E = number of elements
%      PACKING = POINT
%      ZONETYPE = FETRIANGLE or FEQUADRILATERAL or FETETRAHEDRON or FEBRICK.
%
%    Other arguments that may appear on this line will be ignore.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string LINE, a string of characters, representing the
%    "VARIABLES=" line of the file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, string ELEMENT_TYPE, the element type: 
%    FETRIANGLE or FEQUADRILATERAL or FETETRAHEDRON or FEBRICK..
%

%
%  Remove the initial "ZONE"
%
  line = s_behead_substring ( line, 'ZONE' );
%
%  Replace each EQUALS sign by a space.
%  Also get rid of commas and periods.
%  Do single and double quotes have to go, also?
%
  line = s_replace_ch ( line, '=', ' ' );
  line = s_replace_ch ( line, ',', ' ' );
  line = s_replace_ch ( line, '.', ' ' );
%
%  Now each pair of words represents a name and a value.
%
  node_num = -1;
  element_num = -1;
  element_type = [];

  found_num = 0;

  while ( 1 )

    [ name, line ] = s_word_extract ( line );

    if ( isempty ( name ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected End of input.\n' );
      error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
    end

    [ value, line ] = s_word_extract ( line );

    if ( isempty ( value ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected End of input.\n' );
      error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
    end

    if ( ch_eqi ( name(1), 'N' ) & node_num == -1 )

      node_num = s_to_i4 ( value );
      found_num = found_num + 1;

    elseif ( ch_eqi ( name(1), 'E' ) & element_num == -1 )

      element_num = s_to_i4 ( value );
      found_num = found_num + 1;

    elseif ( s_eqi ( name, 'DATAPACKING' ) )

      if ( ~s_eqi ( value, 'POINT' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
        fprintf ( 1, '  Value of DATAPACKING argument must be POINT.\n' );
        error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
      end

    elseif ( s_eqi ( name, 'ZONETYPE' ) & isempty ( element_type ) )

      found_num = found_num + 1;
      element_type = value;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Ignoring "%s = %s".\n', name, value );

    end

    if ( found_num == 3 )
      break
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

  
