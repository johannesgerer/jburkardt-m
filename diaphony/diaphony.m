function diaphony ( input_filename )

%*****************************************************************************80
%
%% MAIN is the main program for DIAPHONY.
%
%  Discussion:
%
%    DIAPHONY reads a table dataset and applies the diaphony test.
%
%  Usage:
%
%    diaphony ( 'table_file' )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2012
%
%  Author:
%
%    John Burkardt
%
  verbose = 0;

  if ( verbose )
    timestamp ( );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIAPHONY:\n' );
    fprintf ( 1, '  MATLAB version\n' );
    fprintf ( 1, '  Compute the diaphony of a point set.\n' );
  end
%
%  Get the filename.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    input_filename = input ( 'Enter the name of the input file.' );
  end
%
%  Get the data size.
%
  [ dim_num, point_num ] = r8mat_header_read ( input_filename );

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The spatial dimension is %d\n', dim_num );
    fprintf ( 1, '  The number of points is %d\n', point_num );
  end
%
%  Read the data.
%
  points = r8mat_data_read ( input_filename, dim_num, point_num );

  if ( min ( min ( points ) ) < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIAPHONY - Fatal error!\n' );
    fprintf ( 1, '  At least one coordinate of a point is less than 0!\n' );
    error ( 'DIAPHONY - Fatal error!' )
  elseif ( 1.0 < max ( max ( points ) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIAPHONY - Fatal error!\n' );
    fprintf ( 1, '  At least one coordinate of a point is greater than 1!\n' );
    error ( 'DIAPHONY - Fatal error!' )
  end
%
%  Analyze the data.
%
  d = diaphony_compute ( dim_num, point_num, points );

  e = 1.0 / sqrt ( point_num );
  de = d / e;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  File  M  N  Diaphony  1/sqrt(N)  D/sqrt(N)\n' );
  fprintf ( 1, '  %s  %2d  %5d  %14.6g  %14.6g  %14.6g\n', ...
    input_filename, dim_num, point_num, d, e, de );
%
%  Terminate.
%
  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIAPHONY:\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    fprintf ( 1, '\n' );
    timestamp ( )
  end

  return
end
function d = diaphony_compute ( dim_num, point_num, x )

%*****************************************************************************80
%
%% DIAPHONY_COMPUTE evaluates the diaphony of a N-dimensional point set.
%
%  Discussion:
%
%    The diaphony is analogous to, and related to, the discrepancy,
%    and is a measure of how well spread a set of point is.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Heelekalek, Harald Niederreiter,
%    The Weighted Spectral Test: Diaphony,
%    ACM Transactions on Modeling and Computer Simulation,
%    Volume 8, Number 1, January 1998, pages 43-60.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real X(DIM_NUM,POINT_NUM), the point set, which is
%    presumed to lie in the DIM_NUM dimensional unit hypercube.
%
%    Output, real D, the value of the diaphony.
%
  d = 0.0;

  for i = 1 : point_num
    for j = 1 : point_num
      z(1:dim_num) = x(1:dim_num,i) - x(1:dim_num,j);
      for k = 1 : dim_num
        z(k) = r8_modp ( z(k), 1.0 );
      end
      d = d - 1.0 + prod ( ...
        ( 1.0 + 2.0 * pi^2 * ( z(1:dim_num).^2 - z(1:dim_num) + 1.0 / 6.0 ) ) );
    end
  end

  bot = point_num^2 * ( ( 1.0 + pi^2 / 3.0 )^dim_num - 1.0 );

  d = d / bot;

  d = sqrt ( d );

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
%    08 February 2010
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
    return
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
%    08 February 2010
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
function value = r8_modp ( x, y )

%*****************************************************************************80
%
%% R8_MODP returns the nonnegative remainder of real division.
%
%  Discussion:
%
%    If
%      REM = R8_MODP ( X, Y )
%      RMULT = ( X - REM ) / Y
%    then
%      X = Y * RMULT + REM
%    where REM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360.0) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, R8_MODP(A,360.0) is between 0 and 360, always.
%
%  Example:
%
%        I         J     MOD R8_MODP  R8_MODP Factorization
%
%      107        50       7       7    107 =  2 *  50 + 7
%      107       -50       7       7    107 = -2 * -50 + 7
%     -107        50      -7      43   -107 = -3 *  50 + 43
%     -107       -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number to be divided.
%
%    Input, real Y, the number that divides X.
%
%    Output, real VALUE, the nonnegative remainder when X is divided by Y.
%
  if ( y == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_MODP - Fatal error!\n' );
    fprintf ( 1, '  R8_MODP ( X, Y ) called with Y = %f\n', y );
    error ( 'R8_MODP - Fatal error!' );
  end

  value = mod ( x, y );

  if ( value < 0.0 )
    value = value + abs ( y );
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
