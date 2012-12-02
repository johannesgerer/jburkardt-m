function int_exactness_gen_hermite ( quad_filename, degree_max, alpha, option )

%*****************************************************************************80
%
%% MAIN is the main program for INT_EXACTNESS_GEN_HERMITE.
%
%  Discussion:
%
%    This program investigates a generalized Gauss-Hermite quadrature rule
%    by using it to integrate monomials over (-oo,+oo), and comparing the
%    approximate result to the known exact value.
%
%    The user specifies:
%    * the "root" name of the R, W and X files that specify the rule;
%    * DEGREE_MAX, the maximum monomial degree to be checked;
%    * ALPHA, the power of X in the weighting function;
%    * OPTION, whether the rule is for |x|^alpha*exp(-x*x)*f(x) or f(x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of a generalized Gauss-Laguerre\n' );
  fprintf ( 1, '  quadrature rule by integrating exponentially weighted\n' );
  fprintf ( 1, '  monomials up to a given degree over the (-oo,+oo) interval.\n' );
%
%  Get the quadrature file root name:
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files.' );

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
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE:\n' );

    degree_max = input ( '  Please enter the maximum degree to check.' );

  end
%
%  The third command line argument is ALPHA.
%
  if ( 3 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE:\n' );
    fprintf ( 1, '  ALPHA is the power of |X| in the weighting function.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ALPHA is a real number greater than -1.0.\n' );
    fprintf ( 1, '\n' );

    alpha = input ( '  Please enter ALPHA.' );

  end
%
%  The fourth command line argument is OPTION.
%  0 for the standard rule for integrating |x|^alpha*exp(-x*x)*f(x),
%  1 for a rule for integrating f(x).
%
  if ( 4 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE:\n' );
    fprintf ( 1, '  OPTION chooses the standard or modified rule:\n' );
    fprintf ( 1, '  0: standard rule for integrating |x|^alpha*exp(-x*x)*f(x);\n' );
    fprintf ( 1, '  1: modified rule for integrating                     f(x).\n' );
    fprintf ( 1, '\n' );
    option = input ( '  Please enter OPTION' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
  fprintf ( 1, '  Maximum degree to check = %d\n', degree_max );
  fprintf ( 1, '  Weighting function exponent ALPHA = %f\n', alpha );
  if ( option == 0 )
    fprintf ( 1, '  OPTION = 0, integrate |x|^alpha*exp(-x*x)*f(x).\n' );
  else
    fprintf ( 1, '  OPTION = 1, integrate                     f(x).\n' );
  end
%
%  Read the X file.
%
  [ dim_num, order ] = r8mat_header_read ( quad_x_filename );

  if ( dim_num ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension should be 1.\n');
    fprintf ( 1, '  The spatial dimension in the X file is %d\n', dim_num );
    error ( 'INT_EXACTNESS_GEN_HERMITE - Fatal error!' );
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
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'INT_EXACTNESS_GEN_HERMITE - Fatal error!' );
  end

  if ( point_num ~= order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'INT_EXACTNESS_GEN_HERMITE - Fatal error!' );
  end

  w = r8mat_data_read ( quad_w_filename, 1, order );
%
%  Read the R file.
%
  [ dim_num2, point_num ] = r8mat_header_read ( quad_r_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'INT_EXACTNESS_GEN_HERMITE - Fatal error!' );
  end

  if ( point_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'INT_EXACTNESS_GEN_HERMITE - Fatal error!' );
  end

  r = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Print the input quadrature rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The quadrature rule to be tested is\n' );
  fprintf ( 1, '  a generalized Gauss-Hermite rule\n' );
  fprintf ( 1, '  ORDER = %d\n', order );
  fprintf ( 1, '  ALPHA = %f\n', alpha );
  fprintf ( 1, '\n' );
  if ( option == 0 )
    fprintf ( 1, '  OPTION = 0, standard rule:\n' );
    fprintf ( 1, '    Integral ( -oo < x < +oo ) |x|^alpha exp(-x*x) f(x) dx\n' );
    fprintf ( 1, '    is to be approximated by\n' );
    fprintf ( 1, '    sum ( 1 <= I <= ORDER ) w(i) * f(x(i)).\n' );
  else
    fprintf ( 1, '  OPTION = 1, modified rule:\n' );
    fprintf ( 1, '    Integral ( -oo < x < +oo ) f(x) dx\n' );
    fprintf ( 1, '    is to be approximated by\n' );
    fprintf ( 1, '    sum ( 1 <= I <= ORDER ) w(i) * f(x(i)).\n' );
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
  fprintf ( 1, '  A generalized Gauss-Hermite rule would be able to exactly\n' );
  fprintf ( 1, '  integrate monomials up to and including \n' );
  fprintf ( 1, '  degree = %d\n', 2 * order - 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Error    Degree\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    quad_error = monomial_quadrature_gen_hermite ( degree, alpha, order, option, w, x );

    fprintf ( 1, '  %24.16f   %2d\n', quad_error, degree );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_EXACTNESS_GEN_HERMITE:\n' );
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
function value = gen_hermite_integral ( expon, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_INTEGRAL evaluates a monomial generalized Hermite integral.
%
%  Discussion:
%
%    H(n,alpha) = Integral ( -oo < x < +oo ) x^n |x|^alpha exp(-x^2) dx
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
%    Input, int EXPON, the exponent of the monomial.
%
%    Input, real ALPHA, the exponent of |X| in the integral.
%    -1.0 < ALPHA.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( expon, 2 ) == 1 )

    value = 0.0;

  else

    a = alpha + expon;

    if ( a <= -1.0 )

      value = - r8_huge ( );

    else

      value = r8_gamma ( ( a + 1.0 ) / 2.0 );

    end

  end

  return
end
function quad_error = monomial_quadrature_gen_hermite ( expon, alpha, order, ...
  option, w, x )

%*****************************************************************************80
%
%% MONOMIAL_QUADRATURE_GEN_HERMITE applies a quadrature rule to a monomial.
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
%    Input, integer EXPON, the exponent.
%
%    Input, real ALPHA, the exponent of X in the weight factor.
%
%    Input, intege ORDER, the number of points in the rule.
%
%    Input, integer OPTION, indicates standard or modified rule.
%    0, standard generalized Gauss-Hermite rule for 
%       integrand |x|^alpha*exp(-x*x)*f(x).
%    1, modified generalized Gauss-Laguerre rule for 
%       integrand                     f(x).
%
%    Input, real W(ORDER), the quadrature weights.
%
%    Input, real X(ORDER), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the monomial.
%
   exact = gen_hermite_integral ( expon, alpha );
%
%  Evaluate the unweighted monomial at the quadrature points.
%
  if ( option == 0 )
    value(1:order) = x(1:order).^expon;
  else
    value(1:order) = ( abs ( x(1:order) ) ).^alpha ...
    .* exp ( - x(1:order).^2 ) .* x(1:order).^expon;
  end
%
%  Compute the weighted sum.
%
  quad = w(1:order) * value(1:order)';
%
%  Error:
%
  if ( exact == 0.0 )
    quad_error = abs ( quad );
  else
    quad_error = abs ( ( quad - exact ) / exact );
  end

  return
end
function value = r8_gamma ( x )

%*****************************************************************************80
%
%% R8_GAMMA evaluates Gamma(X) for a real argument.
%
%  Discussion:
%
%    This routine calculates the gamma function for a real argument X.
%
%    Computation is based on an algorithm outlined in reference 1.
%    The program uses rational functions that approximate the gamma
%    function to at least 20 significant decimal digits.  Coefficients
%    for the approximation over the interval (1,2) are unpublished.
%    Those for the approximation for 12 <= X are from reference 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by William Cody, Laura Stoltz.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Cody,
%    An Overview of Software Development for Special Functions,
%    in Numerical Analysis Dundee, 1975,
%    edited by GA Watson,
%    Lecture Notes in Mathematics 506,
%    Springer, 1976.
%
%    John Hart, Ward Cheney, Charles Lawson, Hans Maehly,
%    Charles Mesztenyi, John Rice, Henry Thatcher,
%    Christoph Witzgall,
%    Computer Approximations,
%    Wiley, 1968,
%    LC: QA297.C64.
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%

%
%  Coefficients for minimax approximation over (12, INF).
%
  c = [ ...
   -1.910444077728E-03, ...
    8.4171387781295E-04, ...
   -5.952379913043012E-04, ...
    7.93650793500350248E-04, ...
   -2.777777777777681622553E-03, ...
    8.333333333333333331554247E-02, ...
    5.7083835261E-03 ];
%
%  Mathematical constants
%
  one = 1.0;
  half = 0.5;
  twelve = 12.0;
  two = 2.0;
  zero = 0.0;
  sqrtpi = 0.9189385332046727417803297;
%
%  Machine dependent parameters
%
  xbig = 171.624E+00;
  xminin = 2.23E-308;
  eps = 2.22E-16;
  xinf = 1.79E+308;
%
%  Numerator and denominator coefficients for rational minimax
%  approximation over (1,2).
%
  p = [ ...
   -1.71618513886549492533811E+00, ...
    2.47656508055759199108314E+01, ...
   -3.79804256470945635097577E+02, ...
    6.29331155312818442661052E+02, ...
    8.66966202790413211295064E+02, ...
   -3.14512729688483675254357E+04, ...
   -3.61444134186911729807069E+04, ...
    6.64561438202405440627855E+04 ];

  q = [ ...
   -3.08402300119738975254353E+01, ...
    3.15350626979604161529144E+02, ...
   -1.01515636749021914166146E+03, ...
   -3.10777167157231109440444E+03, ...
    2.25381184209801510330112E+04, ...
    4.75584627752788110767815E+03, ...
   -1.34659959864969306392456E+05, ...
   -1.15132259675553483497211E+05 ];

  parity = 0;
  fact = one;
  n = 0;
  y = x;
%
%  Argument is negative.
%
  if ( y <= zero )

    y = - x;
    y1 = floor ( y );
    res = y - y1;

    if ( res ~= zero )

      if ( y1 ~= floor ( y1 * half ) * two )
        parity = 1;
      end

      fact = - pi / sin ( pi * res );
      y = y + one;

    else

      res = xinf;
      value = res;
      return

    end

  end
%
%  Argument is positive.
%
  if ( y < eps )
%
%  Argument < EPS.
%
    if ( xminin <= y )
      res = one / y;
    else
      res = xinf;
      value = res;
      return
    end

  elseif ( y < twelve )

    y1 = y;
%
%  0.0 < argument < 1.0.
%
    if ( y < one )

      z = y;
      y = y + one;
%
%  1.0 < argument < 12.0.
%  Reduce argument if necessary.
%
    else

      n = floor ( y ) - 1;
      y = y - n;
      z = y - one;

    end
%
%  Evaluate approximation for 1.0 < argument < 2.0.
%
    xnum = zero;
    xden = one;
    for i = 1 : 8
      xnum = ( xnum + p(i) ) * z;
      xden = xden * z + q(i);
    end

    res = xnum / xden + one;
%
%  Adjust result for case  0.0 < argument < 1.0.
%
    if ( y1 < y )

      res = res / y1;
%
%  Adjust result for case 2.0 < argument < 12.0.
%
    elseif ( y < y1 )

      for i = 1 : n
        res = res * y;
        y = y + one;
      end

    end

  else
%
%  Evaluate for 12.0 <= argument.
%
    if ( y <= xbig )

      ysq = y * y;
      sum = c(7);
      for i = 1 : 6
        sum = sum / ysq + c(i);
      end
      sum = sum / y - y + sqrtpi;
      sum = sum + ( y - half ) * log ( y );
      res = exp ( sum );

    else

      res = xinf;
      value = res;
      return

    end

  end
%
%  Final adjustments and return.
%
  if ( parity )
    res = - res;
  end

  if ( fact ~= one )
    res = fact / res;
  end

  value = res;

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
