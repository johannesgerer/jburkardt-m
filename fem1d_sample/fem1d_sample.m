function fem1d_sample ( fem_prefix, sample_prefix )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D_SAMPLE.
%
%  Discussion:
%
%    FEM1D_SAMPLE reads files defining a 1D FEM representation of data,
%    and writes out two files containing the arguments and values of the
%    finite element function at sample points.
%
%  Usage:
%
%    fem1d_sample fem_prefix sample_prefix
%
%    where 'fem_prefix' is the common prefix for the FEM files:
%
%    * fem_prefix_nodes.txt,    the node coordinates.
%    * fem_prefix_elements.txt, the nodes that make up each element;
%    * fem_prefix_values.txt,   the values defined at each node.
%
%    and 'sample_prefix' is the common prefix for the SAMPLE files.
%    (the node file is input, and the values file is created by the program.)
%
%    * sample_prefix_nodes.txt,  the node coordinates where samples are desired.
%    * sample_prefix_values.txt, the values computed at each sample node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_SAMPLE\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read files defining an FEM function of 1 argument.\n' );
  fprintf ( 1, '  Read a file of sample arguments.\n' );
  fprintf ( 1, '  Write a file of function values at the arguments.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 ) then

    fprintf ( 1, '\n' );
    fem_prefix = input ( 'Enter the FEM file prefix:' );

  end

  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    sample_prefix = input ( 'Enter the sample file prefix:' );

  end
%
%  Create the filenames.
%
  fem_node_filename = strcat ( fem_prefix, '_nodes.txt' );
  fem_element_filename = strcat ( fem_prefix, '_elements.txt' );
  fem_value_filename = strcat ( fem_prefix, '_values.txt' );

  sample_node_filename = strcat ( sample_prefix, '_nodes.txt' );
  sample_value_filename = strcat ( sample_prefix, '_values.txt' );
%
%  Read the FEM data.
%
  [ fem_node_dim, fem_node_num ] = r8mat_header_read ( fem_node_filename );

  fem_node_x = r8mat_data_read ( fem_node_filename, fem_node_dim, fem_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The FEM node dimension is        %d\n', fem_node_dim );
  fprintf ( 1, '  The FEM node number is           %d\n', fem_node_num );

  if ( fem_node_dim ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension of the nodes is not 1.\n' );
    return
  end

  [ fem_element_order, fem_element_num ] = i4mat_header_read ( ...
    fem_element_filename );

  fem_element_node = i4mat_data_read ( fem_element_filename, fem_element_order, ...
    fem_element_num );

  fprintf ( 1, '  The FEM element order is         %d\n', fem_element_order );
  fprintf ( 1, '  The FEM element number is        %d\n', fem_element_num );

  [ fem_value_dim, fem_value_num ] = r8mat_header_read ( fem_value_filename );

  fprintf ( 1, '  The FEM value order is           %d\n', fem_value_dim );
  fprintf ( 1, '  the FEM value number is          %d\n', fem_value_num );

  if ( fem_value_num ~= fem_node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Number of FEM values and FEM nodes differ.\n' );
    return
  end

  fem_value = r8mat_data_read ( fem_value_filename, fem_value_dim, fem_value_num );
%
%  Read the SAMPLE node data.
%
  [ sample_node_dim, sample_node_num ] = r8mat_header_read ( ...
    sample_node_filename );

  sample_node_x = r8mat_data_read ( sample_node_filename, sample_node_dim, ...
    sample_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample node spatial dimension is %d\n', sample_node_dim );
  fprintf ( 1, '  Sample node number is            %d\n', sample_node_num );

  if ( sample_node_dim ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension of the sample nodes is not 1.\n' );
    return
  end
%
%  Compute the SAMPLE values.
%
  sample_value_dim = fem_value_dim;
  sample_value_num = sample_node_num;

  sample_value = fem1d_evaluate ( fem_node_num, fem_node_x, fem_element_order, ...
    fem_element_num, fem_value_dim, fem_value, sample_node_num, sample_node_x );
%
%  Write the sample values.
%
  r8mat_write ( sample_value_filename, sample_value_dim, ...
    sample_value_num, sample_value );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolated FEM data written to "%s".\n', ...
    sample_value_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_SAMPLE\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function sample_value = fem1d_evaluate ( node_num, node_x, element_order, ...
  element_num, value_dim, value, sample_node_num, sample_node_x )

%*****************************************************************************80
%
%% FEM1D_EVALUATE evaluates a 1D FEM function at sample points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of FEM nodes.
%
%    Input, real NODE_X(NODE_NUM), the nodes.
%
%    Input, integer ELEMENT_ORDER, the element order.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer VALUE_DIM, the value dimension.
%
%    Input, real VALUE(VALUE_DIM,NODE_NUM), the FEM values.
%
%    Input, integer SAMPLE_NODE_NUM, the number of sample points.
%
%    INput, real SAMPLE_NODE_X(SAMPLE_NODE_NUM), the sample nodes.
%
%    Output, real SAMPLE_VALUE(VALUE_DIM,SAMPLE_NODE_NUM),
%    the interpolated FEM values at sample nodes.
%

%
%  For each sample point, find NODE_LEFT and NODE_RIGHT that bracket it.
%
  sample_left = r8vec_bracket4 ( node_num, node_x, sample_node_num, ...
    sample_node_x );

  if ( element_order == 1 )

    for sample = 1 : sample_node_num
      sample_value(1:value_dim,sample) = value(1:value_dim,sample_left(sample));
    end

  elseif ( element_order == 2 )

    for sample = 1 : sample_node_num

      l = sample_left(sample);
      r = sample_left(sample)+1;

      sample_value(1:value_dim,sample) = ...
        ( value(1:value_dim,l) * ( node_x(r) - sample_node_x(sample)             )   ...
        + value(1:value_dim,r) * (             sample_node_x(sample) - node_x(l) ) ) ...
        /                        ( node_x(r)                         - node_x(l) );

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM_EVALUATE - Fatal error!\n' );
    fprintf ( 1, '  Cannot handle elements of this order.\n' );
    error ( 'FEM_EVALUATE - Fatal error!' );

  end

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
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
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
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%

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

  table = zeros ( m, n );

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
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%

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

  table = zeros(m,n);

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
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function left = r8vec_bracket4 ( nt, t, ns, s )

%*****************************************************************************80
%
%% R8VEC_BRACKET4 finds the nearest interval to each of a vector of values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    The routine always returns the index LEFT of the sorted array
%    T with the property that either
%    *  T is contained in the interval [ T(LEFT), T(LEFT+1) ], or
%    *  T < T(LEFT) = T(1), or
%    *  T > T(LEFT+1) = T(N).
%
%    The routine is useful for interpolation problems, where
%    the abscissa must be located within an interval of data
%    abscissas for interpolation, or the "nearest" interval
%    to the (extreme) abscissa must be found so that extrapolation
%    can be carried out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, length of the input array.
%
%    Input, real T(NT), an array that has been sorted
%    into ascending order.
%
%    Input, integer NS, the number of points to be bracketed.
%
%    Input, real S(NS), values to be bracketed by entries of T.
%
%    Output, integer LEFT(NS).
%    LEFT(I) is set so that the interval [ T(LEFT(I)), T(LEFT(I)+1) ]
%    is the closest to S(I); it either contains S(I), or else S(I)
%    lies outside the interval [ T(1), T(NT) ].
%

%
%  Check the input data.
%
  if ( nt < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET4 - Fatal error!\n' );
    fprintf ( 1, '  NT must be at least 2.\n' );
    error ( 'R8VEC_BRACKET4 - Fatal error!' );
  end

  for i = 1 : ns

    left(i) = floor ( ( nt + 1 ) / 2 );
%
%  CASE 1: S < T(LEFT):
%  Search for S in [T(I), T(I+1)] for intervals I = 1 to LEFT-1.
%
    if ( s(i) < t(left(i)) )

      if ( left(i) == 1 )
        continue
      elseif ( left(i) == 2 )
        left(i) = 1;
        continue
      elseif ( t(left(i)-1) <= s(i) )
        left(i) = left(i) - 1;
        continue
      elseif ( s(i) <= t(2) )
        left(i) = 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = 2 to LEFT-2.
%
      low = 2;
      high = left(i) - 2;

      while ( 1 )

        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE2: T(LEFT+1) < S:
%  Search for S in [T(I),T(I+1)] for intervals I = LEFT+1 to N-1.
%
    elseif ( t(left(i)+1) < s(i) )

      if ( left(i) == nt - 1 )
        continue
      elseif ( left(i) == nt - 2 )
        left(i) = left(i) + 1;
        continue
      elseif ( s(i) <= t(left(i)+2) )
        left(i) = left(i) + 1;
        continue
      elseif ( t(nt-1) <= s(i) )
        left(i) = nt - 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = LEFT+2 to NT-2.
%
      low = left(i) + 2;
      high = nt - 2;

      while ( 1 )

        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE3: T(LEFT) <= S <= T(LEFT+1):
%  S is in [T(LEFT), T(LEFT+1)].
%
    else

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
