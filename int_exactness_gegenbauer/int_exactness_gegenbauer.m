function int_exactness_gegenbauer ( quad_filename, degree_max, alpha )

%% MAIN is the main program for INT_EXACTNESS_GEGENBAUER.
%
%  Discussion:
%
%    This program investigates a standard Gauss-Gegenbauer quadrature rule
%    by using it to integrate monomials over [-1,+1], and comparing the
%    approximate result to the known exact value.
%
%    The user specifies:
%    * the "root" name of the R, W and X files that specify the rule;
%    * DEGREE_MAX, the maximum monomial degree to be checked;
%    * ALPHA, the exponent of the (1-X^2) factor;
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
  fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of a Gauss-Gegenbauer\n' );
  fprintf ( 1, '  quadrature rule by integrating weighted\n' );
  fprintf ( 1, '  monomials up to a given degree over the [-1,+1] interval.\n' );
%
%  Get the quadrature file root name:
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER:\n' );

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
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER:\n' );

    degree_max = input ( '  Please enter the maximum degree to check.' );

  end
%
%  The third command line argument is ALPHA.
%
  if ( 3 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER:\n' );
    fprintf ( 1, '  ALPHA is the power of (1-X^2) in the weighting function.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ALPHA is a real number greater than -1.0.\n' );
    fprintf ( 1, '\n' );
    alpha = input ( '  Please enter ALPHA.' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
  fprintf ( 1, '  Maximum degree to check = %d\n', degree_max );
  fprintf ( 1, '  Exponent of (1-x^2), ALPHA = %f\n', alpha );
%
%  Read the X file.
%
  [ dim_num, order ] = r8mat_header_read ( quad_x_filename );

  if ( dim_num ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension should be 1.\n');
    fprintf ( 1, '  The spatial dimension in the X file is %d\n', dim_num );
    error ( 'INT_EXACTNESS_GEGENBAUER - Fatal error!' );
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
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'INT_EXACTNESS_GEGENBAUER - Fatal error!' );
  end

  if ( point_num ~= order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'INT_EXACTNESS_GEGENBAUER - Fatal error!' );
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
    error ( 'INT_EXACTNESS_GEGENBAUER - Fatal error!' );
  end

  if ( point_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'INT_EXACTNESS_GEGENBAUER - Fatal error!' );
  end

  r = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Print the input quadrature rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The quadrature rule to be tested is\n' );
  fprintf ( 1, '  a Gauss-Gegenbauer rule\n' );
  fprintf ( 1, '  ORDER = %d\n', order );
  fprintf ( 1, '  ALPHA = %f\n', alpha );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Standard rule:\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) (1-x^2)^alpha f(x) dx\n' );
  fprintf ( 1, '    is to be approximated by\n' );
  fprintf ( 1, '    sum ( 1 <= I <= ORDER ) w(i) * f(x(i)).\n' );
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
  fprintf ( 1, '  A Gauss-Gegenbauer rule would be able to exactly\n' );
  fprintf ( 1, '  integrate monomials up to and including \n' );
  fprintf ( 1, '  degree = %d\n', 2 * order - 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Error    Degree\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    quad_error = monomial_quadrature_gegenbauer ( degree, alpha, order, w, x );

    fprintf ( 1, '  %24.16f   %2d\n', quad_error, degree );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_EXACTNESS_GEGENBAUER:\n' );
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
function value = gegenbauer_integral ( expon, alpha )

%*****************************************************************************80
%
%% GEGENBAUER_INTEGRAL evaluates the integral of a monomial with Gegenbauer weight.
%
%  Discussion:
%
%    VALUE = Integral ( -1 <= X <= +1 ) x^EXPON (1-x^2)^ALPHA dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%
%    Input, real ALPHA, the exponent of (1-X^2)
%    in the weight factor.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( expon, 2 ) == 1 )
    value = 0.0;
    return
  end

  c = expon;

  arg1 = - alpha;
  arg2 =   1.0 + c;
  arg3 =   2.0 + alpha + c;
  arg4 = - 1.0;

  value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  value = 2.0 * r8_gamma ( 1.0 + c ) * r8_gamma ( 1.0 + alpha ) ...
    * value1 / r8_gamma ( 2.0 + alpha  + c );

  return
end
function quad_error = monomial_quadrature_gegenbauer ( expon, alpha, ...
  order, w, x )

%*****************************************************************************80
%
%% MONOMIAL_QUADRATURE_GEGENBAUER applies a quadrature rule to a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%
%    Input, real ALPHA, the exponent of (1-X^2) in the weight factor.
%
%    Input, intege ORDER, the number of points in the rule.
%
%    Input, real W(ORDER), the quadrature weights.
%
%    Input, real X(ORDER), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral.
%
  exact = gegenbauer_integral ( expon, alpha );
%
%  Evaluate the monomial at the quadrature points.
%
  value(1:order) = x(1:order).^expon;
%
%  Compute the weighted sum.
%
  quad = w * value';
%
%  Error:
%
  if ( exact == 0.0 )
    quad_error = abs ( quad - exact );
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
function hf = r8_hyper_2f1 ( a, b, c, x )

%*****************************************************************************80
%
%% R8_HYPER_2F1 evaluates the hypergeometric function 2F1(A,B,C,X).
%
%  Discussion:
%
%    A minor bug was corrected.  The HW variable, used in several places as
%    the "old" value of a quantity being iteratively improved, was not
%    being initialized.  JVB, 11 February 2008.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 February 2008
%
%  Author:
%
%    F77 original by Shanjie Zhang, Jianming Jin.
%    MATLAB version by John Burkardt.
%
%    The F77 original version of this routine is copyrighted by
%    Shanjie Zhang and Jianming Jin.  However, they give permission to
%    incorporate this routine into a user program provided that the copyright
%    is acknowledged.
%
%  Reference:
%
%    Shanjie Zhang, Jianming Jin,
%    Computation of Special Functions,
%    Wiley, 1996,
%    ISBN: 0-471-11963-6,
%    LC: QA351.C45
%
%  Parameters:
%
%    Input, real A, B, C, X, the arguments of the function.
%    C must not be equal to a nonpositive integer.
%    X < 1.
%
%    Output, real HF, the value of the function.
%
  el = 0.5772156649015329;

  l0 = ( c == floor ( c ) ) & ( c < 0.0 );
  l1 = ( 1.0 - x < 1.0E-15 ) & ( c - a - b <= 0.0 );
  l2 = ( a == floor ( a ) ) & ( a < 0.0 );
  l3 = ( b == floor ( b ) ) & ( b < 0.0 );
  l4 = ( c - a == floor ( c - a ) ) & ( c - a <= 0.0 );
  l5 = ( c - b == floor ( c - b ) ) & ( c - b <= 0.0 );

  if ( l0 || l1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_HYPER_2F1 - Fatal error!\n' );
    fprintf ( 1, '  The hypergeometric series is divergent.\n' );
    return
  end

  if ( 0.95 < x )
    eps = 1.0E-08;
  else
    eps = 1.0E-15;
  end

  if ( x == 0.0 || a == 0.0 || b == 0.0 )

    hf = 1.0;
    return

  elseif ( 1.0 - x == eps && 0.0 < c - a - b )

    gc = r8_gamma ( c );
    gcab = r8_gamma ( c - a - b );
    gca = r8_gamma ( c - a );
    gcb = r8_gamma ( c - b );
    hf = gc * gcab / ( gca * gcb );
    return

  elseif ( 1.0 + x <= eps && abs ( c - a + b - 1.0 ) <= eps )

    g0 = sqrt ( pi ) * 2.0^( - a );
    g1 = r8_gamma ( c );
    g2 = r8_gamma ( 1.0 + a / 2.0 - b );
    g3 = r8_gamma ( 0.5 + 0.5 * a );
    hf = g0 * g1 / ( g2 * g3 );
    return

  elseif ( l2 || l3 )

    if ( l2 )
      nm = floor ( abs ( a ) );
    end

    if ( l3 )
      nm = floor ( abs ( b ) );
    end

    hf = 1.0;
    r = 1.0;

    for k = 1 : nm
      r = r * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;
      hf = hf + r;
    end

    return

  elseif ( l4 || l5 )

    if ( l4 )
      nm = floor ( abs ( c - a ) );
    end

    if ( l5 )
      nm = floor ( abs ( c - b ) );
    end

    hf = 1.0;
    r  = 1.0;
    for k = 1 : nm
      r = r * ( c - a + k - 1.0 ) * ( c - b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;
      hf = hf + r;
    end
    hf = ( 1.0 - x )^( c - a - b ) * hf;
    return

  end

  aa = a;
  bb = b;
  x1 = x;

  if ( x < 0.0 )
    x = x / ( x - 1.0 );
    if ( a < c && b < a && 0.0 < b )
      a = bb;
      b = aa;
    end
    b = c - b;
  end

  if ( 0.75 <= x )

    gm = 0.0;

    if ( abs ( c - a - b - floor ( c - a - b ) ) < 1.0E-15 )

      m = floor ( c - a - b );
      ga = r8_gamma ( a );
      gb = r8_gamma ( b );
      gc = r8_gamma ( c );
      gam = r8_gamma ( a + m );
      gbm = r8_gamma ( b + m );

      pa = r8_psi ( a );
      pb = r8_psi ( b );

      if ( m ~= 0 )
        gm = 1.0;
      end

      for j = 1 : abs ( m ) - 1
        gm = gm * j;
      end

      rm = 1.0;
      for j = 1 : abs ( m )
        rm = rm * j;
      end

      f0 = 1.0;
      r0 = 1.0;
      r1 = 1.0;
      sp0 = 0.0;
      sp = 0.0;

      if ( 0 <= m )

        c0 = gm * gc / ( gam * gbm );
        c1 = - gc * ( x - 1.0 )^m / ( ga * gb * rm );

        for k = 1 : m - 1
          r0 = r0 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
            / ( k * ( k - m ) ) * ( 1.0 - x );
          f0 = f0 + r0;
        end

        for k = 1 : m
          sp0 = sp0 + 1.0 / ( a + k - 1.0 ) ...
            + 1.0 / ( b + k - 1.0 ) - 1.0 / k;
        end

        f1 = pa + pb + sp0 + 2.0 * el + log ( 1.0 - x );
        hw = f1;

        for k = 1 : 250

          sp = sp + ( 1.0 - a ) / ( k * ( a + k - 1.0 ) ) ...
            + ( 1.0 - b ) / ( k * ( b + k - 1.0 ) );

          sm = 0.0;
          for j = 1 : m
            sm = sm + ( 1.0 - a ) ...
              / ( ( j + k ) * ( a + j + k - 1.0 ) ) ...
              + 1.0 / ( b + j + k - 1.0 );
          end

          rp = pa + pb + 2.0 * el + sp + sm + log ( 1.0 - x );

          r1 = r1 * ( a + m + k - 1.0 ) * ( b + m + k - 1.0 ) ...
            / ( k * ( m + k ) ) * ( 1.0 - x );

          f1 = f1 + r1 * rp;

          if ( abs ( f1 - hw ) < abs ( f1 ) * eps )
            break
          end

          hw = f1;

        end

        hf = f0 * c0 + f1 * c1;

      elseif ( m < 0 )

        m = - m;
        c0 = gm * gc / ( ga * gb * ( 1.0 - x )^m );
        c1 = - ( - 1 )^m * gc / ( gam * gbm * rm );

        for k = 1 : m - 1
          r0 = r0 * ( a - m + k - 1.0 ) * ( b - m + k - 1.0 ) ...
            / ( k * ( k - m ) ) * ( 1.0 - x );
          f0 = f0 + r0;
        end

        for k = 1 : m
          sp0 = sp0 + 1.0 / k;
        end

        f1 = pa + pb - sp0 + 2.0 * el + log ( 1.0 - x );
        hw = f1;

        for k = 1 : 250

          sp = sp + ( 1.0 - a ) ...
            / ( k * ( a + k - 1.0 ) ) ...
            + ( 1.0 - b ) / ( k * ( b + k - 1.0 ) );

          sm = 0.0;
          for j = 1 : m
            sm = sm + 1.0 / ( j + k );
          end

          rp = pa + pb + 2.0 * el + sp - sm + log ( 1.0 - x );

          r1 = r1 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
            / ( k * ( m + k ) ) * ( 1.0 - x );

          f1 = f1 + r1 * rp;

          if ( abs ( f1 - hw ) < abs ( f1 ) * eps )
            break
          end

          hw = f1;

        end

        hf = f0 * c0 + f1 * c1;

      end

    else

      ga = r8_gamma ( a );
      gb = r8_gamma ( b );
      gc = r8_gamma ( c );
      gca = r8_gamma ( c - a );
      gcb = r8_gamma ( c - b );
      gcab = r8_gamma ( c - a - b );
      gabc = r8_gamma ( a + b - c );
      c0 = gc * gcab / ( gca * gcb );
      c1 = gc * gabc / ( ga * gb ) * ( 1.0 - x )^( c - a - b );
      hf = 0.0;
      hw = hf;
      r0 = c0;
      r1 = c1;

      for k = 1 : 250

        r0 = r0 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
          / ( k * ( a + b - c + k ) ) * ( 1.0 - x );

        r1 = r1 * ( c - a + k - 1.0 ) * ( c - b + k - 1.0 ) ...
          / ( k * ( c - a - b + k ) ) * ( 1.0 - x );

        hf = hf + r0 + r1;

        if ( abs ( hf - hw ) < abs ( hf ) * eps )
          break
        end

        hw = hf;

      end

      hf = hf + c0 + c1;

    end

  else

    a0 = 1.0;

    if ( a < c && c < 2.0 * a && b < c && c < 2.0 * b )

      a0 = ( 1.0 - x )^( c - a - b );
      a = c - a;
      b = c - b;

    end

    hf = 1.0;
    hw = hf;
    r = 1.0;

    for k = 1 : 250

      r = r * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;

      hf = hf + r;

      if ( abs ( hf - hw ) <= abs ( hf ) * eps )
        break
      end

      hw = hf;

    end

    hf = a0 * hf;

  end

  if ( x1 < 0.0 )
    x = x1;
    c0 = 1.0 / ( 1.0 - x )^aa;
    hf = c0 * hf;
  end

  if ( 120 < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_HYPER_2F1 - Warning!\n' );
    fprintf ( 1, '  A large number of iterations were needed.\n' );
    fprintf ( 1, '  The accuracy of the results should be checked.\n' );
  end

  return
end
function value = r8_psi ( xx )

%*****************************************************************************80
%
%% R8_PSI evaluates the function Psi(X).
%
%  Discussion:
%
%    This routine evaluates the logarithmic derivative of the
%    Gamma function,
%
%      PSI(X) = d/dX ( GAMMA(X) ) / GAMMA(X)
%             = d/dX LN ( GAMMA(X) )
%
%    for real X, where either
%
%      - XMAX1 < X < - XMIN, and X is not a negative integer,
%
%    or
%
%      XMIN < X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    Original FOTRAN77 version by William Cody.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Cody, Anthony Strecok, Henry Thacher,
%    Chebyshev Approximations for the Psi Function,
%    Mathematics of Computation,
%    Volume 27, Number 121, January 1973, pages 123-127.
%
%  Parameters:
%
%    Input, real XX, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%
  four = 4.0;
  fourth = 0.25;
  half = 0.5;
  one = 1.0;
  p1(1:9) = [ ...
   4.5104681245762934160E-03, ...
   5.4932855833000385356, ...
   3.7646693175929276856E+02, ...
   7.9525490849151998065E+03, ...
   7.1451595818951933210E+04, ...
   3.0655976301987365674E+05, ...
   6.3606997788964458797E+05, ...
   5.8041312783537569993E+05, ...
   1.6585695029761022321E+05 ];
  p2(1:7) = [ ...
  -2.7103228277757834192, ...
  -1.5166271776896121383E+01, ...
  -1.9784554148719218667E+01, ...
  -8.8100958828312219821, ...
  -1.4479614616899842986, ...
  -7.3689600332394549911E-02, ...
  -6.5135387732718171306E-21 ];
  piov4 = 0.78539816339744830962;
  q1(1:8) = [ ...
   9.6141654774222358525E+01, ...
   2.6287715790581193330E+03, ...
   2.9862497022250277920E+04, ...
   1.6206566091533671639E+05, ...
   4.3487880712768329037E+05, ...
   5.4256384537269993733E+05, ...
   2.4242185002017985252E+05, ...
   6.4155223783576225996E-08 ];
  q2(1:6) = [ ...
   4.4992760373789365846E+01, ...
   2.0240955312679931159E+02, ...
   2.4736979003315290057E+02, ...
   1.0742543875702278326E+02, ...
   1.7463965060678569906E+01, ...
   8.8427520398873480342E-01 ];
  three = 3.0;
  x01 = 187.0;
  x01d = 128.0;
  x02 = 6.9464496836234126266E-04;
  xinf = 1.70E+38;
  xlarge = 2.04E+15;
  xmax1 = 3.60E+16;
  xmin1 = 5.89E-39;
  xsmall = 2.05E-09;
  zero = 0.0;

  x = xx;
  w = abs ( x );
  aug = zero;
%
%  Check for valid arguments, then branch to appropriate algorithm.
%
  if ( xmax1 <= - x || w < xmin1 )

    if ( zero < x )
      value = - xinf;
    else
      value = xinf;
    end

    return
  end

  if ( x < half )
%
%  X < 0.5, use reflection formula: psi(1-x) = psi(x) + pi * cot(pi*x)
%  Use 1/X for PI*COTAN(PI*X)  when  XMIN1 < |X| <= XSMALL.
%
    if ( w <= xsmall )

      aug = - one / x;
%
%  Argument reduction for cotangent.
%
    else

      if ( x < zero )
        sgn = piov4;
      else
        sgn = - piov4;
      end

      w = w - floor ( w );
      nq = floor ( w * four );
      w = four * ( w - nq * fourth );
%
%  W is now related to the fractional part of 4.0 * X.
%  Adjust argument to correspond to values in the first
%  quadrant and determine the sign.
%
      n = floor ( nq / 2 );

      if ( n + n ~= nq )
        w = one - w;
      end

      z = piov4 * w;

      if ( mod ( n, 2 ) ~= 0 )
        sgn = - sgn;
      end
%
%  Determine the final value for  -pi * cotan(pi*x).
%
      n = floor ( ( nq + 1 ) / 2 );
      if ( mod ( n, 2 ) == 0 )
%
%  Check for singularity.
%
        if ( z == zero )

          if ( zero < x )
            value = -xinf;
          else
            value = xinf;
          end

          return
        end

        aug = sgn * ( four / tan ( z ) );

      else

        aug = sgn * ( four * tan ( z ) );

      end

    end

    x = one - x;

  end
%
%  0.5 <= X <= 3.0.
%
  if ( x <= three )

    den = x;
    upper = p1(1) * x;
    for i = 1 : 7
      den = ( den + q1(i) ) * x;
      upper = ( upper + p1(i+1) ) * x;
    end
    den = ( upper + p1(9) ) / ( den + q1(8) );
    x = ( x - x01 / x01d ) - x02;
    value = den * x + aug;
    return

  end
%
%  3.0 < X.
%
  if ( x < xlarge )
    w = one / ( x * x );
    den = w;
    upper = p2(1) * w;
    for i = 1 : 5
      den = ( den + q2(i) ) * w;
      upper = ( upper + p2(i+1) ) * w;
    end
    aug = ( upper + p2(7) ) / ( den + q2(6) ) - half / x + aug;
  end

  value = aug + log ( x );

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
