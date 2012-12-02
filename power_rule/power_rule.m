function power_rule ( quad_1d_filename, dim_num )

%*****************************************************************************80
%
%% MAIN is the main program for POWER_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 May 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create a multidimensional power rule\n' );
  fprintf ( 1, '  as a product of identical 1D integration rules.\n' );
%
%  Get the 1D quadrature file root name:
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE:\n' );

    quad_1d_filename = input ( ...
      '  Enter the "root" name of the 1D quadrature files.' );

  end
%
%  Create the names of:
%    the 1D quadrature X file;
%    the 1D quadrature W file;
%    the 1D quadrature R file;
%
  quad_x_1d_filename = strcat ( quad_1d_filename, '_x.txt' );
  quad_w_1d_filename = strcat ( quad_1d_filename, '_w.txt' );
  quad_r_1d_filename = strcat ( quad_1d_filename, '_r.txt' );
%
%  The second command line argument is the spatial dimension.
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE:\n' );
    dim_num = input ( '  Enter the spatial dimension of the rule.\n' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_RULE: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_1d_filename);
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_1d_filename);
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_1d_filename);
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
%
%  Read the X file.
%
  [ dim_num_1d, point_num_1d ] = r8mat_header_read ( quad_x_1d_filename );

  if ( dim_num_1d ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE - Fatal error!\n' );
    fprintf ( 1, '  The 1D quadrature abscissa file should have exactly\n' );
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'POWER_RULE - Fatal error!' )
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points in 1D rule = %d\n', point_num_1d );

  x_1d = r8mat_data_read ( quad_x_1d_filename, dim_num_1d, point_num_1d );
%
%  Read the W file.
%
  [ dim_num_1d, point_num_1d2 ] = r8mat_header_read ( quad_w_1d_filename );

  if ( dim_num_1d ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE - Fatal error!\n' );
    fprintf ( 1, '  The 1D quadrature weight file should have exactly\n' );
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'POWER_RULE - Fatal error!' )
  end

  if ( point_num_1d2 ~= point_num_1d )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE - Fatal error!\n' );
    fprintf ( 1, '  The 1D quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'POWER_RULE - Fatal error!' )
  end

  w_1d = r8mat_data_read ( quad_w_1d_filename, dim_num_1d, point_num_1d );
%
%  Read the R file.
%
  [ dim_num_1d, point_num_1d2 ] = r8mat_header_read ( quad_r_1d_filename );

  if ( dim_num_1d ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE - Fatal error!\n' );
    fprintf ( 1, '  The 1D quadrature region file should have exactly\n' );
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'POWER_RULE - Fatal error!' )
  end

  if ( point_num_1d2 ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POWER_RULE - Fatal error!\n' );
    fprintf ( 1, '  The 1D quadrature weight file should have exactly\n' );
    fprintf ( 1, '  two lines.\n' );
    error ( 'POWER_RULE - Fatal error!' )
  end

  r_1d = r8mat_data_read ( quad_r_1d_filename, 1, 2 );
%
%  Determine size of the rule.
%
  point_num = power_rule_size ( point_num_1d, dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points in rule = %d\n', point_num );
%
%  Compute the rule.
%
  [ x, w, r ] = power_rule_set ( point_num_1d, x_1d, w_1d, r_1d, ...
    dim_num, point_num );
%
%  Write rule to files.
%
  quad_filename = 'power';

  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating power quadrature rule X file = "%s".\n', ...
    quad_x_filename);

  r8mat_write ( quad_x_filename, dim_num, point_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating power quadrature rule W file = "%s".\n', ...
    quad_w_filename);

  r8mat_write ( quad_w_filename, 1, point_num, w );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating power quadrature rule R file = "%s".\n', ...
    quad_r_filename);

  r8mat_write ( quad_r_filename, dim_num, 2, r );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_RULE:\n' );
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
function [ x, w, r ] = power_rule_set ( point_num_1d, x_1d, ...
  w_1d, r_1d, dim_num, point_num )

%*****************************************************************************80
%
%% POWER_RULE_SET sets up a power rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM_1D, the order of the 1D rule.
%
%    Input, real X_1D(POINT_NUM_1D), the points of the 1D rule.
%
%    Input, real W_1D(POINT_NUM_1D), the weights of the 1D rule.
%
%    Input, real R_1D(2), the extreme points that define
%    the range of the 1D region.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points in the rule.
%
%    Output, real X(DIM_NUM,POINT_NUM), the points of the rule.
%
%    Output, real W(POINT_NUM), the weights of the rule.
%
%    Output, real R(DIM_NUM,2), the extreme points 
%    that define the range of the product rule region.
%
  x = zeros ( dim_num, point_num );
  w = zeros ( 1, point_num );
  r = zeros ( dim_num, 2 );

  k = 0;
  indx = [];

  while ( 1 )

    [ k, indx ] = tuple_next ( 1, point_num_1d, dim_num, k, indx );

    if ( k == 0  )
      break
    end

    w(k) = prod ( w_1d(indx(1:dim_num)) );

    x(1:dim_num,k) = x_1d(indx(1:dim_num));

  end

  r(1:dim_num,1) = r_1d(1);
  r(1:dim_num,2) = r_1d(2);

  return
end
function point_num = power_rule_size ( point_num_1d, dim_num )

%*****************************************************************************80
%
%% POWER_RULE_SIZE returns the size of a power rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM_1D, the number of points in the 1D rule.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, integer POINT_NUM, the number of points in the rule.
%
  point_num = point_num_1d^dim_num;

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
function [ rank, x ] = tuple_next ( m1, m2, n, rank, x )

%*****************************************************************************80
%
%% TUPLE_NEXT computes the next element of a tuple space.
%
%  Discussion:
%
%    The elements are N vectors.  Each entry is constrained to lie
%    between M1 and M2.  The elements are produced one at a time.
%    The first element is
%      (M1,M1,...,M1),
%    the second element is
%      (M1,M1,...,M1+1),
%    and the last element is
%      (M2,M2,...,M2)
%    Intermediate elements are produced in lexicographic order.
%
%  Example:
%
%    N = 2, M1 = 1, M2 = 3
%
%    INPUT        OUTPUT
%    -------      -------
%    Rank  X      Rank   X
%    ----  ---    -----  ---
%    0     * *    1      1 1
%    1     1 1    2      1 2
%    2     1 2    3      1 3
%    3     1 3    4      2 1
%    4     2 1    5      2 2
%    5     2 2    6      2 3
%    6     2 3    7      3 1
%    7     3 1    8      3 2
%    8     3 2    9      3 3
%    9     3 3    0      0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M1, M2, the minimum and maximum entries.
%
%    Input, integer N, the number of components.
%
%    Input, integer RANK, counts the elements.
%    On first call, set RANK to 0.  On subsequent calls, the input value of
%    RANK should be the output value of RANK from the previous call.
%
%    Input, integer X(N), the previous tuple.
%
%    Output, integer RANK, the order of the next tuple.  When there are no
%    more elements, RANK will be returned as 0.
%
%    Output, integer X(N), the next tuple.
%
  if ( m2 < m1 )
    rank = 0;
    return
  end

  if ( rank <= 0 )

    x(1:n) = m1;
    rank = 1;

  else

    rank = rank + 1;
    i = n;

    while ( 1 )

      if ( x(i) < m2 )
        x(i) = x(i) + 1;
        break
      end

      x(i) = m1;

      if ( i == 1 )
        rank = 0;
        x(1:n) = m1;
        break
      end

      i = i - 1;

    end

  end

  return
end
