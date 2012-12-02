function stla_to_tri_surface ( stla_file_name, node_file_name, triangle_file_name )

%*****************************************************************************80
%
%% STLA_TO_TRI_SURFACE converts an ASCII STL file to a TRI_SURFACE file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string STLA_FILE_NAME, the name of the ASCII STL file to be read.
%
%    Input, string NODE_FILE_NAME, the name of the TRI_SURFACE node file 
%    to be written.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the TRI_SURFACE triangle 
%    file to be written.
%

%
%  Get the size of the STLA data.
%
  [ solid_num, node_num, triangle_num, text_num ] = stla_size ( stla_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STLA file "%s".\n', stla_file_name );
  fprintf ( 1, '  Number of solids   = %d\n', solid_num );
  fprintf ( 1, '  Number of nodes    = %d\n', node_num );
  fprintf ( 1, '  Number of faces    = %d\n', triangle_num );
  fprintf ( 1, '  Number of textures = %d\n', text_num );
%
%  Read the STLA data.
%
  [ node_xyz, triangle_node, triangle_normal ] = stla_read ( stla_file_name, ...
    node_num, triangle_num );
%
%  Write the data to the TRI_SURFACE files.
%
  dim_num = size ( node_xyz, 1 );
  order_num = 3;

  tri_surface_write ( node_file_name, triangle_file_name, dim_num, node_num, ...
    order_num, triangle_num, node_xyz, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRI_SURFACE data written to:\n' );
  fprintf ( 1, '  node file     "%s".\n', node_file_name );
  fprintf ( 1, '  triangle_file "%s".\n', triangle_file_name );

  return
end
function c2 = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
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
%    Output, character C2, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c2 = c + 'A' - 'a';
  else
    c2 = c;
  end

  return
end
function truefalse = ch_eqi ( c1, c2 )

%*****************************************************************************80
%
%% CH_EQI is a case insensitive comparison of two characters for equality.
%
%  Examples:
%
%    CH_EQI ( 'A', 'a' ) is TRUE.
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
function truefalse = ch_is_digit ( c )

%*****************************************************************************80
%
% CH_IS_DIGIT returns TRUE if the character C is a digit.
%
%  Modified:
%
%    11 December 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character.
%
%    Output, integer TRUEFALSE, is TRUE (1) if C is a digit, FALSE (0) otherwise.
%
  TRUE = 1;
  FALSE = 0;

  if ( '0' <= c & c <= '9' )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function digit = ch_to_digit ( c )

%*****************************************************************************80
%
%% CH_TO_DIGIT returns the integer value of a base 10 digit.
%
%  Example:
%
%     C   DIGIT
%    ---  -----
%    '0'    0
%    '1'    1
%    ...  ...
%    '9'    9
%    ' '    0
%    'X'   -1
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
%    Input, character C, the decimal digit, '0' through '9' or blank
%    are legal.
%
%    Output, integer DIGIT, the corresponding integer value.  If C was
%    'illegal', then DIGIT is -1.
%
  if ( '0' <= c & c <= '9' )

    digit = c - '0';

  elseif ( c == ' ' )

    digit = 0;

  else

    digit = -1;

  end

  return
end
function i4mat_write0 ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE0 writes an I4MAT file with no header.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2005
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
    fprintf ( 1, 'I4MAT_WRITE0 - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE0 - Error!' );
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
function r8mat_write0 ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE0 writes an R8MAT file with no header.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2009
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
    fprintf ( 1, 'R8MAT_WRITE0 - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE0 - Error!' );
    return;
  end
%
%  Write the data.
%
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function s3 = s_cat ( s1, s2 )

%*****************************************************************************80
%
%% S_CAT concatenates two strings to make a third string.
%
%  Discussion:
%
%    MATLAB provides the STRCAT function, which you should 
%    probably use instead of this function!
%
%    s3 = strcat ( s1, s2 )
%
%    Although STRCAT does not ignore trailing blanks.
%
%  Modified:
%
%    28 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the "prefix" string.
%
%    Input, string S2, the "postfix" string.
%
%    Output, string S3, the string made by
%    concatenating S1 and S2, ignoring any trailing blanks.
%
  l1 = s_len_trim ( s1 );
  l2 = s_len_trim ( s2 );
%
%  The following line essentially "declares" S3 to be a
%  character string.  Omitting this line would cause S3
%  to be regarded as a numeric array.
%
  s3 = '';
%
%  Now copy the strings.
%
  s3(   1:l1   ) = s1(1:l1);
  s3(l1+1:l1+l2) = s2(1:l2);

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
%    Input, character ( len = * ) S1, S2, the strings to compare.
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
%    Output, integer LENGTH, the length of the string up to the last nonblank.
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
function [ r, lchar, ierror ] = s_to_r8 ( s )

%*****************************************************************************80
%
%% S_TO_R8 reads an R8 from a string.
%
%  Discussion:
%
%    This routine will read as many characters as possible until it reaches
%    the end of the string, or encounters a character which cannot be
%    part of the real number.
%
%    Legal input is:
%
%       1 blanks,
%       2 '+' or '-' sign,
%       2.5 spaces
%       3 integer part,
%       4 decimal point,
%       5 fraction part,
%       6 'E' or 'e' or 'D' or 'd', exponent marker,
%       7 exponent sign,
%       8 exponent integer part,
%       9 exponent decimal point,
%      10 exponent fraction part,
%      11 blanks,
%      12 final comma or semicolon.
%
%    with most quantities optional.
%
%  Examples:
%
%    S                 R
%
%    '1'               1.0
%    '     1   '       1.0
%    '1A'              1.0
%    '12,34,56'        12.0
%    '  34 7'          34.0
%    '-1E2ABCD'        -100.0
%    '-1X2ABCD'        -1.0
%    ' 2E-1'           0.2
%    '23.45'           23.45
%    '-4.2E+2'         -420.0
%    '17d2'            1700.0
%    '-14e-2'         -0.14
%    'e2'              100.0
%    '-12.73e-9.23'   -12.73 * 10.0**(-9.23)
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
%    Input, string S, the string containing the
%    data to be read.  Reading will begin at position 1 and
%    terminate at the end of the string, or when no more
%    characters can be read to form a legal real.  Blanks,
%    commas, or other nonnumeric data will, in particular,
%    cause the conversion to halt.
%
%    Output, real R, the value that was read from the string.
%
%    Output, integer LCHAR, the number of characters of S that were used to form R.
%
%    Output, integer IERROR, is 0 if no error occurred.
%
  s_length = s_len_trim ( s );
  ierror = 0;
  r = 0.0;
  lchar = -1;
  isgn = 1;
  rtop = 0.0;
  rbot = 1.0;
  jsgn = 1;
  jtop = 0;
  jbot = 1;
  ihave = 1;
  iterm = 0;

  while ( 1 )

    lchar = lchar + 1;
    c = s(lchar+1);
%
%  Blank character.
%
    if ( c == ' ' )

      if ( ihave == 2 )

      elseif ( ihave == 6 | ihave == 7 )
        iterm = 1;
      elseif ( 1 < ihave )
        ihave = 11;
      end
%
%  Comma.
%
    elseif ( c == ',' | c == ';' )

      if ( ihave ~= 1 )
        iterm = 1;
        ihave = 12;
        lchar = lchar + 1;
      end
%
%  Minus sign.
%
    elseif ( c == '-' )

      if ( ihave == 1 );
        ihave = 2;
        isgn = -1;
      elseif ( ihave == 6 )
        ihave = 7;
        jsgn = -1;
      else
        iterm = 1;
      end
%
%  Plus sign.
%
    elseif ( c == '+' )

      if ( ihave == 1 )
        ihave = 2;
      elseif ( ihave == 6 )
        ihave = 7;
      else
        iterm = 1;
      end
%
%  Decimal point.
%
    elseif ( c == '.' )

      if ( ihave < 4 )
        ihave = 4;
      elseif ( 6 <= ihave & ihave <= 8 )
        ihave = 9;
      else
        iterm = 1;
      end
%
%  Exponent marker.
%
    elseif ( ch_eqi ( c, 'E' ) | ch_eqi ( c, 'D' ) )

      if ( ihave < 6 )
        ihave = 6;
      else
        iterm = 1;
      end
%
%  Digit.
%
    elseif ( ihave < 11 & ch_is_digit ( c ) )

      if ( ihave <= 2 )
        ihave = 3;
      elseif ( ihave == 4 )
        ihave = 5;
      elseif ( ihave == 6 | ihave == 7 )
        ihave = 8;
      elseif ( ihave == 9 )
        ihave = 10;
      end

      d = ch_to_digit ( c );

      if ( ihave == 3 )
        rtop = 10.0 * rtop + d;
      elseif ( ihave == 5 )
        rtop = 10.0 * rtop + d;
        rbot = 10.0 * rbot;
      elseif ( ihave == 8 )
        jtop = 10 * jtop + d;
      elseif ( ihave == 10 )
        jtop = 10 * jtop + d;
        jbot = 10 * jbot;
      end
%
%  Anything else is regarded as a terminator.
%
    else
      iterm = 1;
    end
%
%  If we haven't seen a terminator, and we haven't examined the
%  entire string, go get the next character.
%
    if ( iterm == 1 | s_length <= lchar + 1 )
      break;
    end

  end
%
%  If we haven't seen a terminator, and we have examined the
%  entire string, then we're done, and LCHAR is equal to S_LENGTH.
%
  if ( iterm ~= 1 & lchar + 1 == s_length )
    lchar = s_length;
  end
%
%  Number seems to have terminated.  Have we got a legal number?
%  Not if we terminated in states 1, 2, 6 or 7!
%
  if ( ihave == 1 | ihave == 2 | ihave == 6 | ihave == 7 )
    ierror = ihave;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_R8 - Fatal error!\n' );
    fprintf ( 1, '  IHAVE = %d\n', ihave );
    error ( 'S_TO_R8 - Fatal error!' );
  end
%
%  Number seems OK.  Form it.
%
  if ( jtop == 0 )
    rexp = 1.0;
  else

    if ( jbot == 1 )
      rexp = 10.0^( jsgn * jtop );
    else
      rexp = jsgn * jtop;
      rexp = rexp / jbot;
      rexp = 10.0^rexp;
    end

  end

  r = isgn * rexp * rtop / rbot;

  return
end
function [ node_xyz, face_node, face_normal ] = stla_read ( ...
  input_file_name, node_num, face_num )

%*****************************************************************************80
%
%% STLA_READ reads graphics information from an ASCII StereoLithography file.
%
%  Modified:
%
%    17 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, integer NODE_NUM, the number of vertices defined.
%
%    Input, integer FACE_NUM, the number of faces defined.
%
%    Output, real NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Output, integer FACE_NODE(3,FACE_NUM), the nodes that make up each face.
%
%    Output, real FACE_NORMAL(3,FACE_NUM), the normal vector
%    at each face.
%
  node_xyz = [];
  face_node = [];
  face_normal = [];
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end
%
%  If no size input, scan the file.
%
  if ( nargin < 3 )
    [ solid_num, node_num, face_num, text_num ] = stla_size ( ...
      input_file_name );  
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_READ - Fatal error!' )
    return
  end
%
%  Allocate space.
%
  state = 0;
  text_num = 0;
  
  solid = 0;
  face = 0;
  node = 0;

  node_xyz = zeros ( 3, node_num );
  face_node = zeros ( 3, face_num );
  face_normal = zeros ( 3, face_num );
%
%  Read the next line of text.
%
  while ( 1 )

    text = fgetl ( input_file_unit );
%
%  On end of input, FGETL returns a -1 instead of a character array.
%
    if ( text == -1 )
      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  End-of-file, but model not finished.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end
      break;
    end

    text_num = text_num + 1;
    done = 1;
%
%  Read the first word in the line.
%
    [ word1, done ] = word_next_read ( text, done );

    if ( done )
      break
    end
%
%  "Doctor" the text, changing a beginning occurrence of:
%
%      END FACET to ENDFACET
%      END LOOP to ENDLOOP
%      END SOLID to ENDSOLID
%      FACET NORMAL to FACETNORMAL
%      OUTER LOOP to OUTERLOOP
%
    if ( s_eqi ( word1, 'END' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'FACET' ) & ...
           ~s_eqi ( word2, 'LOOP' ) & ...
           ~s_eqi ( word2, 'SOLID' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag END was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word );
        fprintf ( 1, '  "FACET", "LOOP", or "SOLID".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'FACET' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'NORMAL' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag FACET was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "NORMAL".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'OUTER' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'LOOP' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag OUTER was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "LOOP".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    end
%
%  This first word tells us what to do.
%
%  SOLID - begin a new solid.
%    Valid in state 0, moves to state 1.
%  ENDSOLID - end current solid.
%    Valid in state 1, moves to state 0.
%
%  FACETNORMAL - begin a new facet.
%    Valid in state 0 or 1, moves to state 2.
%  ENDFACET - end current facet.
%    Valid in state 2, moves to state 1.
%
%  OUTERLOOP - begin a list of vertices.
%    Valid in state 2, moves to state 3, sets vertex count to 0.
%  ENDLOOP - end vertex list.
%    Valid in state 3, moves to state 2.
%
%  VERTEX - give coordinates of next vertex.
%    Valid in state 3.
%
%  End of file -
%    Valid in state 0 or 1.
%
    if ( s_eqi ( word1, 'SOLID' ) )

      if ( state ~= 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  A new SOLID statement was encountered, but we\n' );
        fprintf ( 1, '  have not finished processing the current solid.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'ENDSOLID' ) )

      if ( state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  An END SOLID statement was encountered, but\n' );
        fprintf ( 1, '  either we have not begun a solid at all, or we\n' );
        fprintf ( 1, '  are not at an appropriate point to finish the\n' );
        fprintf ( 1, '  current solid.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 0;

    elseif ( s_eqi ( word1, 'FACETNORMAL' ) )

      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for FACET.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 2;
      face = face + 1;

      if ( face_num < face )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Warning!\n' );
        fprintf ( 1, '  More faces being read than expected.\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      for i = 1 : 3

        face_normal(i,face) = 0.0;

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  End of information while reading a component\n' );
          fprintf ( 1, '  of the normal vector.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  Reading a component of the normal vector.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        face_normal(i,face) = dval;

      end

    elseif ( s_eqi ( word1, 'ENDFACET' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDFACET.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'OUTERLOOP' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for OUTERLOOP.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 3;
      vertex = 0;

    elseif ( s_eqi ( word1, 'ENDLOOP' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDLOOP.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 2;

    elseif ( s_eqi ( word1, 'VERTEX' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for VERTEX.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      if ( 3 <= vertex )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  More than 3 vertices specified for a face.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate is missing.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate makes\n' );
          fprintf ( 1, '  no sense.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        temp(i) = dval;

      end

      if ( node_num <= node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Warning!\n' );
        fprintf ( 1, '  More nodes being read than expected.\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      node = node + 1;
      node_xyz(1:3,node) = temp(1:3);

      vertex = vertex + 1;
      face_node(vertex,face) = node;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'STLA_READ - Fatal error!\n' );
      fprintf ( 1, '  File line number = %d\n', text_num );
      fprintf ( 1, '  Unrecognized line in file.\n' );
      error ( 'STLA_READ - Fatal error!' );
      return

    end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
function [ solid_num, node_num, face_num, text_num ] = stla_size ( ...
  input_file_name )

%*****************************************************************************80
%
%% STLA_SIZE determines sizes associated with an STLA file.
%
%  Discussion:
%
%    This routine assumes that the file is a legal STLA file.
%
%    To perform checks on the file, call STLA_CHECK first.
%
%    Note that the counts for the number of nodes and edges are
%    overestimates, since presumably, most nodes will be defined several
%    times, once for each face they are part of, and most edges will
%    be defined twice.
%
%  Modified:
%
%    16 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer SOLID_NUM, the number of solids defined.
%    Presumably, this is 1.
%
%    Output, integer NODE_NUM, the number of vertices defined.
%
%    Output, integer FACE_NUM, the number of faces defined.
%
%    Output, integer TEXT_NUM, the number of lines of text.
%
  ierror = 0;
  state = 0;

  solid_num = -1;
  node_num = -1;
  face_num = -1;
  text_num = -1;
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_SIZE - Fatal error!' );
    return
  end

  solid_num = 0;
  node_num = 0;
  face_num = 0;
  text_num = 0;
%
%  Read the text, one line at a time.
%
  while ( 1 )

    text = fgetl ( input_file_unit );

    if ( text == -1 )
      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  End-of-file, but model not finished.\n' );
        return
      end
      break;
    end

    text_num = text_num + 1;

    done = 1;
%
%  Read the first word in the line.
%
    [ word1, done ] = word_next_read ( text, done );

    if ( done )
      break
    end
%
%  "Doctor" the text, changing a beginning occurrence of:
%
%      END FACET to ENDFACET
%      END LOOP to ENDLOOP
%      END SOLID to ENDSOLID
%      FACET NORMAL to FACETNORMAL
%      OUTER LOOP to OUTERLOOP
%
    if ( s_eqi ( word1, 'END' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'FACET' ) & ...
           ~s_eqi ( word2, 'LOOP' ) & ...
           ~s_eqi ( word2, 'SOLID' ) )
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'FACET' ) )

      [word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'NORMAL' ) )
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'OUTER' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'LOOP' ) )
        return
      end

      word1 = s_cat ( word1, word2 );

    end
%
%  This first word tells us what to do.
%
%  SOLID - begin a new solid.
%    Valid in state 0, moves to state 1.
%  ENDSOLID - end current solid.
%    Valid in state 1, moves to state 0.
%
%  FACETNORMAL - begin a new facet.
%    Valid in state 0 or 1, moves to state 2.
%  ENDFACET - end current facet.
%    Valid in state 2, moves to state 1.
%
%  OUTERLOOP - begin a list of vertices.
%    Valid in state 2, moves to state 3.
%  ENDLOOP - end vertex list.
%    Valid in state 3, moves to state 2.
%
%  VERTEX - give coordinates of next vertex.
%    Valid in state 3 if current vertex count is 0, 1 or 2.
%
%  End of file -
%    Valid in state 0 or 1.
%
    if ( s_eqi ( word1, 'SOLID' ) )

      if ( state ~= 0 )
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'ENDSOLID' ) )

      if ( state ~= 1 )
        return
      end

      state = 0;
      solid_num = solid_num + 1;

    elseif ( s_eqi ( word1, 'FACETNORMAL' ) )

      if ( state ~= 0 & state ~= 1 )
        return
      end

      state = 2;

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          return
        end

      end

    elseif ( s_eqi ( word1, 'ENDFACET' ) )

      if ( state ~= 2 )
        return
      end

      state = 1;

      face_num = face_num + 1;

    elseif ( s_eqi ( word1, 'OUTERLOOP' ) )

      if ( state ~= 2 )
        return
      end

      state = 3;
      vertex = 0;

    elseif ( s_eqi ( word1, 'ENDLOOP' ) )

      if ( state ~= 3 )
        return
      end

      state = 2;

    elseif ( s_eqi ( word1, 'VERTEX' ) )

      if ( state ~= 3 )
        return
      end

      if ( 3 <= vertex )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Too many vertices for a face.\n' );
        ierror = 1;
        return
      end

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          return
        end

      end

      vertex = vertex + 1;
      node_num = node_num + 1;

    else

      return

    end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

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
function tri_surface_write ( node_file_name, triangle_file_name, dim_num, ...
  node_num, order_num, triangle_num, node_xyz, triangle_node )

%*****************************************************************************80
%
%% TRI_SURFACE_WRITE writes graphics information to a pair of TRI_SURFACE files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the triangle file.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer ORDER_NUM, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, real NODE_XYZ(DIM_NUM,NODE_NUM), the node coordinates.
%
%    Input, integer TRIANGLE_NODE(ORDER_NUM,TRIANGLE_NUM), 
%    the nodes that form the triangles.
%
  r8mat_write0 ( node_file_name, dim_num, node_num, node_xyz );

  i4mat_write0 ( triangle_file_name, order_num, triangle_num, ...
    triangle_node );

  return
end
function [ word, done ] = word_next_read ( s, done )

%*****************************************************************************80
%
%% WORD_NEXT_READ "reads" words from a string, one at a time.
%
%  Special cases:
%
%    The following characters are considered to be a single word,
%    whether surrounded by spaces or not:
%
%      " ( ) { } [ ]
%
%    Also, if there is a trailing comma on the word, it is stripped off.
%    This is to facilitate the reading of lists.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string, presumably containing words
%    separated by spaces.
%
%    Input, logical DONE.
%    TRUE, if we are beginning a new string;
%    FALSE, if we are continuing to process the current string.
%
%    Output, string WORD.
%    If DONE is FALSE, then WORD contains the "next" word read.
%    If DONE is TRUE, then WORD is blank, because there was no more to read.
%
%    Output, logical DONE.
%      FALSE if another word was read,
%      TRUE if no more words could be read.
%
  persistent lenc;
  persistent next;
  
  tab = char ( 9 );
%
%  We "remember" LENC and NEXT from the previous call.
%
%  An input value of DONE = TRUE signals a new line of text to examine.
%
  if ( done )

    next = 1;
    done = 0;
    lenc = s_len_trim ( s );

    if ( lenc <= 0 )
      done = 1;
      word = ' ';
      return
    end

  end
%
%  Beginning at index NEXT, search the string for the next nonblank,
%  which signals the beginning of a word.
%
  ilo = next;
%
%  ...S(NEXT:) is blank.  Return with WORD = ' ' and DONE = TRUE.
%
  while ( 1 )

    if ( lenc < ilo )
      word = ' ';
      done = 1;
      next = lenc + 1;
      return
    end
%
%  If the current character is blank, skip to the next one.
%
    if ( s(ilo) ~= ' ' & s(ilo) ~= tab )
      break
    end

    ilo = ilo + 1;

  end
%
%  ILO is the index of the next nonblank character in the string.
%
%  If this initial nonblank is a special character,
%  then that's the whole word as far as we're concerned,
%  so return immediately.
%
  if ( s(ilo) == '"' | ...
       s(ilo) == '(' | ...
       s(ilo) == ')' | ...
       s(ilo) == '{' | ...
       s(ilo) == '}' | ...
       s(ilo) == '[' | ...
       s(ilo) == ']' )

    word = s(ilo);
    next = ilo + 1;
    return

  end
%
%  Now search for the last contiguous character that is not a
%  blank, TAB, or special character.
%
  next = ilo + 1;

  while ( next <= lenc )

    if ( s(next) == ' ' )
      break;
    elseif ( s(next) == tab )
      break;
    elseif ( s(next) == '"' )
      break;
    elseif ( s(next) == '(' )
      break;
    elseif ( s(next) == ')' )
      break;
    elseif ( s(next) == '{' )
      break;
    elseif ( s(next) == '}' )
      break;
    elseif ( s(next) == '[' )
      break;
    elseif ( s(next) == ']' )
      break;
    end

    next = next + 1;

  end

  if ( s(next-1) == ',' ) 
    word = s(ilo:next-2);
  else
    word = s(ilo:next-1);
  end

  return
end
