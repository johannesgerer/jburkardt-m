function hermite_exactness ( quad_filename, degree_max, option )

%*****************************************************************************80
%
%% MAIN is the main program for HERMITE_EXACTNESS.
%
%  Discussion:
%
%    This program investigates a standard Gauss-Hermite quadrature rule
%    by using it to integrate monomials over (-oo,+oo), and comparing the
%    approximate result to the known exact value.
%
%    The user specifies:
%    * the "root" name of the R, W and X files that specify the rule;
%    * DEGREE_MAX, the maximum monomial degree to be checked.
%    * the OPTION (unweighted/physicist weight/probabilist weight)
%
%    OPTION indicates the weight function and normalization:
%    0, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    1, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    2, Integral ( -oo < x < +oo ) x^n exp(-x*x/2)             dx.
%    3, Integral ( -oo < x < +oo ) x^n exp(-x*x)   / sqrt (pi) dx.
%    4, Integral ( -oo < x < +oo ) x^n exp(-x*x/2) / sqrt(2pi) dx.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_EXACTNESS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of a Gauss-Hermite\n' );
  fprintf ( 1, '  quadrature rule by integrating exponentially weighted\n' );
  fprintf ( 1, '  monomials up to a given degree over the (-oo,+oo) interval.\n' );
%
%  Get the quadrature file root name:
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files: ' );

  end
%
%  Create the names of:
%    the quadrature X file;
%    the quadrature W file;
%    the quadrature R file;
%
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );
%
%  The second command line argument is the maximum degree.
%
  if ( 2 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS:\n' );

    degree_max = input ( '  Please enter the maximum degree to check: ' );

  end
%
%  The third command line argument is OPTION.
%
  if ( 3 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS:\n' );
    fprintf ( 1, '  OPTION specifies the weight function w(x):\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  0, rho(x) = 1\n' );
    fprintf ( 1, '  1, rho(x) = exp ( -x*x  )\n' );
    fprintf ( 1, '  2, rho(x) = exp ( -x*x/2)\n' );
    fprintf ( 1, '  3, rho(x) = exp ( -x*x  ) / sqrt( pi)\n' );
    fprintf ( 1, '  4, rho(x) = exp ( -x*x/2) / sqrt(2pi)\n' );
    fprintf ( 1, '\n' );
    option = input ( '  Please enter OPTION: ' );

  end

  if ( option < 0 || 4 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of OPTION.\n' );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_EXACTNESS: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
  fprintf ( 1, '  Maximum degree to check = %d\n', degree_max );
%
%  Read the X file.
%
  [ dim_num, order ] = r8mat_header_read ( quad_x_filename );

  if ( dim_num ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension should be 1.\n');
    fprintf ( 1, '  The spatial dimension in the X file is %d\n', dim_num );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', order );

  x = r8mat_data_read ( quad_x_filename, dim_num, order );
%
%  Read the W file.
%
  [ dim_num2, point_num ] = r8mat_header_read ( quad_w_filename );

  if ( dim_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end

  if ( point_num ~= order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end

  w = r8mat_data_read ( quad_w_filename, 1, order );
%
%  Read the R file.
%
  [ dim_num2, point_num ] = r8mat_header_read ( quad_r_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'v - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end

  if ( point_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_EXACTNESS - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'HERMITE_EXACTNESS - Fatal error!' );
  end

  r = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Print the input quadrature rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test a Gauss-Hermite quadrature rule of\n' );
  fprintf ( 1, '  ORDER = %d\n', order );
  fprintf ( 1, '\n' );
  if ( option == 0 )
    fprintf ( 1, '  OPTION = 0, the unweighted rule for:\n' );
    fprintf ( 1, '  Integral ( -oo < x < +oo ) f(x) dx\n' );
  elseif ( option == 1 )
    fprintf ( 1, '  OPTION = 1, the physicist weighted rule for:\n' );
    fprintf ( 1, '  Integral ( -oo < x < +oo ) f(x) * exp(-x*x) dx\n' );
  elseif ( option == 2 )
    fprintf ( 1, '  OPTION = 2, the probabilist weighted rule for:\n' );
    fprintf ( 1, '  Integral ( -oo < x < +oo ) f(x) * exp(-x*x/2) dx\n' );
  elseif ( option == 3 )
    fprintf ( 1, '  OPTION = 3, the physicist normalized weighted rule for:\n' );
    fprintf ( 1, '  Integral ( -oo < x < +oo ) f(x) * exp(-x*x) / sqrt(pi) dx\n' );
  elseif ( option == 4 )
    fprintf ( 1, '  OPTION = 4, the probabilist normalized weighted rule for:\n' );
    fprintf ( 1, '  Integral ( -oo < x < +oo ) f(x) * exp(-x*x/2) / sqrt(2 pi) dx\n' );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weights W:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : order
    fprintf ( 1, '  w(%d) = %24.16f\n', i, w(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Abscissas X:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : order
    fprintf ( 1, '  x(%d) = %24.16f\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Region R:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 2
    fprintf ( 1, '  r(%d) = %e\n', i, r(i) );
  end
%
%  Explore the monomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A Gauss-Hermite rule would be able to exactly\n' );
  fprintf ( 1, '  integrate monomials up to and including \n' );
  fprintf ( 1, '  degree = %d\n', 2 * order - 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Degree      Error\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    quad_error = hermite_monomial_quadrature ( degree, order, option, w, x );

    fprintf ( 1, '  %2d  %24.16f\n', degree, quad_error );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_EXACTNESS:\n' );
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
function value = hermite_integral ( n, option )

%*****************************************************************************80
%
%% HERMITE_INTEGRAL evaluates a monomial Hermite integral.
%
%  Discussion:
%
%    H(n,1) = Integral ( -oo < x < +oo ) x^n exp(-x^2) dx
%    H(n,1) is 0 for n odd.
%    H(n,1) = (n-1)!! * sqrt(pi) / 2^(n/2) for n even.
%
%    H(n,2) = Integral ( -oo < x < +oo ) x^n exp(-x^2/2) dx
%    H(n,2) is 0 for n odd.
%    H(n,2) = (n-1)!! * sqrt(2*pi) for n even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the integral.
%    0 <= N.
%
%    Input, integer OPTION, the integral has the form:
%    0, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    1, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    2, Integral ( -oo < x < +oo ) x^n exp(-x*x/2)             dx.
%    3, Integral ( -oo < x < +oo ) x^n exp(-x*x)   / sqrt (pi) dx.
%    4, Integral ( -oo < x < +oo ) x^n exp(-x*x/2) / sqrt(2pi) dx.
%
%    Output, real VALUE, the value of the integral.
%
  if ( n < 0 )

    value = - r8_huge ( );

  elseif ( mod ( n, 2 ) == 1 )

    value = 0.0;

  elseif ( option == 0 )

    value = r8_factorial2 ( n - 1 ) * sqrt ( pi ) / 2.0^( n / 2 );

  elseif ( option == 1 )

    value = r8_factorial2 ( n - 1 ) * sqrt ( pi ) / 2.0^( n / 2 );

  elseif ( option == 2 )

    value = r8_factorial2 ( n - 1 ) * sqrt ( 2.0 * pi );

  elseif ( option == 3 )

    value = r8_factorial2 ( n - 1 ) / 2.0^( n / 2 );

  elseif ( option == 4 )

    value = r8_factorial2 ( n - 1 );

  end

  return
end
function quad_error = hermite_monomial_quadrature ( expon, order, option, w, x )

%*****************************************************************************80
%
%% HERMITE_MONOMIAL_QUADRATURE applies a quadrature rule to a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%
%    Input, intege ORDER, the number of points in the rule.
%
%    Input, integer OPTION, the integral has the form:
%    0, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    1, Integral ( -oo < x < +oo ) x^n exp(-x*x)               dx.
%    2, Integral ( -oo < x < +oo ) x^n exp(-x*x/2)             dx.
%    3, Integral ( -oo < x < +oo ) x^n exp(-x*x)   / sqrt (pi) dx.
%    4, Integral ( -oo < x < +oo ) x^n exp(-x*x/2) / sqrt(2pi) dx.
%
%    Input, real W(ORDER), the quadrature weights.
%
%    Input, real X(ORDER), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the unscaled monomial.
%
  exact = hermite_integral ( expon, option );
%
%  Evaluate the unweighted monomial at the quadrature points.
%
  if ( option == 0 )
    value(1:order) = exp ( - x(1:order).^2 ) .* x(1:order).^expon;
  elseif ( option == 1 )
    value(1:order) = x(1:order).^expon;
  elseif ( option == 2 )
    value(1:order) = x(1:order).^expon;
  elseif ( option == 3 )
    value(1:order) = x(1:order).^expon;
  elseif ( option == 4 )
    value(1:order) = x(1:order).^expon;
  end
%
%  Compute the weighted sum.
%
  quad = ( w(1:order) * value(1:order)' );
%
%  Absolute error for cases where exact integral is zero,
%  Relative error otherwise.
%
  if ( exact == 0.0 )
    quad_error = abs ( quad );
  else
    quad_error = abs ( quad - exact ) / abs ( exact );
  end

  return
end
function value = r8_factorial2 ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL2 computes the double factorial function.
%
%  Discussion:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the double factorial function.
%    If N is less than 1, VALUE is returned as 1.
%
%    Output, real VALUE, the value of N!!.
%
  value = 1;

  if ( n < 1 )
    return
  end

  while ( 1 < n )
    value = value * n;
    n = n - 2;
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
