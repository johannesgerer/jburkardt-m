function hcell_contour_display ( node_xy_file_name, p_file_name )

%*****************************************************************************80
%
%% HCELL_CONTOUR_DISPLAY displays a contour plot for the H-Cell problem.
%
%  Discussion:
%
%    This function reads the H-Cell flow data for a single timestep:
%
%      geometry ( X, Y values at the 3-node triangle nodes);
%      pressure ( or any corresponding scalar quantity.)
%
%    It could also handle the pair
%
%      geometry ( X, Y values at the 6-node triangle nodes);
%      velocity norm ( calculated externally and stored in a file)
%
%    The data is arranged to suit a call to MATLAB's CONTOURF routine.
%
%  Usage:
%
%    hcell_contour_display ( node_xy_file_name, p_file_name )
%
%    A typical invocation might be
%
%      hcell_contour_display ( 'xy3.txt', 'p000.txt' )
%
%    But if you simply say 
%
%      hcell_contour_display
%
%    the program will give you a chance to enter the file names
%    interactively.
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
%    Input, NODE_XY_FILE_NAME, the name of the file containing the
%    coordinates of the nodes.
%
%    Input, P_FILE_NAME, the name of the file containing the values of
%    the scalar quantity (such as pressure) at the nodes.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_CONTOUR_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  Display scalar data contours in the HCELL problem.\n' );
%
%  Do we have the XY file?
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCELL_CONTOUR_DISPLAY:\n' );
    node_xy_file_name = input ( 'Enter the name of the XY coordinate file:' );

  end
  
  [ m1, n1 ] = r8mat_header_read ( node_xy_file_name );

  node_xy = r8mat_data_read ( node_xy_file_name, m1, n1 );
%
%  Do we have the P file?
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCELL_CONTOUR_DISPLAY:\n' );
    p_file_name = input ( 'Enter the name of the scalar (pressure?) file:' );

  end
  
  p = table_read ( p_file_name );
  
  [ m2, n2 ] = size ( p );
%
%  Make sure the number of coordinates and values match.
%
  if ( n1 ~= n2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCELL_CONTOUR_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The number of coordinates is %d\n', n1 );
    fprintf ( 1, '  but the number of pressure values is %d\n', n2 );
    return
  end
%
%  Our X, Y data is logically rectangular, with some holes.
%  CONTOURF requires 2D arrays, with no holes.
%  Figure out the number of rows and columns, 
%  construct the data, and fill in the holes.
%
  x = sort ( node_xy(1,1:n1) );
  x_tol = 0.0001 * ( x(n1) - x(1) );
  [ n, x_unique ] = r8vec_sorted_unique ( n1, x, x_tol );
  
  y = sort ( node_xy(2,1:n1) );
  y_tol = 0.0001 * ( y(n1) - y(1) );
  [ m, y_unique ] = r8vec_sorted_unique ( n1, y, y_tol );

  [ x_grid, y_grid ] = meshgrid ( x_unique, y_unique );

  p_min = min ( p(1,1:n2) );
  p_max = max ( p(1,1:n2) );

  z_grid(1:m,1:n) = p_min + ( p_min - p_max );
  z_grid(1:m,1:n) = NaN;
%
%  For each computational node, copy the value of P into the array.
%
  for k = 1 : n1
    i = r8vec_sorted_nearest ( n, x_unique, node_xy(1,k) );
    j = r8vec_sorted_nearest ( m, y_unique, node_xy(2,k) );
    z_grid(j,i) = p(k);
  end
%
%  Set the contour levels evenly spaced between P_MIN and P_MAX.
%
  level_num = 15;
  
  for level = 1 : level_num
    level_value(i) = ( ( 2 * level_num  - 2 * level + 1 ) * p_min  ...
                    + (                  2 * level - 1 ) * p_max ) ...
                    / ( 2 * level_num );
  end

   [ C1, h1 ] = contourf ( x_unique, y_unique, z_grid, 15 );
   colorbar;
   axis equal;
% [ C1, h1 ] = contourf ( x_grid, y_grid, z_grid, level_value );
%
%  Add the boundary of the region to the plot.
%
  hcell_boundary_add ( 'r' )
%
%  Add the invisible bounding box.
%
  hcell_box_add ( 'w' )
%
%  Set up a colormap.
%
  colormap ( jet );
%
%  Label the axes and the plot.
%
  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( 'Pressure Contours', 'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_CONTOUR_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1,'\n' );
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
function hcell_box_add ( box_color )

%*****************************************************************************80
%
%% HCELL_BOX_ADD adds a box around the HCELL region.
%
%  Discussion:
%
%    This routine can only ADD graphics to an already existing plot.
%    So call PLOT first and then this routine.
%
%    The box is normally drawn with the color white ('w').
%    In this case, it doesn't actually appear on the screen.
%    However, it does force MATLAB to make the picture bigger,
%    giving us space to write some titles.
%
%  Usage:
%
%    hcell_box_add ( box_color )
%
%    A typical invocation might be
%
%      hcell_box_add ( 'w' )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character BOX_COLOR, the color to be used to draw the box.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOX_ADD:\n' );
  fprintf ( 1, '  Add a bounding box to a plot of the HCELL problem.\n' );
%
%  Do we have a color?
%
  if ( nargin < 1 )
    box_color = 'w'
  end
%
%  Set the coordinates of the invisible bounding box that
%  allows us to display the file name within the plot area.
%
  box_x = [ -5.00,  110.00, 110.00, -5.00, -5.00 ];
  box_y = [ -5.00,   -5.00, 21.00,  21.00, -5.00 ];

  line ( box_x, box_y, 'color', box_color )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOX_ADD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

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
function index = r8vec_sorted_nearest ( n, a, value )

%*****************************************************************************80
%
%% R8VEC_SORTED_NEAREST returns the nearest element in a sorted R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), a sorted vector.
%
%    Input, real VALUE, the value whose nearest vector entry is sought.
%
%    Output, integer INDEX, the index of the nearest
%    entry in the vector.
%
  if ( n < 1 )
    index = -1;
    return
  end

  if ( n == 1 )
    index = 1;
    return
  end

  if ( a(1) < a(n) )

    if ( value < a(1) )
      index = 1;
      return
    elseif ( a(n) < value )
      index = n;
      return
    end
%
%  Seek an interval containing the value.
%
    lo = 1;
    hi = n;

    while ( lo < hi - 1 )

      mid = floor ( ( lo + hi ) / 2 );

      if ( value == a(mid) )
        index = mid;
        return
      elseif ( value < a(mid) )
        hi = mid;
      else
        lo = mid;
      end

    end
%
%  Take the nearest.
%
    if ( abs ( value - a(lo) ) < abs ( value - a(hi) ) )
      index = lo;
    else
      index = hi;
    end

    return
%
%  A descending sorted vector A.
%
  else

    if ( value < a(n) )
      index = n;
      return
    elseif ( a(1) < value )
      index = 1;
      return
    end
%
%  Seek an interval containing the value.
%
    lo = n;
    hi = 1;

    while ( lo < hi - 1 )

      mid = floor ( ( lo + hi ) / 2 );

      if ( value == a(mid) )
        index = mid;
        return
      elseif ( value < a(mid) )
        hi = mid;
      else
        lo = mid;
      end

    end
%
%  Take the nearest.
%
    if ( abs ( value - a(lo) ) < abs ( value - a(hi) ) )
      index = lo;
    else
      index = hi;
    end

    return

  end

  return
end
function [ n_unique, a_unique ] = r8vec_sorted_unique ( n, a, tol )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE finds the unique elements in a sorted R8VEC.
%
%  Discussion:
%
%    Because real numbers are being compared, it is sometimes desirable
%    to allow a positive tolerance for equality.  This can be done by
%    resetting the internal variable TOL to a positive value.
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
%    Input, integer N, the number of elements in A.
%
%    Input, real A(N), the sorted integer array.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer N_UNIQUE, the number of unique elements in A.
%
%    Output, real A_UNIQUE[N_UNIQUE], the unique elements.
%
  n_unique = 0;
  a_unique = [];

  if ( n <= 0 )
    return;
  end

  n_unique = 1;
  a_unique = [ a_unique a(1) ];

  for i = 2 : n

    if ( tol < abs ( a(i) - a_unique(n_unique) ) )
      n_unique = n_unique + 1;
      a_unique = [ a_unique a(i) ];
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
