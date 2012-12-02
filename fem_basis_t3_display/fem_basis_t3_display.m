function fem_basis_t3_display ( prefix )

%*****************************************************************************80
%
%% FEM_BASIS_T3_DISPLAY displays a finite element T3 basis.
%
%  Discussion:
%
%    This program reads a data file defining a set of nodes, and a
%    data file defining the triangulation of those nodes using 3 node triangles
%    (or 6 node triangles, as long as the vertices are listed first).
%
%    The program then asks the user interactively to select one of the
%    nodes.  It computes the basis function associated with that node
%    and displays it over the entire mesh.  Of course, the basis function
%    will only be nonzero over a small number of the elements, but it
%    is instructive to see the entire mesh.
%
%    The display is initially "flat", but by using the manipulator
%    on the graphics menu, the user can easily get some dramatic images
%    of the basis function.
%
%  Usage:
%
%    fem_basis_t3_display ( 'prefix' )
%
%    where 'prefix' is the common prefix for the FEM files:
%
%    * 'prefix'_nodes.txt,    the node coordinates.
%    * 'prefix'_elements.txt, the nodes that make up each element;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common filename prefix.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_T3_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display basis functions associated with \n' );
  fprintf ( 1, '  a finite element grid of linear triangles ("T3").\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program reads two files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * node_file,     the node file,\n' );
  fprintf ( 1, '  * element_file,  the element file,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies a basis function by node index, and\n' );
  fprintf ( 1, '  the program displays a surface plot of that basis function.\n' );
  fprintf ( 1, '  (Use the 3D ROTATE option to see the full picture!\n' );
%
%  Get the prefix if missing.
%
  if ( nargin < 1 )
    prefix = input ( '  Enter the common file prefix:  ' );
  end
%
%  Construct the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the nodes.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM_BASIS_T3_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension is not 2.\n' );
    error ( 'FEM_BASIS_T3_DISPLAY - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );
%
%  Read the elements.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  if ( element_order ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM_BASIS_T3_DISPLAY\n' );
    fprintf ( 1, '  This program requires that the elements have order 3.\n' );
    fprintf ( 1, '  Your elements have order %d\n', element_order );
    error ( 'FEM_BASIS_T3_DISPLAY - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );
%
%  Set up the graph.
%
  x_min = min ( node_xy(1,:) );
  x_max = max ( node_xy(1,:) );
  y_min = min ( node_xy(2,:) );
  y_max = max ( node_xy(2,:) );
  z_min = 0.0;
  z_max = 1.0;

  node_min = min ( min ( element_node ) );
  node_max = max ( max ( element_node ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Every basis function is associated with a node.\n' );
  fprintf ( 1, '  To chooose a basis function, you specify a node.\n' );
  fprintf ( 1, '  Nodes range in value from %d to %d.\n', node_min, node_max );
  
  while ( 1 )

    fprintf ( 1, '\n' );
    prompt = sprintf ( 'Enter a node between %d and %d: ', node_min, node_max );
    node_index = input ( prompt );

    if ( node_index < node_min | node_max < node_index )
      break
    end
%
%  Clear the graphics page.
%
    clf
    
    fprintf ( 1, '\n' );
  
    for element = 1 : element_num
    
      local = 0;
      for j = 1 : element_order
        if ( element_node(j,element) == node_index )
          fprintf ( 1, '  Node %d occurs as local node %d in element %d.\n', ...
            node_index, j, element );
          local = j;
        end 
      end

      z(1:2,1:2) = 0.0;

      if ( local == 0 )

        x(1,1) = node_xy(1,element_node(1,element)); 
        y(1,1) = node_xy(2,element_node(1,element));
        x(2,1) = node_xy(1,element_node(1,element)); 
        y(2,1) = node_xy(2,element_node(1,element));
        x(1,2) = node_xy(1,element_node(2,element)); 
        y(1,2) = node_xy(2,element_node(2,element));
        x(2,2) = node_xy(1,element_node(3,element)); 
        y(2,2) = node_xy(2,element_node(3,element));

      else

        x(1,1) = node_xy(1,element_node(local,element)); 
        y(1,1) = node_xy(2,element_node(local,element));
        z(1,1) = 1.0;

        x(2,1) = node_xy(1,element_node(local,element)); 
        y(2,1) = node_xy(2,element_node(local,element));
        z(2,1) = 1.0;

        j = i4_wrap ( local + 1, 1, element_order );
        x(1,2) = node_xy(1,element_node(j,element)); 
        y(1,2) = node_xy(2,element_node(j,element));

        j = i4_wrap ( j + 1, 1, element_order );
        x(2,2) = node_xy(1,element_node(j,element)); 
        y(2,2) = node_xy(2,element_node(j,element));

      end
    
      caxis ( [ -0.4, 1.2 ] )
      surface ( x, y, z, 'FaceColor', 'interp' )

    end

    axis ( [ x_min, x_max, y_min, y_max, z_min, z_max ] );
    axis equal

    xlabel ( '--X axis--' );
    ylabel ( '--Y axis--' );
    zlabel ( '--Z axis--' );

    title_string = sprintf ( 'T3 basis function for node %d', node_index );
    title ( title_string );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_T3_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ qi, dqidx, dqidy ] = basis_11_t3 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T3: one basis at one point for the T3 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the nodes of a triangle. 
%        
%           3
%          / \
%         /   \
%        /     \
%       1-------2
%
%    It evaluates the linear basis function Q(I)(X,Y) associated with
%    node I, which has the property that it is a linear function
%    which is 1 at node I and zero at the other two nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the nodes.
%
%    Input, integer I, the index of the desired basis function.
%    I should be between 1 and 3.
%
%    Input, real P(2), the coordinates of a point at which the basis
%    function is to be evaluated.
%
%    Output, real QI, DQIDX, DQIDY, the values of the basis function
%    and its X and Y derivatives.
%
  area = abs ( t(1,1) * ( t(2,2) - t(2,3) ) ...
             + t(1,2) * ( t(2,3) - t(2,1) ) ...
             + t(1,3) * ( t(2,1) - t(2,2) ) );

  if ( area == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Element has zero area.\n' );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  if ( i < 1 | 3 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Basis index I is not between 1 and 3.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  ip1 = i4_wrap ( i + 1, 1, 3 );
  ip2 = i4_wrap ( i + 2, 1, 3 );

  qi = ( ( t(1,ip2) - t(1,ip1) ) * ( p(2) - t(2,ip1) ) ...
       - ( t(2,ip2) - t(2,ip1) ) * ( p(1) - t(1,ip1) ) ) / area;

  dqidx = - ( t(2,ip2) - t(2,ip1) ) / area;
  dqidy =   ( t(1,ip2) - t(1,ip1) ) / area;

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
    column_num = -1;
    return;
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
    row_num = -1;
    return;
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
function value = i4_modp ( i, j )

%*****************************************************************************80
%
%% I4_MODP returns the nonnegative remainder of I4 division.
%
%  Discussion:
%
%    If
%      NREM = I4_MODP ( I, J )
%      NMULT = ( I - NREM ) / J
%    then
%      I = J * NMULT + NREM
%    where NREM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, I4_MODP(A,360) is between 0 and 360, always.
%
%  Example:
%
%        I     J     MOD  I4_MODP    Factorization
%
%      107    50       7       7    107 =  2 *  50 + 7
%      107   -50       7       7    107 = -2 * -50 + 7
%     -107    50      -7      43   -107 = -3 *  50 + 43
%     -107   -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be divided.
%
%    Input, integer J, the number that divides I.
%
%    Output, integer VALUE, the nonnegative remainder when I is
%    divided by J.
%
  if ( j == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODP - Fatal error!\n' );
    fprintf ( 1, '  Illegal divisor J = %d\n', j );
    error ( 'I4_MODP - Fatal error!' );
  end

  value = mod ( i, j );

  if ( value < 0 )
    value = value + abs ( j );
  end

  return
end
function value = i4_wrap ( ival, ilo, ihi )

%*****************************************************************************80
%
%% I4_WRAP forces an integer to lie between given limits by wrapping.
%
%  Example:
%
%    ILO = 4, IHI = 8
%
%    I   Value
%
%    -2     8
%    -1     4
%     0     5
%     1     6
%     2     7
%     3     8
%     4     4
%     5     5
%     6     6
%     7     7
%     8     8
%     9     4
%    10     5
%    11     6
%    12     7
%    13     8
%    14     4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IVAL, an integer value.
%
%    Input, integer ILO, IHI, the desired bounds for the integer value.
%
%    Output, integer I4_WRAP, a "wrapped" version of IVAL.
%
  jlo = min ( ilo, ihi );
  jhi = max ( ilo, ihi );

  wide = jhi - jlo + 1;

  if ( wide == 1 )
    value = jlo;
  else
    value = jlo + i4_modp ( ival - jlo, wide );
  end

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
  table = [];
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
    return;
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
  table = [];
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
    return;
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
