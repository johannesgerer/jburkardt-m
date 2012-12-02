function nint_exactness_pyramid ( quad_filename, degree_max )

%*****************************************************************************80
%
%% MAIN is the main program for PYRAMID_EXACTNESS.
%
%  Discussion:
%
%    This program investigates the polynomial exactness of a quadrature
%    rule for the pyramid.
%
%    The integration region is:
% 
%      - ( 1 - Z ) <= X <= 1 - Z
%      - ( 1 - Z ) <= Y <= 1 - Z
%                0 <= Z <= 1.
%
%    When Z is zero, the integration region is a square lying in the (X,Y) 
%    plane, centered at (0,0,0) with "radius" 1.  As Z increases to 1, the 
%    radius of the square diminishes, and when Z reaches 1, the square has 
%    contracted to the single point (0,0,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_EXACTNESS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of\n' );
  fprintf ( 1, '  a quadrature rule for the pyramid.\n' );
%
%  Get the quadrature file root name:
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PYRAMID_EXACTNESS:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files.' );

  end
%
%  Create the names of:
%    the quadrature X file;
%    the quadrature W file;
%
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
%
%  The second command line argument is the maximum degree.
%
  if ( 2 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PYRAMID_EXACTNESS:\n' );

    degree_max = input ( '  Please enter the maximum total degree to check.' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_EXACTNESS: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Maximum total degree to check = %d', degree_max );
%
%  Read the X file.
%
  [ dim_num, order ] = r8mat_header_read ( quad_x_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', order );

  if ( dim_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PYRAMID_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature abscissas must be 3 dimensional.\n' );
    error ( 'PYRAMID_EXACTNESS - Fatal error!' );
  end

  x = r8mat_data_read ( quad_x_filename, dim_num, order );
%
%  Read the W file.
%
  [ dim_num2, order2 ] = r8mat_header_read ( quad_w_filename );

  if ( dim_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PYRAMID_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'PYRAMID_EXACTNESS - Fatal error!' );
  end

  if ( order2 ~= order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PYRAMID_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'PYRAMID_EXACTNESS - Fatal error!' );
  end

  w = r8mat_data_read ( quad_w_filename, 1, order );
%
%  Explore the monomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Error    Degree  Exponents\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    expon = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ expon, more, h, t ] = comp_next ( degree, dim_num, expon, more, h, t );

      v = monomial_value ( dim_num, order, expon, x );

      quad = pyra_unit_volume ( ) * w(1:order) * v(1:order)';

      exact = pyra_unit_monomial ( expon );

      quad_error = abs ( quad - exact );

      fprintf ( 1, '  %24.16f   %2d  ', quad_error, degree );
      for dim = 1 : dim_num
        fprintf ( 1, '%3d', expon(dim) );
      end
      fprintf ( 1, '\n' );

      if ( ~more )
        break
      end

    end

    fprintf ( 1, '\n' );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_EXACTNESS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
%    FORTRAN77 original version by Albert Nijenhuis and Herbert Wilf
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
function value = monomial_value ( dim_num, point_num, expon, x )

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
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Input, real X(DIM_NUM,POINT_NUM), the point coordinates.
%
%    Output, real VALUE(POINT_NUM), the value of the monomial.
%
  value(1:point_num) = 1.0;

  for dim = 1 : dim_num
    if ( 0 ~= expon(dim) )
      value(1:point_num) = value(1:point_num) .* x(dim,1:point_num).^expon(dim);
    end
  end

  return
end
function value = pyra_unit_monomial ( expon )

%*****************************************************************************80
%
%% PYRA_UNIT_MONOMIAL: monomial integral in a unit pyramid.
%
%  Discussion:
%
%    This routine returns the integral of
%
%      product ( 1 <= I <= 3 ) X(I)^EXPON(I)
%
%    over the unit pyramid.
%
%    The unit pyramid is defined as:
%
%    - ( 1 - Z ) <= X <= 1 - Z
%    - ( 1 - Z ) <= Y <= 1 - Z
%              0 <= Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer EXPON(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  value = 0.0;

  if ( mod ( expon(1), 2 ) == 0 && mod ( expon(2), 2 ) == 0 )

    i_hi = 2 + expon(1) + expon(2);

    for i = 0 : i_hi
      value = value + r8_mop ( i ) * r8_choose ( i_hi, i ) / ( i + expon(3) + 1 );
    end

    value = value * 2.0 / ( expon(1) + 1 ) * 2.0 / ( expon(2) + 1 );

  end

  return
end
function value = pyra_unit_volume ( )

%*****************************************************************************80
%
%% PYRA_UNIT_VOLUME_3D returns the volume of a unit pyramid.
%
%  Discussion:
%
%    A pyramid with square base can be regarded as the upper half of a
%    3D octahedron.
%
%    The integration region:
%
%      - ( 1 - Z ) <= X <= 1 - Z
%      - ( 1 - Z ) <= Y <= 1 - Z
%                0 <= Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the volume of the pyramid.
%
  value = 4.0 / 3.0;

  return
end
function value = r8_choose ( n, k )

%*****************************************************************************80
%
%% R8_CHOOSE computes the binomial coefficient C(N,K).
%
%  Discussion:
%
%    The value is calculated in such a way as to avoid overflow and
%    roundoff.  The calculation is done in integer arithmetic.
%
%    The formula used is:
%
%      C(N,K) = N! / ( K! * (N-K)! )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    ML Wolfson, HV Wright,
%    Algorithm 160:
%    Combinatorial of M Things Taken N at a Time,
%    Communications of the ACM,
%    Volume 6, Number 4, April 1963, page 161.
%
%  Parameters:
%
%    Input, integer N, K, are the values of N and K.
%
%    Output, real VALUE, the number of combinations of N
%    things taken K at a time.
%
  mn = min ( k, n - k );

  if ( mn < 0 )
    value = 0;
  elseif ( mn == 0 )
    value = 1;
  else
    mx = max ( k, n - k );
    value = mx + 1;
    for i = 2 : mn
      value = ( value * ( mx + i ) ) / i;
    end
  end

  return
end
function value = r8_mop ( i )

%*****************************************************************************80
%
%% R8_MOP returns the I-th power of -1 as an R8 value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the power of -1.
%
%    Output, real R8_MOP, the I-th power of -1.
%
  if ( mod ( i, 2 ) == 0 )
    value = + 1.0;
  else
    value = - 1.0;
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
%    19 April 2009
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
