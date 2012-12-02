function triangle_histogram ( data_filename, n )

%*****************************************************************************80
%
%% MAIN iis the main program for TRIANGLE_HISTOGRAM.
%
%  Discussion:
%
%    TRIANGLE_HISTOGRAM reads a file of data, which is presumed to be a 
%    list of points in the unit triangle.
%
%    The unit triangle has vertices (1,0), (0,1) and (0,0).
%
%    The program divides the unit triangle into N * ( N + 1 ) / 2
%    subtriangles of equal area, and counts the number of data points
%    that are contained in each.
%
%    A report is produced.
%
%    One use for this program is to examine the uniformity of distribution
%    of a sampling of points in the triangle, produced by an algorithm
%    that is attempting a uniform sampling.
%
%  Usage:
%
%    triangle_histogram data_filename n
%
%    where
%
%    data_filename is the name of the file containing the sample points,
%    n is the number of subintervals each triangle side is divided into.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_HISTOGRAM\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Compute a histogram for data in the reference triangle.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_HISTOGRAM:\n' );
    data_filename = input ( '  Please enter the data filename.' );

  end

  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_HISTOGRAM:\n' );
    n = input ( '  Please enter N = 1, 2, 3, ..., the order of refinement.' );

  end
%
%  Read the DATA_XY data.
%
  [ dim_num, data_num ] = r8mat_header_read ( data_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of ""%s".\n', data_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points DATA_NUM = %d\n', data_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_HISTOGRAM - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension DIM_NUM must be 2.\n' );
    error ( 'TRIANGLE_HISTOGRAM - Fatal error!' );
  end

  data_xy(1:dim_num,1:data_num) = r8mat_data_read ( data_filename, ...
    dim_num, data_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in ""%s".\n', data_filename );

  r8mat_transpose_print_some ( dim_num, data_num, data_xy, 1, 1, ...
    dim_num, 5, '  First 5 data points:' );
%
%  Check the points for legality.
%
  for d = 1 : data_num
    if ( data_xy(1,d) < 0.0 || ...
         data_xy(2,d) < 0.0 || ...
                        1.0 < data_xy(1,d) + data_xy(2,d) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_HISTOGRAM - Fatal error!\n' );
      fprintf ( 1, '  Point %d does not lie inside the triangle.\n', d );
      fprintf ( 1, '  X = %f\n', data_xy(1,d) );
      fprintf ( 1, '  Y = %f\n', data_xy(2,d) );
      error ( 'TRIANGLE_HISTOGRAM - Fatal error!' );
    end
  end
%
%  Prepare the histogram.
%
  sub_num = n * n;
  histo = zeros(1:sub_num+1);
%
%  For each point, compute its barycentric coordinates, and hence
%  its triangle.
%
  for d = 1 : data_num

    i = floor (         data_xy(1,d)                  * n ) + 1;
    j = floor (                        data_xy(2,d)   * n ) + 1;
    k = floor ( ( 1.0 - data_xy(1,d) - data_xy(2,d) ) * n ) + 1;

    if ( i < 1 || n < i || ...
         j < 1 || n < j || ...
         k < 1 || n < k )
      t = n * n + 1;
    else
      t = 2 * i + ( n - j ) * ( n - j ) + mod ( k - 1, 2 ) - 1;
    end

    histo(t) = histo(t) + 1;

  end
%
%  Histogram statistics.
%
  histo_ave = sum ( histo(1:sub_num) ) / sub_num;
  histo_max = max ( histo(1:sub_num) );
  histo_min = min ( histo(1:sub_num) );
  histo_std = i4vec_std ( sub_num, histo );
%
%  Print the histogram.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data from file "%s".\n', data_filename );
  fprintf ( 1, '  Number of points = %d\n', data_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle refinement level N = %d\n', n );
  fprintf ( 1, '  Number of triangles = %d\n', sub_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Counting number of points in each subtriangle:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum = %d\n', histo_min );
  fprintf ( 1, '  Average = %f\n', histo_ave );
  fprintf ( 1, '  Maximum = %d\n', histo_max );
  fprintf ( 1, '  STD     = %f\n', histo_std );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     COUNT\n' );
  fprintf ( 1, '\n' );
  for k = 1 : n * n
    fprintf ( 1, '  %8d\n', histo(k) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of out-or-range points = %8d\n', histo(n*n+1) );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_HISTOGRAM\n' );
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
function std = i4vec_std( n, x )

%*****************************************************************************80
%
%% I4VEC_STD returns the standard deviation of an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer X(N), the vector whose variance is desired.
%
%    Output, real STD, the standard deviation of the vector entries.
%
  if ( n < 2 )

    std = 0.0;

  else

    mean = sum ( x(1:n) ) / n;

    std = sum ( ( x(1:n) - mean ).^2 );

    std = sqrt ( std / ( n - 1 ) );

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
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 5;

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
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

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
