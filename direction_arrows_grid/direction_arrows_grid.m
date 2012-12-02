function direction_arrows_grid ( node_file, velocity_file, scale, number )

%*****************************************************************************80
%
%% DIRECTION_ARROWS_GRID plots a direction field grid based on scattered data.
%
%  Discussion:
%
%    The prime feature of this program is that it displays the data
%    on a uniform grid of specified density, even though the original 
%    data is scattered or of a different density.
%
%    This program was written as a quick and convenient way to
%    view finite element data.  It can also be used for any situation
%    in which a collection of points and velocities are available.
%
%    However, a small "sin" is committed when we use this program
%    on finite element data, since we take only the node locations 
%    and velocities, but not the elements.  We simply use MATLAB's grid 
%    data feature which constructs a cubic spline interpolant to 
%    scattered data.  This is OK, and probably doesn't distort the 
%    data too much, but in fact, we are not actually viewing 
%    values of the finite element function, and there is no guarantee
%    that this surrogate function will actually satisfy the boundary
%    conditions or other characteristics of the finite element
%    function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt, Hyung-Chun Lee
%
%  Usage:
%
%    direction_arrows_grid ( node_file, velocity_file, scale, number )
%
%  Parameters:
%
%    Input, string NODE_FILE, the name of the node file.
%
%    Input, string VELOCITY_FILE, the name of the velocity file.
%
%    Input, real SCALE, a scale factor.  If SCALE = 0, MATLAB
%    will do the scaling automatically.
%
%    Input, integer NUMBER, the number of grid points to use along
%    the widest direction.  (If the region is square, an
%    NUMBERxNUMBER grid will be used, otherwise the smaller spatial
%    dimension will have fewer grid points.)
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIRECTION_ARROWS_GRID:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Display a grid of direction vectors based on scattered data.\n' );
%
%  First argument is the node file.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    node_file = input ( '  Enter the name of the node file.' );
  end
%
%  Second argument is the velocity file.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    velocity_file = input ( '  Enter the name of the velocity file.' );
  end
%
%  Third argument is the scale.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    scale = input ( '  Enter the vector scale factor or 0 for autoscaling.' );
  end
%
%  Fourth argument is the number of grid points.
%
  if ( nargin < 4 )
    fprintf ( 1, '\n' );
    number = input ( '  Enter the number of grid points in one dimension.' );
  end
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read (  node_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_file );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRECTION_ARROWS_GRID - Fatal error!\n' );
    fprintf ( 1, '  Node data must have spatial dimension 2.\n' );
    error ( 'DIRECTION_ARROWS_GRID - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_file, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_file );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, 2, 5, ...
    '  2 by 5 portion of data read from file:' );
%
%  Read the velocity data.
%
  [ velocity_order, node_num2 ] = r8mat_header_read ( velocity_file );

  if ( velocity_order ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRECTION_ARROWS_GRID - Fatal error!\n' );
    fprintf ( 1, '  The velocity file must list pairs of numbers.\n' );
    error ( 'DIRECTION_ARROWS_GRID - Fatal error!' );
  end

  if ( node_num2 ~= node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRECTION_ARROWS_GRID - Fatal error!\n' );
    fprintf ( 1, '  The number of velocities and the number of nodes do not match.\n' );
    error ( 'DIRECTION_ARROWS_GRID - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', velocity_file );

  uv = r8mat_data_read ( velocity_file, velocity_order, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', velocity_file );

  r8mat_transpose_print_some ( 2, node_num, uv, ...
    1, 1, 2, 10, '  Portion of velocity array:' );
%
%  Determine the rectangle that contains the data.
%
  xlo = min ( node_xy(1,:) );
  xhi = max ( node_xy(1,:) );
  ylo = min ( node_xy(2,:) );
  yhi = max ( node_xy(2,:) );
%
%  Determine the coordinates of the grid points.
%
  if ( number <= 1 )

    x_vec = 0.5 * ( xlo + xhi );
    y_vec = 0.5 * ( ylo + yhi );

  elseif ( yhi - ylo < xhi - xlo ) then

    number_x = number;

    inc = ( xhi - xlo ) / ( number_x - 1 );

    number_y = ( round ( yhi - ylo ) / inc );
    yfrac = 0.5 * ( ( yhi - ylo ) - number_y * inc );

    x_vec = xlo         : inc : xhi;
    y_vec = ylo + yfrac : inc : yhi - yfrac;

  else

    number_y = number;

    inc = ( yhi - ylo ) / ( number_y - 1 );

    number_x = ( round ( xhi - xlo ) / inc );
    xfrac = 0.5 * ( ( xhi - xlo ) - number_x * inc );

    x_vec = xlo + xfrac : inc : xhi - xfrac;
    y_vec = ylo         : inc : yhi;

  end
%
%  Create the grid points from the X and Y coordinates.
%  Create the U and V grid values by interpolation of the scattered data.
%
  [ x_grid, y_grid ] = meshgrid ( x_vec, y_vec );

  u_grid = griddata ( node_xy(1,:), node_xy(2,:), uv(1,:), ...
    x_grid, y_grid, 'cubic' );

  v_grid = griddata ( node_xy(1,:), node_xy(2,:), uv(2,:), ...
    x_grid, y_grid, 'cubic' );
%
%  Normalize the velocity vectors.
%
  uv_norm(:,:) = sqrt ( u_grid(:,:).^2 + v_grid(:,:).^2 );
  ij = find ( 0 < uv_norm );
  u_grid(ij) = u_grid(ij) ./ uv_norm(ij);
  v_grid(ij) = v_grid(ij) ./ uv_norm(ij);
%
%  Make a direction plot using the grid data.
%
  quiver ( x_grid, y_grid, u_grid, v_grid, scale )

  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( 'Direction Vectors', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  axis square

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIRECTION_ARROWS_GRID:\n' );
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
