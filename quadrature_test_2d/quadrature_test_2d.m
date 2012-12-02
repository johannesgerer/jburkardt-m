function quadrature_test_2d ( quad_filename )

%*****************************************************************************80
%
%% MAIN is the main program for QUADRATURE_TEST_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST_2D\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Investigate the accuracy of a 2D quadrature\n' );
  fprintf ( 1, '  rule by integrating test functions.\n' );
%
%  Get the quadrature file root name:
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST_2D:\n' );

    quad_filename = input ( '  Enter the "root" name of the quadrature files.' );

  end
%
%  Create the names of:
%    the quadrature X file;
%    the quadrature W file;
%    the quadrature R file.
%
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );
%
%  Summarize the input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST_2D: User input:\n' );
  fprintf ( 1, '  Quadrature rule X file = "%s".\n', quad_x_filename );
  fprintf ( 1, '  Quadrature rule W file = "%s".\n', quad_w_filename );
  fprintf ( 1, '  Quadrature rule R file = "%s".\n', quad_r_filename );
%
%  Read the X file.
%
  [ dim_num, point_num ] = r8mat_header_read ( quad_x_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', point_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST_2D - Fatal error!\n' );
    fprintf ( 1, '  The X file seems to have spatial dimension = %d\n', dim_num );
    fprintf ( 1, '  This program requires a spatial dimension of 2.\n' );
    error ( 'QUADRATURE_TEST_2D - Fatal error!\n' );
    return
  end

  x = r8mat_data_read ( quad_x_filename, dim_num, point_num );
%
%  Read the W file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_w_filename );

  if ( dim_num2 ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n');
    fprintf ( 1, '  one value on each line.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  if ( point_num2 ~= point_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature weight file should have exactly\n' );
    fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  w = r8mat_data_read ( quad_w_filename, 1, point_num );
%
%  Read the R file.
%
  [ dim_num2, point_num2 ] = r8mat_header_read ( quad_r_filename );

  if ( dim_num2 ~= dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have the same\n' );
    fprintf ( 1, '  number of values on each line as the abscissa file\n' );
    fprintf ( 1, '  does.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  if ( point_num2 ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_TEST - Fatal error!\n' );
    fprintf ( 1, '  The quadrature region file should have two lines.\n' );
    error ( 'QUADRATURE_TEST - Fatal error!' );
  end

  r = r8mat_data_read ( quad_r_filename, dim_num, 2 );
%
%  Ready to start the tests.
%
  volume1 = abs ( prod ( r(1:dim_num,2) - r(1:dim_num,1) ) );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Prob   Dim      Points          Approx          Exact           Error\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    exact = p00_exact ( problem );

    [ a, b ] = p00_lim ( problem );

    volume2 = prod ( b(1:dim_num) - a(1:dim_num) );
%
%  Map the abscissas to the [A,B] hypercube.
%
    for dim = 1 : dim_num
      x2(dim,1:point_num) = ...
      ( ( r(dim,2) - x(dim,1:point_num)            ) * a(dim)   ...
      + (            x(dim,1:point_num) - r(dim,1) ) * b(dim) ) ...
      / ( r(dim,2)                      - r(dim,1) );
    end
%
%  Evaluate the function at the abscissas.
%
    f = p00_fun ( problem, point_num, x2 );
%
%  Compute the weighted estimate.
%
    quad_est = w(1:point_num) * f(1:point_num)' * volume2 / volume1;

    quad_err = abs ( quad_est - exact );

    fprintf ( 1, '  %4d  %4d  %10d  %14f  %14f  %14f\n', ...
      problem, dim_num, point_num, quad_est, exact, quad_err );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRATURE_TEST_2D:\n' );
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
function exact = p00_exact ( problem )

%*****************************************************************************80
%
%% P00_EXACT returns the exact integral for any problem.
%
%  Discussion:
%
%    This routine provides a "generic" interface to the exact integral
%    routines for the various problems, and allows a problem to be called
%    by index rather than by name.
%
%    In some cases, the "exact" value of the integral is in fact
%    merely a respectable approximation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Output, real EXACT, the exact value of the integral.
%
  if ( problem == 1 )
    exact = p01_exact ( );
  elseif ( problem == 2 )
    exact = p02_exact ( );
  elseif ( problem == 3 )
    exact = p03_exact ( );
  elseif ( problem == 4 )
    exact = p04_exact ( );
  elseif ( problem == 5 )
    exact = p05_exact ( );
  elseif ( problem == 6 )
    exact = p06_exact ( );
  elseif ( problem == 7 )
    exact = p07_exact ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_EXACT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index = %d\n', problem );
    error ( 'P00_EXACT - Fatal error!\n' );
  end

  return
end
function fx = p00_fun ( problem, n, x )

%*****************************************************************************80
%
%% P00_FUN evaluates the integrand for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  if ( problem == 1 )
    fx = p01_fun ( n, x );
  elseif ( problem == 2 )
    fx = p02_fun ( n, x );
  elseif ( problem == 3 )
    fx = p03_fun ( n, x );
  elseif ( problem == 4 )
    fx = p04_fun ( n, x );
  elseif ( problem == 5 )
    fx = p05_fun ( n, x );
  elseif ( problem == 6 )
    fx = p06_fun ( n, x );
  elseif ( problem == 7 )
    fx = p07_fun ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index = %d\n', problem );
    error ( 'P00_FUN - Fatal error!\n' );
  end

  return
end
function [ a, b ] = p00_lim ( problem )

%*****************************************************************************80
%
%% P00_LIM returns the integration limits for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  if ( problem == 1 )
    [ a, b ] = p01_lim ( );
  elseif ( problem == 2 )
    [ a, b ] = p02_lim ( );
  elseif ( problem == 3 )
    [ a, b ] = p03_lim ( );
  elseif ( problem == 4 )
    [ a, b ] = p04_lim ( );
  elseif ( problem == 5 )
    [ a, b ] = p05_lim ( );
  elseif ( problem == 6 )
    [ a, b ] = p06_lim ( );
  elseif ( problem == 7 )
    [ a, b ] = p07_lim ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_LIM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index = %d\n', problem );
    error ( 'P00_LIM - Fatal error!\n' );
  end

  return
end
function problem_num = p00_problem_num ( )

%*****************************************************************************80
%
%% P00_PROBLEM_NUM returns the number of test integration problems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer PROBLEM_NUM, the number of problems.
%
  problem_num = 7;

  return
end
function exact = p01_exact ( )

%*****************************************************************************80
%
%% P01_EXACT returns the exact integral for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = pi * pi / 6.0;

  return
end
function fx = p01_fun ( n, x )

%*****************************************************************************80
%
%% P01_FUN evaluates the integrand for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = 1.0 ./ ( 1.0 - x(1,1:n) .* x(2,1:n) );

  return
end
function [ a, b ] = p01_lim ( )

%*****************************************************************************80
%
%% P01_LIM returns the integration limits for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = 0.0;
  b(1:2) = 1.0;

  return
end
function exact = p02_exact ( )

%*****************************************************************************80
%
%% P02_EXACT returns the exact integral for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = 2.0 * pi * log ( 2.0 );

  return
end
function fx = p02_fun ( n, x )

%*****************************************************************************80
%
%% P02_FUN evaluates the integrand for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = 1.0 ./ sqrt ( 1.0 - x(1,1:n).^2 .* x(2,1:n).^2 );

  return
end
function [ a, b ] = p02_lim ( )

%*****************************************************************************80
%
%% P02_LIM returns the integration limits for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = -1.0;
  b(1:2) =  1.0;

  return
end
function exact = p03_exact ( )

%*****************************************************************************80
%
%% P03_EXACT returns the exact integral for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = ( 16.0 / 3.0 ) * ( 2.0 - sqrt ( 2.0 ) );

  return
end
function fx = p03_fun ( n, x )

%*****************************************************************************80
%
%% P03_FUN evaluates the integrand for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = 1.0 ./ sqrt ( 2.0 - x(1,1:n) - x(2,1:n) );

  return
end
function [ a, b ] = p03_lim ( )

%*****************************************************************************80
%
%% P03_LIM returns the integration limits for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = -1.0;
  b(1:2) =  1.0;

  return
end
function exact = p04_exact ( )

%*****************************************************************************80
%
%% P04_EXACT returns the exact integral for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = ( sqrt ( 32.0 ) / 3.0 ) * ( sqrt ( 27.0 ) - sqrt ( 8.0 ) - 1.0 );

  return
end
function fx = p04_fun ( n, x )

%*****************************************************************************80
%
%% P04_FUN evaluates the integrand for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = 1.0 ./ sqrt ( 3.0 - x(1,1:n) - 2.0 * x(2,1:n) );

  return
end
function [ a, b ] = p04_lim ( )

%*****************************************************************************80
%
%% P04_LIM returns the integration limits for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = -1.0;
  b(1:2) =  1.0;

  return
end
function exact = p05_exact ( )

%*****************************************************************************80
%
%% P05_EXACT returns the exact integral for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = 4.0 / 9.0;

  return
end
function fx = p05_fun ( n, x )

%*****************************************************************************80
%
%% P05_FUN evaluates the integrand for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = sqrt ( x(1,1:n) .* x(2,1:n) );

  return
end
function [ a, b ] = p05_lim ( )

%*****************************************************************************80
%
%% P05_LIM returns the integration limits for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = 0.0;
  b(1:2) = 1.0;

  return
end
function exact = p06_exact ( )

%*****************************************************************************80
%
%% P06_EXACT returns the exact integral for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = ( 5.0 / 3.0 ) + ( pi / 16.0 );

  return
end
function fx = p06_fun ( n, x )

%*****************************************************************************80
%
%% P06_FUN evaluates the integrand for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = abs ( x(1,1:n).^2 + x(2,1:n).^2 - 0.25 );

  return
end
function [ a, b ] = p06_lim ( )

%*****************************************************************************80
%
%% P06_LIM returns the integration limits for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = -1.0;
  b(1:2) =  1.0;

  return
end
function exact = p07_exact ( )

%*****************************************************************************80
%
%% P07_EXACT returns the exact integral for problem 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = 8.0 / 15.0;

  return
end
function fx = p07_fun ( n, x )

%*****************************************************************************80
%
%% P07_FUN evaluates the integrand for problem 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX[N], the integrand values.
%
  fx(1:n) = sqrt ( abs ( x(1,1:n) - x(2,1:n) ) );

  return
end
function [ a, b ] = p07_lim ( )

%*****************************************************************************80
%
%% P07_LIM returns the integration limits for problem 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = 0.0;
  b(1:2) = 1.0;

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
