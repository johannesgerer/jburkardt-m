function tsp_brute ( )

%*****************************************************************************80
%
%% MAIN is the main program for TSP_BRUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSP_BRUTE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Solve small traveling salesman problems by brute force.\n' );
%
%  Get the distance table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program needs to read a file containing\n' );
  fprintf ( 1, '  a city-to-city distance table.\n' );  
  distance_filename = input ( '  Enter the file name, in quotes:  ' );

  [ m, n ] = r8mat_header_read ( distance_filename );

  distance = r8mat_data_read ( distance_filename, n, n );
%
%  Print the distance matrix.
%
  r8mat_print ( n, n, distance, '  Distance matrix:' )
%
%  Examine every permutation.
%
  total_max = - inf;
  total_min = inf;
  total_ave = 0.0;

  more = 0;
  p = [];
  p_min = [];

  paths = 0;

  while ( 1 )

    [ p, more ] = perm_next3 ( n, p, more );

    paths = paths + 1;

    total = 0.0;
    i1 = n;
    for i2 = 1 : n
      total = total + distance ( p(i1), p(i2) );
      i1 = i2;
    end

    total_ave = total_ave + total;

    if ( total_max < total )
      total_max = total;
    end

    if ( total < total_min )
      total_min = total;
      p_min(1:n) = p(1:n);
    end

    if ( ~ more )
      break
    end

  end

  total_ave = total_ave / paths;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Itinerary:\n' );
  fprintf ( 1, '  Step  From  To    Distance\n' );
  fprintf ( 1, '\n' );
  i1 = n;
  for i2 = 1 : n
    fprintf ( 1, '  %4d    %2d  %2d  %14.6g\n', ...
      i2, p_min(i1), p_min(i2), distance ( p_min(i1), p_min(i2) ) );
    i1 = i2;
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total:      %g\n', total_min );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of paths checked = %d\n', paths );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum length = %g\n', total_min );
  fprintf ( 1, '  Average length = %g\n', total_ave );
  fprintf ( 1, '  Maximum length = %g\n', total_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSP_BRUTE\n' );
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
function [ p, more ] = perm_next3 ( n, p, more )

%*****************************************************************************80
%
%% PERM_NEXT3 computes all of the permutations of N objects, one at a time.
%
%  Discussion:
%
%    The routine is initialized by calling with MORE = TRUE, in which case
%    it returns the identity permutation.
%
%    If the routine is called with MORE = FALSE, then the successor of the
%    input permutation is computed.
%
%    Trotter's algorithm is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hale Trotter,
%    Algorithm 115:
%    PERM,
%    Communications of the Association for Computing Machinery,
%    Volume 5, 1962, pages 434-435.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input/output, integer P(N), the permutation, in standard
%    index form.  If MORE is TRUE, then P is assumed to contain the
%    "previous" permutation, and on P(I) is the value
%    of the I-th object under the next permutation.
%    Otherwise, P will be set to the "first" permutation.
%
%    Input/output, integer MORE.
%    Set MORE = FALSE before first calling this routine.
%    MORE will be reset to TRUE and a permutation will be returned.
%    Each new call produces a new permutation until MORE is returned FALSE.
%
  persistent nfact
  persistent rank

  if ( ~ more )

    for i = 1 : n
      p(i) = i;
    end

    more = 1;
    rank = 1;

    nfact = 1;
    for i = 2 : n
      nfact = nfact * i;
    end

  else

    n2 = n;
    m2 = rank;
    s = n;

    while ( 1 )

      q = mod ( m2, n2 );
      t = mod ( m2, 2 * n2 );

      if ( q ~= 0 )
        break
      end

      if ( t == 0 )
        s = s - 1;
      end

      m2 = floor ( m2 / n2 );
      n2 = n2 - 1;

    end

    if ( q == t )
      s = s - q;
    else
      s = s + q - n2;
    end
%
%  Swap.
%
    t = p(s);
    p(s) = p(s+1);
    p(s+1) = t;

    rank = rank + 1;

    if ( rank == nfact )
      more = 0;
    end

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
function r8mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_PRINT prints an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Input, string TITLE, a title.
%
  r8mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function r8mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_PRINT_SOME prints out a portion of an R8MAT.
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  if ( m <= 0 || n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (None)\n' );
    return
  end

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%7d :', i );
      
      for j = j2lo : j2hi
        fprintf ( 1, '%12g  ', a(i,j) );
      end

      fprintf ( 1, '\n' );

    end

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
