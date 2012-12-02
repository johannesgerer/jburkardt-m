function sphere_exactness ( files, prefix, degree_max )

%*****************************************************************************80
%
%% MAIN is the main program for SPHERE_EXACTNESS.
%
%  Discussion:
%
%    This program investigates the polynomial exactness of a quadrature
%    rule for the unit sphere.
%
%  Usage:
%
%    sphere_exactness 'files' 'prefix' degree_max
%
%    where
%
%    * 'files' explains how the quadrature rule is stored:
%      'XYZW'  for file 'prefix.xyzw' containing (X,Y,Z,Weight);
%      'RTPW'  for file 'prefix.rtpw' containing  (Theta, Phi, Weight) (radians);
%      'DTPW'  for file 'prefix.dtpw' containing  (Theta, Phi, Weight) (degrees);
%      'XYZ+W' for file 'prefix.xyz' containing (X,Y,Z)
%              and file 'prefix.w' containing Weight;
%      'RTP+W' for file 'prefix.rtp' containing (Theta, Phi ) in radians,
%              and file 'prefix.w' containing Weight;
%      'DTP+W' for file 'prefix.dtp' containing (Theta, Phi ) in degrees,
%              and file 'prefix.w' containing Weight;
%      'XYZ1'  for file 'prefix.xyz' containing (X,Y,Z), 
%              and equal weights, which do not need to be read in.
%      'RTP1'  for file 'prefix.rtp' containing (Theta, Phi ) in radians,
%              and equal weights, which do not need to be read in.
%      'DTP1'  for file 'prefix.dtp' containing (Theta, Phi ) in degrees,'
%              and equal weights, which do not need to be read in.
%    * 'prefix' is the common file prefix;
%    * degree_max is the maximum monomial degree to check.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_EXACTNESS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of a quadrature\n' );
  fprintf ( 1, '  rule for the unit sphere by integrating all monomials\n' );
  fprintf ( 1, '  of a given degree.\n' );
%
%  Get the file structure:
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_EXACTNESS:\n' );
    fprintf ( 1, '  Describe the files to be read:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  For coordinates and weights in one file:\n' );
    fprintf ( 1, '    ''XYZW''     (X,Y,Z,Weight)\n' );
    fprintf ( 1, '    ''RTPW''     (Theta, Phi, Weight) (radians)\n' );
    fprintf ( 1, '    ''DTPW''     (Theta, Phi, Weight) (degrees)\n' );
    fprintf ( 1, '  For coordinates in one file and weights in another:\n' );
    fprintf ( 1, '    ''XYZ+W''    (X,Y,Z)       + Weight\n' );
    fprintf ( 1, '    ''RTP+W''    (Theta, Phi ) + Weight\n' );
    fprintf ( 1, '    ''DTP+W''    (Theta, Phi ) + Weight\n' );
    fprintf ( 1, '  For coordinates in one file, and equal weights:\n' );
    fprintf ( 1, '    ''XYZ1''     (X,Y,Z)\n' );
    fprintf ( 1, '    ''RTP1''     (Theta, Phi ) (radians)\n' );
    fprintf ( 1, '    ''DTP1''     (Theta, Phi ) (degrees)\n' );
    fprintf ( 1, '\n' );
    files = input ( '  Enter the file structure string in quotes.' );

  end
%
%  Get the file prefix:
%
  if ( 2 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_EXACTNESS:\n' );

    prefix = input ( '  Enter the filename prefix in quotes.' );

  end
%
%  Get the maximum degree.
%
  if ( 3 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_EXACTNESS:\n' );

    degree_max = input ( '  Please enter the maximum total degree to check.' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_EXACTNESS: User input:\n' );
  fprintf ( 1, '  File structure = "%s".\n', files );
  fprintf ( 1, '  Filename prefix = "%s".\n', prefix );
  fprintf ( 1, '  Maximum degree = %d', degree_max );
%
%  Read data needed to create XYZ and W arrays.
%
  if ( s_eqi ( files, 'xyzw' ) )
    
    filename = strcat ( prefix, '.xyzw' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    xyzw = r8mat_data_read ( filename, 4, point_num );

    xyz(1:3,1:point_num) = xyzw(1:3,1:point_num);
    w(1:point_num,1) = xyzw(4,1:point_num);

  elseif ( s_eqi ( files, 'xyz+w' ) )
    
    filename = strcat ( prefix, '.xyz' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    xyz = r8mat_data_read ( filename, 3, point_num );

    filename = strcat ( prefix, '.w' );

    w = r8mat_data_read ( filename, 1, point_num );
    w = w';

  elseif ( s_eqi ( files, 'xyz1' ) )
    
    filename = strcat ( prefix, '.xyz' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    xyz = r8mat_data_read ( filename, 3, point_num );

    w(1:point_num,1) = 4.0 * pi / point_num;

  elseif ( s_eqi ( files, 'rtpw' ) )
    
    filename = strcat ( prefix, '.rtpw' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    rtpw = r8mat_data_read ( filename, 3, point_num );

    xyz = zeros ( 3, point_num );
    w = zeros ( point_num, 1 );

    xyz(1,1:point_num) = cos ( rtpw(1,1:point_num) ) .* sin ( rtpw(2,1:point_num) );
    xyz(2,1:point_num) = sin ( rtpw(1,1:point_num) ) .* sin ( rtpw(2,1:point_num) );
    xyz(3,1:point_num) =                                cos ( rtpw(2,1:point_num) );

    w(1:point_num,1) = rtpw(3,1:point_num);

  elseif ( s_eqi ( files, 'rtp+w' ) )
    
    filename = strcat ( prefix, '.rtp' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    rtp = r8mat_data_read ( filename, 2, point_num );

    filename = strcat ( prefix, '.w' );

    w = r8mat_data_read ( filename, 1, point_num );
    w = w';

    xyz = zeros ( 3, point_num );

    xyz(1,1:point_num) = cos ( rtp(1,1:point_num) ) .* sin ( rtp(2,1:point_num) );
    xyz(2,1:point_num) = sin ( rtp(1,1:point_num) ) .* sin ( rtp(2,1:point_num) );
    xyz(3,1:point_num) =                               cos ( rtp(2,1:point_num) );

  elseif ( s_eqi ( files, 'rtp1' ) )
    
    filename = strcat ( prefix, '.rtp' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    rtp = r8mat_data_read ( filename, 2, point_num );

    xyz = zeros ( 3, point_num );

    xyz(1,1:point_num) = cos ( rtp(1,1:point_num) ) .* sin ( rtp(2,1:point_num) );
    xyz(2,1:point_num) = sin ( rtp(1,1:point_num) ) .* sin ( rtp(2,1:point_num) );
    xyz(3,1:point_num) =                               cos ( rtp(2,1:point_num) );

    w(1:point_num,1) = 4.0 * pi / point_num;

  elseif ( s_eqi ( files, 'dtpw' ) )
    
    filename = strcat ( prefix, '.dtpw' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    dtpw = r8mat_data_read ( filename, 3, point_num );

    xyz = zeros ( 3, point_num );
    w = zeros ( point_num, 1 );

    dtpw(1:2,1:point_num) = dtpw(1:2,1:point_num) * pi / 180.0;

    xyz(1,1:point_num) = cos ( dtpw(1,1:point_num) ) .* sin ( dtpw(2,1:point_num) );
    xyz(2,1:point_num) = sin ( dtpw(1,1:point_num) ) .* sin ( dtpw(2,1:point_num) );
    xyz(3,1:point_num) =                                cos ( dtpw(2,1:point_num) );
    w(1:point_num,1) = dtpw(3,1:point_num);

  elseif ( s_eqi ( files, 'dtp+w' ) )
    
    filename = strcat ( prefix, '.dtp' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    dtp = r8mat_data_read ( filename, 2, point_num );

    filename = strcat ( prefix, '.w' );

    w = r8mat_data_read ( filename, 1, point_num );
    w = w';

    xyz = zeros ( 3, point_num );

    dtp(1:2,1:point_num) = dtp(1:2,1:point_num) * pi / 180.0;

    xyz(1,1:point_num) = cos ( dtp(1,1:point_num) ) .* sin ( dtp(2,1:point_num) );
    xyz(2,1:point_num) = sin ( dtp(1,1:point_num) ) .* sin ( dtp(2,1:point_num) );
    xyz(3,1:point_num) =                               cos ( dtp(2,1:point_num) );

  elseif ( s_eqi ( files, 'dtp1' ) )
    
    filename = strcat ( prefix, '.dtp' );

    [ dim_num, point_num ] = r8mat_header_read ( filename );

    dtp = r8mat_data_read ( filename, 2, point_num );

    xyz = zeros ( 3, point_num );

    dtp(1:2,1:point_num) = dtp(1:2,1:point_num) * pi / 180.0;

    xyz(1,1:point_num) = cos ( dtp(1,1:point_num) ) .* sin ( dtp(2,1:point_num) );
    xyz(2,1:point_num) = sin ( dtp(1,1:point_num) ) .* sin ( dtp(2,1:point_num) );
    xyz(3,1:point_num) =                               cos ( dtp(2,1:point_num) );

    w(1:point_num,1) = 4.0 * pi / point_num;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized file structure choice!\n' );
    error ( 'SPHERE_EXACTNESS - Fatal error!' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points = %d\n', point_num );
%
%  The W's should sum to 4 * PI.
%
  w_sum = sum ( w(1:point_num) );
  
  w(1:point_num) = 4.0 * pi * w(1:point_num) / w_sum;
%
%  Explore the monomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Error    Degree  Exponents\n' );

  for degree = 0 : degree_max

    fprintf ( 1, '\n' );

    expon = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ expon, more, h, t ] = comp_next ( degree, dim_num, expon, more, h, t );

      quad_error = sphere01_monomial_quadrature ( expon, point_num, xyz, w );

      fprintf ( 1, '  %24.16f   %2d  ', quad_error, degree );
      for dim = 1 : dim_num
        fprintf ( 1, '%3d', expon(dim) );
      end
      fprintf ( 1, '\n' );

      if ( ~more )
        break
      end

    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_EXACTNESS:\n' );
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
%    08 February 2010
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
  if ( 'a' <= c && c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function [ a, more, h, t ] = comp_next ( n, k, a, more, h, t )

%*****************************************************************************80
%
%% COMP_NEXT computes the compositions of the integer N into K parts.
%
%  Discussion:
%
%    A composition of the integer N into K parts is an ordered sequence
%    of K nonnegative integers which sum to N.  The compositions (1,2,1)
%    and (1,1,2) are considered to be distinct.
%
%    The routine computes one composition on each call until there are no more.
%    For instance, one composition of 6 into 3 parts is
%    3+2+1, another would be 6+0+0.
%
%    On the first call to this routine, set MORE = FALSE.  The routine
%    will compute the first element in the sequence of compositions, and
%    return it, as well as setting MORE = TRUE.  If more compositions
%    are desired, call again, and again.  Each time, the routine will
%    return with a new composition.
%
%    However, when the LAST composition in the sequence is computed 
%    and returned, the routine will reset MORE to FALSE, signaling that
%    the end of the sequence has been reached.
%
%    This routine originally used a SAVE statement to maintain the
%    variables H and T.  I have decided that it is safer
%    to pass these variables as arguments, even though the user should
%    never alter them.  This allows this routine to safely shuffle
%    between several ongoing calculations.
%
%    There are 28 compositions of 6 into three parts.  This routine will
%    produce those compositions in the following order:
%
%     I         A
%     -     ---------
%     1     6   0   0
%     2     5   1   0
%     3     4   2   0
%     4     3   3   0
%     5     2   4   0
%     6     1   5   0
%     7     0   6   0
%     8     5   0   1
%     9     4   1   1
%    10     3   2   1
%    11     2   3   1
%    12     1   4   1
%    13     0   5   1
%    14     4   0   2
%    15     3   1   2
%    16     2   2   2
%    17     1   3   2
%    18     0   4   2
%    19     3   0   3
%    20     2   1   3
%    21     1   2   3
%    22     0   3   3
%    23     2   0   4
%    24     1   1   4
%    25     0   2   4
%    26     1   0   5
%    27     0   1   5
%    28     0   0   6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 July 2008
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis and Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the integer whose compositions are desired.
%
%    Input, integer K, the number of parts in the composition.
%
%    Input, integer A(K), the previous composition.  On the first call,
%    with MORE = FALSE, set A = [].  Thereafter, A should be the 
%    value of A output from the previous call.
%
%    Input, logical MORE.  The input value of MORE on the first
%    call should be FALSE, which tells the program to initialize.
%    On subsequent calls, MORE should be TRUE, or simply the
%    output value of MORE from the previous call.
%
%    Input, integer H, T, two internal parameters needed for the
%    computation.  The user may need to initialize these before the
%    very first call, but these initial values are not important.
%    The user should not alter these parameters once the computation
%    begins.
%
%    Output, integer A(K), the next composition.
%
%    Output, logical MORE, will be TRUE unless the composition 
%    that is being returned is the final one in the sequence.
%
%    Output, integer H, T, the updated values of the two internal 
%    parameters.
%
  if ( ~more )

    t = n;
    h = 0;
    a(1) = n;
    a(2:k) = 0;

  else
      
    if ( 1 < t )
      h = 0;
    end

    h = h + 1;
    t = a(h);
    a(h) = 0;
    a(1) = t - 1;
    a(h+1) = a(h+1) + 1;

  end

  more = ( a(k) ~= n );

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
function value = monomial_value ( dim_num, point_num, x, expon )

%*****************************************************************************80
%
%% MONOMIAL_VALUE evaluates a monomial.
%
%  Discussion:
%
%    This routine evaluates a monomial of the form
%
%      product ( 1 <= dim <= dim_num ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points at which the
%    monomial is to be evaluated.
%
%    Input, real X(DIM_NUM,POINT_NUM), the point coordinates.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Output, real VALUE(POINT_NUM), the value of the monomial.
%
  value(1:point_num,1) = 1.0;

  for dim = 1 : dim_num
    if ( 0 ~= expon(dim) )
      value(1:point_num,1) = value(1:point_num,1) ...
        .* ( x(dim,1:point_num).^expon(dim) )';
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
function integral = sphere01_monomial_integral ( e )

%*****************************************************************************80
%
%% SPHERE01_MONOMIAL_INTEGRAL returns monomial integrals on the unit sphere.
%
%  Discussion:
%
%    The integration region is 
%
%      X^2 + Y^2 + Z^2 = 1.
%
%    The monomial is F(X,Y,Z) = X^E(1) * Y^E(2) * Z^E(3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Academic Press, 1984, page 263.
%
%  Parameters:
%
%    Input, integer E(3), the exponents of X, Y and Z in the 
%    monomial.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:3) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'SPHERE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( all ( e(1:3) == 0 ) )

    integral = 2.0 * sqrt ( pi^3 ) / gamma ( 1.5 );

  elseif ( any ( mod ( e(1:3), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : 3
      integral = integral * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    integral = integral / gamma ( 0.5 * sum ( e(1:3) + 1 ) );

  end

  return
end
function quad_error = sphere01_monomial_quadrature ( expon, point_num, xyz, w )

%*****************************************************************************80
%
%% SPHERE01_MONOMIAL_QUADRATURE applies quadrature to a monomial in a sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON(3), the exponents.
%
%    Input, integer POINT_NUM, the number of points in the rule.
%
%    Input, real XYZ(3,POINT_NUM), the quadrature points.
%
%    Input, real W(POINT_NUM), the quadrature weights.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral.
%
  exact = sphere01_monomial_integral ( expon );
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( 3, point_num, xyz, expon );
%
%  Compute the weighted sum.
%
  quad =  w' * value;

  quad_error = abs ( quad - exact );

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
