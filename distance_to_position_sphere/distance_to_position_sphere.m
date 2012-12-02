function distance_to_position_sphere ( input_filename, radius )

%*****************************************************************************80
%
%% DISTANCE_TO_POSITION_SPHERE computes positions from pairwise distances on a sphere.
%
%  Discussion:
%
%    DISTANCE_TO_POSITION_SPHERE is the main routine of a program that tries to 
%    determine relative distances of a set of N objects, based on their
%    pairwise distances on a sphere.
%
%    The input file is an N by N distance table.
%
%    The user must also specify the radius of the sphere.
%
%    If the sphere is the earth, then it may be useful to know that the
%    average radius is 6371.01 kilometers or 3958.76 miles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    distance_to_position_sphere ( 'input_filename', radius )
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISTANCE_TO_POSITION_SPHERE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a distance table for N points or cities on a sphere\n' );
  fprintf ( 1, '  of a given radius.\n' );
  fprintf ( 1, '  Assign coordinates to each point which will\n' );
  fprintf ( 1, '  reproduce the distance table with the lowest\n' );
  fprintf ( 1, '  discrepancy, in the least squares sense.\n' );

  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISTANCE_TO_POSITION_SPHERE:\n' );

    input_filename = input ( '  Enter the name of the input file.' );

  end

  if ( 2 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISTANCE_TO_POSITION_SPHERE:\n' );

    radius = input ( '  Enter the radius of the sphere.' );

  end

  city_dim = 3;
%
%  Read the distance data.
%
  [ n1, n2 ] = r8mat_header_read ( input_filename );

  if ( n1 ~= n2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISTANCE_TO_POSITION_SPHERE - Fatal error!\n' );
    fprintf ( 1, '  The input data does not seem to have the same\n' );
    fprintf ( 1, '  number of rows as columns.\n' );
    fprintf ( 1, '  N1 = %d\n', n1 );
    fprintf ( 1, '  N2 = %d\n', n2 );
    error ( 'DISTANCE_TO_POSITION - Fatal error!' );
  end

  city_num = n1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', city_dim );
  fprintf ( 1, '  Number of points N  = %d\n', city_num );

  distance = r8mat_data_read ( input_filename, city_num, city_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', input_filename );

  r8mat_print_some ( city_num, city_num, distance, 1, 1, 5, 5, ...
    '  5 by 5 portion of distance table:' );
%
%  Compute the positions as LATITUDE/LONGITUDE coordinates.
%
  ll = compute_ll_from_distance ( radius, city_num, distance );

  f = map ( ll, radius, city_num, distance );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Least squares residual for solution is %e\n', norm ( f ) );

  r8mat_transpose_print ( 2, city_num, ll, '  Computed LL coordinates (in radians):' );

  xyz = ll_to_xyz ( radius, city_num, ll );

  r8mat_transpose_print ( 3, city_num, xyz, '  Computed XYZ coordinates:' );

  distance2 = ll_to_distance ( radius, city_num, ll );

  r8mat_print_some ( city_num, city_num, distance2, 1, 1, 5, 5, ...
    '  5 by 5 portion of computed distance table:' );
%
%  Output the recomputed distance data.
%
  output_filename = file_name_ext_swap ( input_filename, 'dist2.txt' );

  r8mat_write ( output_filename, city_num, city_num, distance2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the recomputed distance data to "%s".\n', output_filename );
%
%  Output the XYZ position data.
%
  output_filename = file_name_ext_swap ( input_filename, 'xyz.txt' );

  r8mat_write ( output_filename, city_dim, city_num, xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the XYZ data to "%s".\n', output_filename );
%
%  Output the LL coordinates in degrees.
%
  ll(1:2,1:city_num) = 180.0 * ll(1:2,1:city_num) / pi;

  output_filename = file_name_ext_swap ( input_filename, 'latlon.txt' );

  r8mat_write ( output_filename, 2, city_num, ll );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the Latitude/Longitude data (in degrees) to "%s".\n', output_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISTANCE_TO_POSITION_SPHERE\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function ll = compute_ll_from_distance ( r, city_num, distance )

%*****************************************************************************80
%
%% COMPUTE_LL_FROM_DISTANCE determines LL from distance.
%
%  Discussion:
%
%    We are given a table of pairwise distances of a set of CITY_NUM
%    cities, which reside on a sphere of radius R.
%
%    We seek an assignment of LL coordinates ( latitude and longitude )
%    to these cities that will reproduce the given set of distances.
%
%    The form of the data and the function which evaluates the residuals
%    is dictated by the software that solves the nonlinear least squares
%    problem.
%
%    In this case, we are calling MATLAB's LSQNONLIN.
%
%    The selection of LSQNONLIN, the construction of the appropriate
%    anonymous function, and the setting of the options for LSQNONLIN
%    were initially devised by Gene Cliff, to whom grateful acknowledgement
%    is made.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, integer CITY_NUM, the number of cities.
%
%    Input, real DISTANCE(CITY_NUM,CITY_NUM), the city-to-city distances.
%
%    Output, real LL(2,CITY_NUM), an assignment of latitudes and longitudes
%    to the cities which will well approximate the distance table.

%
%  Generate a random initial estimate for POSITION.
%  LSQNONLIN needs POSITION to be a vector, not a matrix.
%
  ll = rand ( 2 * city_num, 1 );
%
%  Create a handle to the function which evaluates the discrepancies.
%
  r_hndl = @(z) map ( z, r, city_num, distance );
%
%  Set options to LSQNONLIN.
%
  OPTIONS = optimset ( 'lsqnonlin' ); 
  OPTIONS = optimset ( OPTIONS, 'Display', 'iter' );
  OPTIONS = optimset ( OPTIONS, 'TolFun', 1.0E-05 );
%
%  LSQNONLIN computes a solution POSITION that minimizes the sum of the
%  squares of the residuals.
%    
  ll = lsqnonlin ( r_hndl, ll(:), [], [], OPTIONS );
%
%  Reshape POSITION into a 2D array.
%
  ll = reshape ( ll(:), 2, city_num );
   
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
function distance = ll_to_distance ( r, city_num, ll )

%*****************************************************************************80
%
%% LL_TO_DISTANCE creates a distance matrix from LL coordinates.
%
%  Discussion:
%
%    The cities are assumed to lie on a sphere of radius R.
%
%    We are given the latitude and longitude in radians.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere
%
%    Input, integer CITY_NUM, the number of cities.
%
%    Input, real LL(2,CITY_NUM), the latitude and longitude for each city,
%    measured in radians.
%
%    Output, real DISTANCE(CITY_NUM,CITY_NUM), the distances.
%
  distance(1:city_num,1:city_num) = 0.0;

  for city1 = 1 : city_num
    for city2 = city1 + 1 : city_num
      distance(city1,city2) = sphere_distance1 ( ll(1,city1), ll(2,city1), ...
        ll(1,city2), ll(2,city2), r );
      distance(city2,city1) = distance(city1,city2);
    end
  end

  return
end
function xyz = ll_to_xyz ( r, n, ll )

%*****************************************************************************80
%
%% LL_TO_XYZ converts LL to XYZ coordinates.
%
%  Discussion:
%
%    LL coordinates are latitude and longitude, in radians,
%    with an associated value of R, the radius of the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius.
%
%    Input, integer N, the number of points.
%
%    Input, real LL(2,N), the latitude and longitude.
%
%    Output, real XYZ(3,N), the corresponding Cartesian coordinates.
%
  xyz(1,1:n) =   r * cos ( ll(2,1:n) ) .* cos ( ll(1,1:n) );
  xyz(2,1:n) =   r * sin ( ll(2,1:n) ) .* cos ( ll(1,1:n) );
  xyz(3,1:n) = - r *                      sin ( ll(1,1:n) );

  return
end
function f = map ( ll, r, city_num, distance )

%*****************************************************************************80
%
%% MAP is the function to be minimized for city positions.
%
%  Discussion:
%
%    On the sphere, we eliminate some of the ambiguity in the problem data
%    by assigned city #1 the coordinates (0,0) and city #2 the coordinates
%    (*,0).
%
%    The function used to minimize the sum of squares of the residuals
%    needs the city position data to be a vector, not a matrix.
%
%    The number of residuals is N1 + N2.
%
%    N1 counts the constraints used to remove nonuniqueness by setting
%    some coordinates to 0.
%
%    N2 counts the residuals that measure the discrepancy between computed
%    and prescribed distances between cities.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LL(CITY_DIM*CITY_NUM), the city positions, stored as
%    a vector of latitudes and longitudes.
%
%    Input, real R, the radius of the sphere.
%
%    Input, integer CITY_NUM, the number of cities.
%
%    Input, real DISTANCE(CITY_NUM,CITY_NUM), the pairwise city distances.
%
%    Output, real F(N1+N2), the residuals.
%
  n1 = 3;

  n2 = ( city_num * ( city_num - 1 ) ) / 2;

  f = zeros ( n1 + n2, 1 );

  k = 0;
%
%  City #1 has (0,0) coordinates.
%  City #2 has (*,0) coordinates.
%
  for city = 1 : 2
    for dim = city : 2
      k = k + 1;
      f(k) = ll(dim+(city-1)*2);
    end
  end
%
%  Now measure discrepancies with the distance table.
%
  for city1 = 1 : city_num
    for city2 = city1 + 1 : city_num

      lat1 = ll(1+(city1-1)*2);
      lon1 = ll(2+(city1-1)*2);

      lat2 = ll(1+(city2-1)*2);
      lon2 = ll(2+(city2-1)*2);

      k = k + 1;
      f(k) = distance(city1,city2) ...
        - sphere_distance1 ( lat1, lon1, lat2, lon2, r );

    end
  end

  return
end
function value = r8_epsilon ( )

%*****************************************************************************80
%
%% R8_EPSILON returns the R8 roundoff unit.
%
%  Discussion:
%
%    The roundoff unit is a number R which is a power of 2 with the 
%    property that, to the precision of the computer's arithmetic,
%      1 < 1 + R
%    but 
%      1 = ( 1 + R / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the roundoff unit.
%
  value = eps;

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
%    16 May 2008
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
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;
    
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

      fprintf ( 1, '%7d  ', i );
      
      for j = j2lo : j2hi

        if ( a(i,j) == floor ( a(i,j) ) )
          fprintf ( 1, '%8d      ', a(i,j) );
        else
          fprintf ( 1, '%12g  ', a(i,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
function r8mat_transpose_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT prints an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2004
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
%    Input, string TITLE, an optional title.
%
  r8mat_transpose_print_some ( m, n, a, 1, 1, m, n, title );

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
function dist = sphere_distance1 ( lat1, lon1, lat2, lon2, r )

%*****************************************************************************80
%
%% SPHERE_DISTANCE1 computes great circle distances on a sphere.
%
%  Discussion:
%
%    This computation is based on the law of cosines for spheres.
%    This formula can suffer from rounding errors when the angular
%    distances are small.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    "Great-circle distance",
%    Wikipedia.
%
%  Parameters:
%
%    Input, real LAT1, LON1, the latitude and longitude of
%    the first point.
%
%    Input, real LAT2, LON2, the latitude and longitude of
%    the second point.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real DIST, the great circle distance between
%    the points, measured in the same units as R.
%
  c = cos ( lat1 ) * cos ( lat2 ) * cos ( lon1 - lon2 ) ...
    + sin ( lat1 ) * sin ( lat2 );

  dist = r * acos ( c );

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
