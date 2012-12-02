function product_rule ( list_filename, quad_filename )

%*****************************************************************************80
%
%% MAIN is the main program for PRODUCT_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 May 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n');
  fprintf ( 1, 'PRODUCT_RULE\n');
  fprintf ( 1, '  MATLAB version\n');
  fprintf ( 1, '\n');
  fprintf ( 1, '  Create a multidimensional product rule\n');
  fprintf ( 1, '  as a product of distinct 1D integration rules.\n');
%
%  Get the list filename.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRODUCT_RULE:\n' );
    list_filename = input ( '  Enter the name of the file listing the factors.' );

  end
%
%  Get the product file prefix.
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRODUCT_RULE:\n' );
    quad_filename = input ( '  Enter the product file prefix to use.' );

  end
%
%  Count the items in the list file.
%
  list_num = file_row_count ( list_filename );
%
%  Determine the spatial dimension and number of points in the product.
%
  dim_num = list_num;
  point_num = product_rule_size ( list_filename, list_num );
%
%  Allocate the product items.
%
  x(1:dim_num,1:point_num) = 0.0;
  w(1:point_num) = 1.0;
  r(1:dim_num,1:2) = 0.0;

  list_unit = fopen ( list_filename, 'rt' );

  if ( list_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
    fprintf ( 1, '  Nonzero value of IOS while opening list file.\n' );
    error ( 'PRODUCT_RULE - Fatal error!' );
  end
%
%  Read the factor information and apply it.
%
  for dim = 1 : dim_num

    quad_1d_filename = fgetl ( list_unit );

    quad_x_1d_filename = strcat ( quad_1d_filename, '_x.txt' );
    quad_w_1d_filename = strcat ( quad_1d_filename, '_w.txt' );
    quad_r_1d_filename = strcat ( quad_1d_filename, '_r.txt' );
%
%  Read the X file.
%
    [ dim_num_1d, point_num_1d ] = r8mat_header_read ( quad_x_1d_filename );

    if ( dim_num_1d ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
      fprintf ( 1, '  The 1D quadrature abscissa file should have exactly\n' );
      fprintf ( 1, '  one value on each line.\n' );
      error ( 'PRODUCT_RULE - Fatal error!' );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of points in 1D rule = %d\n', point_num_1d );

    x_1d = r8mat_data_read ( quad_x_1d_filename, dim_num_1d, point_num_1d );
%
%  Read the W file.
%
    [ dim_num_1d, point_num_1d2 ] = r8mat_header_read ( quad_w_1d_filename );

    if ( dim_num_1d ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
      fprintf ( 1, '  The 1D quadrature weight file should have exactly\n' );
      fprintf ( 1, '  one value on each line.\n' );
      error ( 'PRODUCT_RULE - Fatal error!' );
    end

    if ( point_num_1d2 ~= point_num_1d )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
      fprintf ( 1, '  The 1D quadrature weight file should have exactly\n' );
      fprintf ( 1, '  the same number of lines as the abscissa file.\n' );
      error ( 'PRODUCT_RULE - Fatal error!' );
    end

    w_1d = r8mat_data_read ( quad_w_1d_filename, dim_num_1d, point_num_1d );
%
%  Read the R file.
%
    [ dim_num_1d, point_num_1d2 ] = r8mat_header_read ( quad_r_1d_filename );

    if ( dim_num_1d ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
      fprintf ( 1, '  The 1D quadrature region file should have exactly\n' );
      fprintf ( 1, '  one value on each line.\n' );
      error ( 'PRODUCT_RULE - Fatal error!' );
    end

    if ( point_num_1d2 ~= 2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_RULE - Fatal error!\n' );
      fprintf ( 1, '  The 1D quadrature region file should have exactly\n' );
      fprintf ( 1, '  two lines.\n' );
      error ( 'PRODUCT_RULE - Fatal error!' );
    end

    r_1d = r8mat_data_read ( quad_r_1d_filename, 1, 2 );
%
%  Update the X, W, and R of the product rule.
%
    x = r8vec_direct_product ( dim, point_num_1d, x_1d, dim_num, point_num, x );

    w = r8vec_direct_product2 ( dim, point_num_1d, w_1d, dim_num, point_num, w );

    r(dim,1) = r_1d(1);
    r(dim,2) = r_1d(2);

  end

  fclose ( list_unit );
%
%  Write the product rule.
%
  quad_x_filename = strcat ( quad_filename, '_x.txt' );
  quad_w_filename = strcat ( quad_filename, '_w.txt' );
  quad_r_filename = strcat ( quad_filename, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating product quadrature rule X file = "%s".\n', ...
    quad_x_filename );

  r8mat_write ( quad_x_filename, dim_num, point_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating product quadrature rule W file = "%s".\n', ...
    quad_w_filename );

  r8mat_write ( quad_w_filename, 1, point_num, w );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating product quadrature rule R file = "%s".\n', ...
    quad_r_filename );

  r8mat_write ( quad_r_filename, dim_num, 2, r );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRODUCT_RULE:\n' );
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
function point_num = product_rule_size ( list_filename, list_num )

%*****************************************************************************80
%
%% PRODUCT_RULE_SIZE returns the size of a product rule of distinct factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string LIST_FILENAME, a file containing a list
%    of prefixes defining quadrature rules.
%
%    Input, integer LIST_NUM, the number of prefixes in the file.
%
%    Output, integer POINT_NUM, the number of points in the product rule.
%
  point_num = 1;

  list_unit = fopen ( list_filename, 'rt' );

  if ( list_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRODUCT_RULE_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Nonzero value of IOS while opening list file.\n' );
    error ( 'PRODUCT_RULE_SIZE - Fatal error!' );
  end

  for list = 1 : list_num

    quad_1d_filename = fgetl ( list_unit );

    quad_x_1d_filename = strcat ( quad_1d_filename, '_x.txt' );

    [ dim_num_1d, point_num_1d ] = r8mat_header_read ( quad_x_1d_filename );

    point_num = point_num * point_num_1d;

  end

  fclose ( list_unit );

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
function x = r8vec_direct_product ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, x )

%*****************************************************************************80
%
%% R8VEC_DIRECT_PRODUCT creates a direct product of R8VEC's.
%
%  Discussion:
%
%    To explain what is going on here, suppose we had to construct
%    a multidimensional quadrature rule as the product of K rules
%    for 1D quadrature.
%
%    The product rule will be represented as a list of points and weights.
%
%    The J-th item in the product rule will be associated with
%      item J1 of 1D rule 1,
%      item J2 of 1D rule 2, 
%      ..., 
%      item JK of 1D rule K.
%
%    In particular, 
%      X(J) = ( X(1,J1), X(2,J2), ..., X(K,JK))
%    and
%      W(J) = W(1,J1) * W(2,J2) * ... * W(K,JK)
%
%    So we can construct the quadrature rule if we can properly
%    distribute the information in the 1D quadrature rules.
%
%    This routine carries out that task.
%
%    Another way to do this would be to compute, one by one, the
%    set of all possible indices (J1,J2,...,JK), and then index
%    the appropriate information.  An advantage of the method shown
%    here is that you can process the K-th set of information and
%    then discard it.
%
%  Example:
%
%    Rule 1: 
%      Order = 4
%      X(1:4) = ( 1, 2, 3, 4 )
%
%    Rule 2:
%      Order = 3
%      X(1:3) = ( 10, 20, 30 )
%
%    Rule 3:
%      Order = 2
%      X(1:2) = ( 100, 200 )
%
%    Product Rule:
%      Order = 24
%      X(1:24) = 
%        ( 1, 10, 100 )
%        ( 2, 10, 100 )
%        ( 3, 10, 100 )
%        ( 4, 10, 100 )
%        ( 1, 20, 100 )
%        ( 2, 20, 100 )
%        ( 3, 20, 100 )
%        ( 4, 20, 100 )
%        ( 1, 30, 100 )
%        ( 2, 30, 100 )
%        ( 3, 30, 100 )
%        ( 4, 30, 100 )
%        ( 1, 10, 200 )
%        ( 2, 10, 200 )
%        ( 3, 10, 200 )
%        ( 4, 10, 200 )
%        ( 1, 20, 200 )
%        ( 2, 20, 200 )
%        ( 3, 20, 200 )
%        ( 4, 20, 200 )
%        ( 1, 30, 200 )
%        ( 2, 30, 200 )
%        ( 3, 30, 200 )
%        ( 4, 30, 200 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR_INDEX, the index of the factor being processed.
%    The first factor processed must be factor 1%
%
%    Input, integer FACTOR_ORDER, the order of the factor.
%
%    Input, real FACTOR_VALUE(FACTOR_ORDER), the factor values
%    for factor FACTOR_INDEX.
%
%    Input, integer FACTOR_NUM, the number of factors.
%
%    Input, integer POINT_NUM, the number of elements in the direct product.
%
%    Input, real X(FACTOR_NUM,POINT_NUM), the elements of the
%    direct product, which are built up gradually.  
%
%    Output, real X(FACTOR_NUM,POINT_NUM), the elements of the
%    direct product, updated by the latest factor.
%
%  Local Parameters:
%
%    Local, integer START, the first location of a block of values to set.
%
%    Local, integer CONTIG, the number of consecutive values to set.
%
%    Local, integer SKIP, the distance from the current value of START
%    to the next location of a block of values to set.
%
%    Local, integer REP, the number of blocks of values to set.
%
  persistent contig;
  persistent rep;
  persistent skip;

  if ( factor_index == 1 )
    contig = 1;
    skip = 1;
    rep = point_num;
    x(1:factor_num,1:point_num) = 0.0;
  end

  rep = rep / factor_order;
  skip = skip * factor_order;

  for j = 1 : factor_order

    start = 1 + ( j - 1 ) * contig;

    for k = 1 : rep
      x(factor_index,start:start+contig-1) = factor_value(j);
      start = start + skip;
    end

  end

  contig = contig * factor_order;

  return
end
function w = r8vec_direct_product2 ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, w )

%*****************************************************************************80
%
%% R8VEC_DIRECT_PRODUCT2 creates a direct product of R8VEC's.
%
%  Discussion:
%
%    To explain what is going on here, suppose we had to construct
%    a multidimensional quadrature rule as the product of K rules
%    for 1D quadrature.
%
%    The product rule will be represented as a list of points and weights.
%
%    The J-th item in the product rule will be associated with
%      item J1 of 1D rule 1,
%      item J2 of 1D rule 2, 
%      ..., 
%      item JK of 1D rule K.
%
%    In particular, 
%      X(J) = ( X(1,J1), X(2,J2), ..., X(K,JK))
%    and
%      W(J) = W(1,J1) * W(2,J2) * ... * W(K,JK)
%
%    So we can construct the quadrature rule if we can properly
%    distribute the information in the 1D quadrature rules.
%
%    This routine carries out that task for the weights W.
%
%    Another way to do this would be to compute, one by one, the
%    set of all possible indices (J1,J2,...,JK), and then index
%    the appropriate information.  An advantage of the method shown
%    here is that you can process the K-th set of information and
%    then discard it.
%
%  Example:
%
%    Rule 1: 
%      Order = 4
%      W(1:4) = ( 2, 3, 5, 7 )
%
%    Rule 2:
%      Order = 3
%      W(1:3) = ( 11, 13, 17 )
%
%    Rule 3:
%      Order = 2
%      W(1:2) = ( 19, 23 )
%
%    Product Rule:
%      Order = 24
%      W(1:24) =
%        ( 2 * 11 * 19 )
%        ( 3 * 11 * 19 )
%        ( 4 * 11 * 19 )
%        ( 7 * 11 * 19 )
%        ( 2 * 13 * 19 )
%        ( 3 * 13 * 19 )
%        ( 5 * 13 * 19 )
%        ( 7 * 13 * 19 )
%        ( 2 * 17 * 19 )
%        ( 3 * 17 * 19 )
%        ( 5 * 17 * 19 )
%        ( 7 * 17 * 19 )
%        ( 2 * 11 * 23 )
%        ( 3 * 11 * 23 )
%        ( 5 * 11 * 23 )
%        ( 7 * 11 * 23 )
%        ( 2 * 13 * 23 )
%        ( 3 * 13 * 23 )
%        ( 5 * 13 * 23 )
%        ( 7 * 13 * 23 )
%        ( 2 * 17 * 23 )
%        ( 3 * 17 * 23 )
%        ( 5 * 17 * 23 )
%        ( 7 * 17 * 23 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR_INDEX, the index of the factor being processed.
%    The first factor processed must be factor 1.
%
%    Input, integer FACTOR_ORDER, the order of the factor.
%
%    Input, real FACTOR_VALUE(FACTOR_ORDER), the factor values for
%    factor FACTOR_INDEX.
%
%    Input, integer FACTOR_NUM, the number of factors.
%
%    Input, integer POINT_NUM, the number of elements in the direct product.
%
%    Output, real W(POINT_NUM), the elements of the
%    direct product, updated by the latest factor.
%
%  Local Parameters:
%
%    Local, integer START, the first location of a block of values to set.
%
%    Local, integer CONTIG, the number of consecutive values to set.
%
%    Local, integer SKIP, the distance from the current value of START
%    to the next location of a block of values to set.
%
%    Local, integer REP, the number of blocks of values to set.
%
  persistent contig;
  persistent rep;
  persistent skip;

  if ( factor_index == 1 )
    contig = 1;
    skip = 1;
    rep = point_num;
    w(1:point_num) = 1.0;
  end

  rep = rep / factor_order;
  skip = skip * factor_order;

  for j = 1 : factor_order

    start = 1 + ( j - 1 ) * contig;

    for k = 1 : rep
      w(start:start+contig-1) = w(start:start+contig-1) * factor_value(j);
      start = start + skip;
    end

  end

  contig = contig * factor_order;

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
