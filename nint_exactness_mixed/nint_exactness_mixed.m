function nint_exactness_mixed ( quad_filename, degree_max )

%*****************************************************************************80
%
%% MAIN is the main program for NINT_EXACTNESS_MIXED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINT_EXACTNESS_MIXED\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the polynomial exactness of\n' );
  fprintf ( 1, '  a multidimensional quadrature rule\n' );
  fprintf ( 1, '  for a region R = R1 x R2 x ... x RM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Individual rules may be for:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Legendre:\n' );
  fprintf ( 1, '  region: [-1,+1]\n' );
  fprintf ( 1, '  weight: w(x)=1\n' );
  fprintf ( 1, '  rules: Gauss-Legendre, Clenshaw-Curtis, Fejer2, Gauss-Patterson\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Jacobi:\n' );
  fprintf ( 1, '  region: [-1,+1]\n' );
  fprintf ( 1, '  weight: w(x)=(1-x)^alpha (1+x)^beta\n' );
  fprintf ( 1, '  rules: Gauss-Jacobi\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Laguerre:\n' );
  fprintf ( 1, '  region: [0,+oo)\n' );
  fprintf ( 1, '  weight: w(x)=exp(-x)\n' );
  fprintf ( 1, '  rules: Gauss-Laguerre\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generalized Laguerre:\n' );
  fprintf ( 1, '  region: [0,+oo)\n' );
  fprintf ( 1, '  weight: w(x)=x^alpha exp(-x)\n' );
  fprintf ( 1, '  rules: Generalized Gauss-Laguerre\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hermite:\n' );
  fprintf ( 1, '  region: (-oo,+o)\n' );
  fprintf ( 1, '  weight: w(x)=exp(-x*x)\n' );
  fprintf ( 1, '  rules: Gauss-Hermite\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generalized Hermite:\n' );
  fprintf ( 1, '  region: (-oo,+oo)\n' );
  fprintf ( 1, '  weight: w(x)=|x|^alpha exp(-x*x)\n' );
  fprintf ( 1, '  rules: generalized Gauss-Hermite\n' );
%
%  Get the quadrature file root name:
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files.' );

  end
%
%  Create the names of:
%    the quadrature A file;
%    the quadrature B file;
%    the quadrature R file;
%    the quadrature W file;
%    the quadrature X file;
%    the output "exactness" file.
%
  quad_a_filename = strcat ( quad_filename, '_a.txt' );
  quad_b_filename = strcat ( quad_filename, '_b.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
%
%  The second command line argument is the maximum degree.
%
  if ( 2 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED:\n' );

    degree_max = input ( '  Please enter the maximum total degree to check.' );

  end
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINT_EXACTNESS_MIXED: User input:\n' );
  fprintf ( 1, '  Quadrature rule A file = "%s".\n', quad_a_filename );
  fprintf ( 1, '  Quadrature rule B file = "%s".\n', quad_b_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Maximum total degree to check = %d', degree_max );
%
%  Read the X file.
%
  [ dim_num, point_num ] = r8mat_header_read ( quad_x_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', point_num );

  x = r8mat_data_read ( quad_x_filename, dim_num, point_num );
%
%  Read the W file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_w_filename );

  if ( dim_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'NINT_EXACTNESS - Fatal error!' );
  end

  if ( point_num2 ~= point_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'NINT_EXACTNESS - Fatal error!' );
  end

  weight = r8mat_data_read ( quad_w_filename, 1, point_num );
%
%  Read the R file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_r_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  if ( point_num2 ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  x_range = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Read the A file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_a_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature A file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  if ( point_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature A file should have 1 line.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  alpha = r8mat_data_read ( quad_a_filename, dim_num, 1 );
%
%  Read the B file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_b_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature B file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  if ( point_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
    fprintf ( 1, '  The quadrature B file should have 1 line.\n' );
    error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );
  end

  beta = r8mat_data_read ( quad_b_filename, dim_num, 1 );
%
%  Try to determine the rule types.
%
  rule = zeros ( dim_num, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Analysis of integration region:\n' );
  fprintf ( 1, '\n' );

  for dim = 1 : dim_num

    if ( x_range(dim,1) == -1.0 && x_range(dim,2) == +1.0 )

      if ( alpha(dim) == 0.0 && beta(dim) == 0.0 )
        rule(dim) = 1;
        fprintf ( 1, '  %4d  Gauss-Legendre\n', dim );
      else
        rule(dim) = 2;
        fprintf ( 1, '  %4d  Gauss-Jacobi, ALPHA = %f, BETA = %f\n', ...
        dim, alpha(dim), beta(dim) );
      end

    elseif ( x_range(dim,1) == 0.0 && x_range(dim,2) == r8_huge ( ) )

      if ( alpha(dim) == 0.0 )
        rule(dim) = 3;
        fprintf ( 1, '  %4d  Gauss-Laguerre\n', dim );
      else
        rule(dim) = 4;
        fprintf ( 1, '  %4d  Generalized Gauss Laguerre, ALPHA = %f\n', dim, alpha(dim) );
      end

    elseif ( x_range(dim,1) == - r8_huge ( ) && x_range(dim,2) == + r8_huge ( ) )

      if ( alpha(dim) == 0.0 )
        rule(dim) = 5;
        fprintf ( 1, '  %4d  Gauss Hermite.\n', dim );
      else
        rule(dim) = 6;
        fprintf ( 1, '  %4d  Generalized Gauss Hermite, ALPHA = %f\n', dim, alpha(dim) );
      end

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'NINT_EXACTNESS_MIXED - Fatal error!\n' );
      fprintf ( 1, '  Did not recognize region component.\n' );
      fprintf ( 1, '  Dimension DIM = %d\n', dim );
      fprintf ( 1, '  A = %f\n', x_range(dim,1) );
      fprintf ( 1, '  B = %f\n', x_range(dim,2) );
      error ( 'NINT_EXACTNESS_MIXED - Fatal error!' );

    end

  end
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

      quad_error = monomial_quadrature ( dim_num, point_num, rule, alpha, ...
        beta, expon, weight, x );

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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINT_EXACTNESS_MIXED:\n' );
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
%    Original FORTRAN77 version by Albert Nijenhuis and Herbert Wilf
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
function value = monomial_integral_generalized_hermite ( expon, alpha )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_GENERALIZED_HERMITE evaluates a 1D monomial generalized Hermite integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( -oo < x < +oo ) x^n |x|^alpha exp(-x*x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent of the monomial.
%    0 <= EXPON.
%
%    Input, real ALPHA, the exponent of |x| in the weight.
%    -1.0 < ALPHA.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( expon, 2 ) == 1 )

    value = 0.0;

  else

    arg = alpha + expon;

    if ( arg <= - 1.0 )
      value = - r8_huge ( );
    else
      arg = ( arg + 1.0 ) / 2.0;
      value = r8_gamma ( arg );
    end

  end

  return
end
function value = monomial_integral_generalized_laguerre ( expon, alpha )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_GENERALIZED_LAGUERRE evaluates a 1D monomial generalized Laguerre integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( 0 <= x < +oo ) x^n x^alpha exp(-x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent of the monomial.
%    0 <= EXPON.
%
%    Input, real ALPHA, the exponent of x in the weight.
%    -1.0 < ALPHA.
%
%    Output, real VALUE, the value of the integral.
%
  arg = alpha + expon + 1;

  value = r8_gamma ( arg );

  return
end
function value = monomial_integral_hermite ( expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_HERMITE evaluates a 1D monomial Hermite integral.
%
%  Discussion:
%
%    H(n) = Integral ( -oo < x < +oo ) x^n exp(-x*x) dx
%
%    H(n) is 0 for n odd.
%
%    H(n) = (n-1)%% * sqrt(pi) / 2^(n/2) for n even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real VALUE, the value of the integral.
%
  if ( expon < 0 )

    value = - Inf;

  elseif ( mod ( expon, 2 ) == 1 )

    value = 0.0;

  else

    value = r8_factorial2 ( expon - 1 ) * sqrt ( pi ) / 2.0 ^ ( expon / 2 );

  end

  return
end
function value = monomial_integral_jacobi ( expon, alpha, beta )

%*****************************************************************************80
%
% MONOMIAL_INTEGRAL_JACOBI evaluates the integral of a monomial with Jacobi weight.
%
%  Discussion:
%
%    VALUE = Integral ( -1 <= X <= +1 ) x^EXPON (1-x)^ALPHA (1+x)^BETA dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer  EXPON, the exponent.
%
%    Input, real ALPHA, the exponent of (1-X) in the weight factor.
%
%    Input, real BETA, the exponent of (1+X) in the weight factor.
%
%    Output, real VALUE, the value of the integral.
%
  c = expon;

  if ( mod ( expon, 2 ) == 0 )
    s = +1.0;
  else
    s = -1.0;
  end

  arg1 = - alpha;
  arg2 =   1.0 + c;
  arg3 =   2.0 + beta + c;
  arg4 = - 1.0;

  value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  arg1 = - beta;
  arg2 =   1.0 + c;
  arg3 =   2.0 + alpha + c;
  arg4 = - 1.0;

  value2 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  value = r8_gamma ( 1.0 + c ) * ( s * r8_gamma ( 1.0 + beta  ) * value1 ...
    / r8_gamma ( 2.0 + beta  + c ) ...
    +     r8_gamma ( 1.0 + alpha ) * value2 / r8_gamma ( 2.0 + alpha + c ) );

  return
end
function value = monomial_integral_laguerre ( expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_LAGUERRE evaluates a 1D monomial Laguerre integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( 0 <= x < +oo ) x^n * exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real VALUE, the value of the integral.
%
  value = r8_factorial ( expon );

  return
end
function value = monomial_integral_legendre ( expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_LEGENDRE evaluates a 1D monomial Legendre integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( -1 <= x < +1 ) x^n dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( expon, 2 ) == 1 )
    value = 0.0;
  elseif ( mod ( expon, 2 ) == 0 )
    value = 2.0 / ( expon + 1 );
  end

  return
end
function value = monomial_integral_mixed ( dim_num, rule, alpha, beta, expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_MIXED evaluates a multi-D monomial mixed integral.
%
%  Discussion:
%
%    This routine evaluates the integral, over a multidimensional region.
%    of a monomial of the form
%
%      product ( 1 <= dim <= dim_num ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%    The integration is carried out in a region that is a direct product
%    of 1D factors that may be of various types,
%    and the integration includes the weight functions associated with
%    the 1D factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer RULE(DIM_NUM), the component rules.
%    1, Gauss-Legendre rule on [-1,+1];
%    2, Gauss-Jacobi rule on [-1,+1];
%    3, Gauss-Laguerre rule on [0,+oo);
%    4, Generalized Gauss-Laguerre rule on [0,+oo);
%    5, Gauss-Hermite rule on (-oo,+oo);
%    6, Generalized Gauss-Hermite rule on (-oo,+oo).
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters that
%    may be needed for Jacobi, Generalized-Laguerre, or Generalized Hermite rules.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Output, real VALUE, the value of the integral.
%
  value = 1.0;

  for dim = 1 : dim_num

    if ( rule(dim) == 1 )
      value = value * monomial_integral_legendre ( expon(dim) );
    elseif ( rule(dim) == 2 )
      value = value ...
        * monomial_integral_jacobi ( expon(dim), alpha(dim), beta(dim) );
    elseif ( rule(dim) == 3 )
      value = value * monomial_integral_laguerre ( expon(dim) );
    elseif ( rule(dim) == 4 )
      value = value ...
        * monomial_integral_generalized_laguerre ( expon(dim), alpha(dim) );
    elseif ( rule(dim) == 5 )
      value = value * monomial_integral_hermite ( expon(dim) );
    elseif ( rule(dim) == 6 )
      value = value ...
        * monomial_integral_generalized_hermite ( expon(dim), alpha(dim) );
    end

  end

  return
end
function quad_error = monomial_quadrature ( dim_num, point_num, rule, alpha, ...
  beta, expon, weight, x )

%*****************************************************************************80
%
%% MONOMIAL_QUADRATURE applies a quadrature rule to a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points in the rule.
%
%    Input, integer RULE(DIM_NUM), the component rules.
%    1, Gauss-Legendre rule on [-1,+1];
%    2, Gauss-Jacobi rule on [-1,+1];
%    3, Gauss-Laguerre rule on [0,+oo);
%    4, Generalized Gauss-Laguerre rule on [0,+oo);
%    5, Gauss-Hermite rule on (-oo,+oo);
%    6, Generalized Gauss-Hermite rule on (-oo,+oo).
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters that
%    may be needed for Jacobi, Generalized-Laguerre, or Generalized Hermite rules.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Input, real WEIGHT(POINT_NUM), the quadrature weights.
%
%    Input, real X(DIM_NUM,POINT_NUM), the quadrature points.
%
%    Output, real QUAD_ERROR, the quadrature error.
%

%
%  Get the exact value of the integral of the unscaled monomial.
%
  exact = monomial_integral_mixed ( dim_num, rule, alpha, beta, expon );
%
%  Evaluate the monomial at the quadrature points.
%
  value = monomial_value ( dim_num, point_num, expon, x );
%
%  Compute the weighted sum and divide by the exact value.
%
  quad = ( weight * transpose ( value ) );
%
%  Error:
%
  if ( exact == 0.0 )
    quad_error = abs ( quad - exact );
  else
    quad_error = abs ( quad - exact ) / abs ( exact );
  end

  return
end
function value = monomial_value ( dim_num, point_num, expon, x )

%*****************************************************************************80
%
%% MONOMIAL_VALUE evaluates a monomial.
%
%  Discussion:
%
%    This routine evaluates a multidimensional monomial which is a product 
%    of 1D factors of the form x(dim)^expon(dim).
%
%    The exponents are nonnegative integers.  
%
%    Note that if the combination 0^0 is encountered, it should be treated
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
function value = r8_factorial ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL returns N!.
%
%  Discussion:
%
%    factorial ( N ) = Product ( 1 <= I <= N ) I
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%    0 <= N.
%
%    Output, real VALUE, the factorial of N.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_FACTORIAL - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'R8_FACTORIAL - Fatal error!' );
  end

  value = 1.0;

  for i = 2 : n
    value = value * i;
  end

  return
end
function value = r8_factorial2 ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL2 computes the double factorial function.
%
%  Formula:
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
function value = r8_huge ( )

%*****************************************************************************80
%
%% R8_HUGE returns a "huge" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R8.  This value varies from machine to machine,
%    from compiler to compiler, and may cause problems when being printed.
%    We simply want a "very large" but non-infinite number.
%
%    MATLAB provides a built-in symbolic constant "inf" that can be used
%    if a huge number is really what you want!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

  return
end
function hf = r8_hyper_2f1 ( a, b, c, x )

%*****************************************************************************80
%
%% R8_HYPER_2F1 evaluates the hypergeometric function F(A,B,C,X).
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
%    Original FORTRAN77 version by Shanjie Zhang, Jianming Jin.
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
%    Original FORTRAN77 version by William Cody
%    MATLAB version by John Burkardt
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
