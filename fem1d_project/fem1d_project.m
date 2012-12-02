function fem1d_project ( sample_prefix, fem_prefix )

%*****************************************************************************80
%
%% MAIN is the main program for FEM1D_PROJECT.
%
%  Discussion:
%
%    FEM1D_PROJECT reads files defining a sampling of a (scalar or vector)
%    function of 1 argument, and a list of nodes and elements to use for
%    a finite element representation of the data.
%
%    It computes a set of finite element coefficients to be associated with
%    the given finite element mesh, and writes that information to a file
%    so that an FEM representation is formed by the node, element and value
%    files.
%
%  Usage:
%
%    fem1d_project ( 'sample_prefix', 'fem_prefix' )
%
%    where 'sample_prefix' is the common prefix for the SAMPLE files:
%
%    * sample_prefix_nodes.txt,  the node coordinates where samples were taken,
%    * sample_prefix_values.txt, the sample values.
%
%    and 'fem_prefix' is the common prefix for the FEM files:
%
%    * fem_prefix_nodes.txt,    the node coordinates.
%    * fem_prefix_elements.txt, the nodes that make up each element;
%    * fem_prefix_values.txt,   the values defined at each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_PROJECT\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read files defining a sampling of a function of 1 argument.\n' );
  fprintf ( 1, '  Read files defining a finite element mesh.\n' );
  fprintf ( 1, '  Project the sample data onto the mesh, and\n' );
  fprintf ( 1, '  write a file of FEM coefficient values.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    sample_prefix = input ( 'Enter the sample file prefix:' );
  end

  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fem_prefix = input ( 'Enter the FEM file prefix:' );
  end
%
%  Create the filenames.
%
  sample_node_filename = strcat ( sample_prefix, '_nodes.txt' );
  sample_value_filename = strcat ( sample_prefix, '_values.txt' );

  fem_node_filename = strcat ( fem_prefix, '_nodes.txt' );
  fem_element_filename = strcat ( fem_prefix, '_elements.txt' );
  fem_value_filename = strcat ( fem_prefix, '_values.txt' );
%
%  Read the SAMPLE data.
%
  [ sample_node_dim, sample_node_num ] = r8mat_header_read ( ...
    sample_node_filename );

  sample_node_x = r8mat_data_read ( sample_node_filename, sample_node_dim, ...
    sample_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample node spatial dimension is %d\n', sample_node_dim );
  fprintf ( 1, '  Sample node number is            %d\n', sample_node_num );

  if ( sample_node_dim ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_PROJECT - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension of the sample nodes is not 1.\n' );
    return
  end

  [ sample_value_dim, sample_value_num ] = r8mat_header_read ( ...
    sample_value_filename );

  sample_value = r8mat_data_read ( sample_value_filename, sample_value_dim, ...
    sample_value_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample value dimension is        %d\n', sample_value_dim );
  fprintf ( 1, '  Sample value number is           %d\n', sample_value_num );

  if ( sample_value_num ~= sample_node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_PROJECT - Fatal error!\n' );
    fprintf ( 1, '  Number of sample nodes and values are not equal.\n' );
    return
  end
%
%  Read the FEM data.
%
  [ fem_node_dim, fem_node_num ] = r8mat_header_read ( fem_node_filename );

  fem_node_x = r8mat_data_read ( fem_node_filename, fem_node_dim, ...
    fem_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The FEM node dimension is        %d\n', fem_node_dim );
  fprintf ( 1, '  The FEM node number is           %d\n', fem_node_num );

  if ( fem_node_dim ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_PROJECT - Fatal error!\n' );
    fprintf ( 1,'  Spatial dimension of the nodes is not 1.\n' );
    return
  end

  [ fem_element_order, fem_element_num ] = i4mat_header_read ( ...
    fem_element_filename );

  fem_element_node = i4mat_data_read ( fem_element_filename, ...
    fem_element_order, fem_element_num );

  fprintf ( 1, '  The FEM element order is         %d\n', fem_element_order );
  fprintf ( 1, '  The FEM element number is        %d\n', fem_element_num );
%
%  Compute the FEM values.
%
  fem_value_dim = sample_value_dim;
  fem_value_num = fem_node_num;

  fem_value = fem1d_approximate ( sample_node_num, sample_value_dim, ...
    sample_node_x, sample_value, fem_node_num, fem_node_x, ...
    fem_element_order, fem_element_num, fem_value_dim, fem_value_num );
%
%  Write the FEM values.
%
  r8mat_write ( fem_value_filename, fem_value_dim, ...
    fem_value_num, fem_value );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  FEM value data written to "%s".\n', fem_value_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_PROJECT\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function fem_value = fem1d_approximate ( sample_node_num, sample_value_dim, ...
  sample_node_x, sample_value, fem_node_num, fem_node_x, fem_element_order, ...
  fem_element_num, fem_value_dim, fem_value_num )

%*****************************************************************************80
%
%% FEM1D_APPROXIMATE approximates data at sample points with an FEM function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SAMPLE_NODE_NUM, the number of sample points.
%
%    Input, integer SAMPLE_VALUE_DIM, the value dimension.
%
%    Input, real SAMPLE_NODE_X(SAMPLE_NODE_NUM), the sample nodes.
%
%    Input, real SAMPLE_VALUE(VALUE_DIM,SAMPLE_NODE_NUM),
%    the values at sample nodes.
%
%    Input, integer FEM_NODE_NUM, the number of FEM nodes.
%
%    Input, real FEM_NODE_X(FEM_NODE_NUM), the FEM nodes.
%
%    Input, integer FEM_ELEMENT_ORDER, the element order.
%
%    Input, integer FEM_ELEMENT_NUM, the number of elements.
%
%    Input, integer FEM_VALUE_DIM, the FEM value dimension.
%
%    Input, integer FEM_VALUE_NUM, the number of FEM values.
%
%    Output, real FEM_VALUE(FEM_VALUE_DIM,FEM_VALUE_NUM), the FEM values.
%
  quad_num = 2;
  quad_x(1:quad_num) = [ ...
    -0.577350269189625764509148780502, ...
     0.577350269189625764509148780502 ];

  quad_w(1:quad_num) = [ 1.0, 1.0 ];
%
%  Set up the matrix A.
%
  A = sparse ( [], [], [], fem_node_num, fem_node_num, 3 * fem_node_num );

  for l = 1 : fem_node_num - 1

    r = l + 1;
    xl = fem_node_x(l);
    xr = fem_node_x(r);

    for quad = 1 : quad_num

      xq = ( ( 1.0 - quad_x(quad) ) * xl   ...
           + ( 1.0 + quad_x(quad) ) * xr ) ...
           /   2.0;

      wq = quad_w(quad) * ( xr - xl ) / 2.0;

      phil = (      xq - xr ) ...
           / ( xl      - xr );

      phir = ( xl - xq      ) ...
           / ( xl      - xr );

      A(l,l)   = A(l,l)   + wq * phil * phil;
      A(l,l+1) = A(l,l+1) + wq * phil * phir;

      A(r,r-1) = A(r,r-1) + wq * phir * phil;
      A(r,r)   = A(r,r)   + wq * phir * phir;

    end

  end
%
%  Set up the right hand side b.
%
  b(1:fem_value_dim,1:fem_value_num) = 0.0;

  for i = 1 : fem_node_num

    if ( i == 1 )
      phi_num = 2;
      phi_x(1) = fem_node_x(1);
      phi_x(2) = fem_node_x(2);
      phi_v(1) = 1.0;
      phi_v(2) = 0.0;
    elseif ( i < fem_node_num )
      phi_num = 3;
      phi_x(1) = fem_node_x(i-1);
      phi_x(2) = fem_node_x(i);
      phi_x(3) = fem_node_x(i+1);
      phi_v(1) = 0.0;
      phi_v(2) = 1.0;
      phi_v(3) = 0.0;
    elseif ( i == fem_node_num )
      phi_num = 2;
      phi_x(1) = fem_node_x(fem_node_num-1);
      phi_x(2) = fem_node_x(fem_node_num);
      phi_v(1) = 0.0;
      phi_v(2) = 1.0;
    end

    a1 = phi_x(1);
    b1 = phi_x(phi_num);

    for dim = 1 : fem_value_dim

      b(dim,i) = piecewise_linear_product_quad ( a1, b1, phi_num, phi_x, phi_v, ...
        sample_node_num, sample_node_x, sample_value(dim,1:sample_node_num) );

    end

  end

  fem_value = ( A \ b' )';

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
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
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
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  table = zeros ( m, n );

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
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
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
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
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function integral = piecewise_linear_product_quad ( a, b, f_num, f_x, ...
  f_v, g_num, g_x, g_v )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_QUAD: piecewise linear product integral.
%
%  Discussion:
%
%    We are given two piecewise linear functions F(X) and G(X) and we wish
%    to compute the exact value of the integral
%
%      INTEGRAL = Integral ( A <= X <= B ) F(X) * G(X) dx
%
%    The functions F(X) and G(X) are defined as tables of coordinates X and
%    values V.  A piecewise linear function is evaluated at a point X by
%    evaluating the interpolant to the data at the endpoints of the interval
%    containing X.
%
%    It must be the case that A <= B.
%
%    It must be the case that the node coordinates F_X(*) and G_X(*) are
%    given in ascending order.
%
%    It must be the case that:
%
%      F_X(1) <= A and B <= F_X(F_NUM)
%      G_X(1) <= A and B <= G_X(G_NUM)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the limits of integration.
%
%    Input, integer F_NUM, the number of nodes for F.
%
%    Input, real F_X(F_NUM), the node coordinates for F.
%
%    Input, real F_V(F_NUM), the nodal values for F.
%
%    Input, integer G_NUM, the number of nodes for G.
%
%    Input, real G_X(G_NUM), the node coordinates for G.
%
%    Input, real G_V(G_NUM), the nodal values for G.
%
%    Output, real INTEGRAL, the integral of F(X) * G(X)
%    from A to B.
%
  integral = 0.0;

  if ( f_x(f_num) <= a || g_x(g_num) <= a )
    return
  end

  if ( f_num < 2 || g_num < 2 )
    return
  end

  xr = a;

  f_left = 1;
  f_left = r8vec_bracket3 ( f_num, f_x, xr, f_left );
  fr = f_v(f_left) + ( xr - f_x(f_left) ) * ( f_v(f_left+1) - f_v(f_left) ) ...
    / ( f_x(f_left+1) - f_x(f_left) );

  g_left = 1;
  g_left = r8vec_bracket3 ( g_num, g_x, xr, g_left );
  gr = g_v(g_left) + ( xr - g_x(g_left) ) * ( g_v(g_left+1) - g_v(g_left) ) ...
    / ( g_x(g_left+1) - g_x(g_left) );

  xr_max = b;
  xr_max = min ( xr_max, f_x(f_num) );
  xr_max = min ( xr_max, g_x(g_num) );

  while ( xr < xr_max )
%
%  Shift right values to left.
%
    xl = xr;
    fl = fr;
    gl = gr;
%
%  Determine the new right values.
%  The hard part is figuring out how to advance XR some, but not too much.
%
    xr = xr_max;

    for i = 1 : 2
      if ( f_left + i <= f_num )
        if ( xl < f_x(f_left+i) && f_x(f_left+i) < xr )
          xr = f_x(f_left+i);
          break
        end
      end
    end

    for i = 1 : 2
      if ( g_left + i <= g_num )
        if ( xl < g_x(g_left+i) && g_x(g_left+i) < xr )
          xr = g_x(g_left+i);
          break
        end
      end
    end

    f_left = r8vec_bracket3 ( f_num, f_x, xr, f_left );
    fr = f_v(f_left) + ( xr - f_x(f_left) ) * ( f_v(f_left+1) - f_v(f_left) ) ...
      / ( f_x(f_left+1) - f_x(f_left) );

    g_left = r8vec_bracket3 ( g_num, g_x, xr, g_left );
    gr = g_v(g_left) + ( xr - g_x(g_left) ) * ( g_v(g_left+1) - g_v(g_left) ) ...
      / ( g_x(g_left+1) - g_x(g_left) );
%
%  Form the linear polynomials for F(X) and G(X) over [XL,XR],
%  then the product H(X), integrate H(X) and add to the running total.
%
    if ( eps <= abs ( xr - xl ) )

      f1 = fl - fr;
      f0 = fr * xl - fl * xr;

      g1 = gl - gr;
      g0 = gr * xl - gl * xr;

      h2 = f1 * g1;
      h1 = f1 * g0 + f0 * g1;
      h0 = f0 * g0;

      h2 = h2 / 3.0;
      h1 = h1 / 2.0;

      bit = ( ( h2 * xr + h1 ) * xr + h0 ) * xr ...
          - ( ( h2 * xl + h1 ) * xl + h0 ) * xl;

      integral = integral + bit / ( xr - xl ) / ( xr - xl );

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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
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
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function left = r8vec_bracket3 ( n, t, tval, left )

%*****************************************************************************80
%
%% R8VEC_BRACKET3 finds the interval containing or nearest a given value.
%
%  Discussion:
%
%    The routine always returns the index LEFT of the sorted array
%    T with the property that either
%    *  T is contained in the interval [ T(LEFT), T(LEFT+1) ], or
%    *  T < T(LEFT) = T(1), or
%    *  T > T(LEFT+1) = T(N).
%
%    The routine is useful for interpolation problems, where
%    the abscissa must be located within an interval of data
%    abscissas for interpolation, or the "nearest" interval
%    to the (extreme) abscissa must be found so that extrapolation
%    can be carried out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, length of the input array.
%
%    Input, real T(N), an array that has been sorted into ascending order.
%
%    Input, real TVAL, a value to be bracketed by entries of T.
%
%    Input, integer LEFT, if 1 <= LEFT <= N-1, LEFT is taken as a suggestion for the
%    interval [ T(LEFT), T(LEFT+1) ] in which TVAL lies.  This interval
%    is searched first, followed by the appropriate interval to the left
%    or right.  After that, a binary search is used.
%
%    Output, integer LEFT, is set so that the interval [ T(LEFT), T(LEFT+1) ]
%    is the closest to TVAL; it either contains TVAL, or else TVAL
%    lies outside the interval [ T(1), T(N) ].
%

%
%  Check the input data.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET3 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2.\n' );
    error ( 'R8VEC_BRACKET3 - Fatal error!' );
  end
%
%  If LEFT is not between 1 and N-1, set it to the middle value.
%
  if ( left < 1 | n - 1 < left )
    left = floor ( ( n + 1 ) / 2 );
  end
%
%  CASE 1: TVAL < T(LEFT):
%  Search for TVAL in [T(I), T(I+1)] for intervals I = 1 to LEFT-1.
%
  if ( tval < t(left) )

    if ( left == 1 )
      left = 1;
      return
    elseif ( left == 2 )
      left = 1;
      return
    elseif ( t(left-1) <= tval )
      left = left - 1;
      return
    elseif ( tval <= t(2) )
      left = 1;
      return
    end
%
%  ...Binary search for TVAL in [T(I), T(I+1)] for intervals I = 2 to LEFT-2.
%
    low = 2;
    high = left - 2;

    while ( 1 )

      if ( low == high )
        left = low;
        return
      end

      mid = floor ( ( low + high + 1 ) / 2 );

      if ( t(mid) <= tval )
        low = mid;
      else
        high = mid - 1;
      end

    end
%
%  CASE2: T(LEFT+1) < TVAL:
%  Search for TVAL in {T(I),T(I+1)] for intervals I = LEFT+1 to N-1.
%
  elseif ( t(left+1) < tval )

    if ( left == n - 1 )
      return
    elseif ( left == n - 2 )
      left = left + 1;
      return
    elseif ( tval <= t(left+2) )
      left = left + 1;
      return
    elseif ( t(n-1) <= tval )
      left = n - 1;
      return
    end
%
%  ...Binary search for TVAL in [T(I), T(I+1)] for intervals I = LEFT+2 to N-2.
%
    low = left + 2;
    high = n - 2;

    while ( 1 )

      if ( low == high )
        left = low;
        return
      end

      mid = floor ( ( low + high + 1 ) / 2 );

      if ( t(mid) <= tval )
        low = mid;
      else
        high = mid - 1;
      end

    end
%
%  CASE3: T(LEFT) <= TVAL <= T(LEFT+1):
%  T is in [T(LEFT), T(LEFT+1)], as the user said it might be.
%
  else

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
