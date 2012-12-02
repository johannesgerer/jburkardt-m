function hcell_vector_display ( node_xy_file_name, uv_file_name )

%*****************************************************************************80
%
%% HCELL_VECTOR_DISPLAY displays a vector field in the H-Cell.
%
%  Discussion:
%
%    This MATLAB function file reads the H-Cell flow data for a single timestep:
%
%      geometry (XY values at the 6-node triangle nodes) 
%      flow (UV values at nodes)
%
%    and plots the velocity vectors (U,V)(X,Y).
%
%    The file plots either the velocity vector field, or the velocity
%    direction field, depending on the value of the internal logical
%    parameter "normalized".
%
%    The MATLAB routine QUIVER internally scales the vectors, but this
%    can be adjusted by using a value of SCALE that is not 1.
%
%  Usage:
%
%    hcell_vector_display ( node_xy_file_name, uv_file_name )
%
%    A typical invocation might be
%
%      hcell_vector_display ( 'xy6.txt', 'uv000.txt' )
%
%    But if you simply say 
%
%      hcell_vector_display
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
%    27 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_XY_FILE_NAME, the name of a file containing the 
%    coordinates of the nodes.
%
%    Input, string UV_FILE_NAME, the name of a file containing the velocity
%    components for a flow in the H-CELL.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_VECTOR_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display a vector plot in the HCELL problem.\n' );

  FALSE = 0;
  TRUE = 1;
  scale = 1.0;
  normalized = TRUE;
%
%  Read the coordinates.
%
  if ( nargin < 1 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCELL_VECTOR_DISPLAY:\n' );
    node_xy_file_name = input ( 'Enter the name of the XY coordinate file:' );
  end

  [ m1, n1 ] = r8mat_header_read ( node_xy_file_name );

  node_xy = r8mat_data_read ( node_xy_file_name, m1, n1 );
%
%  Read the velocities.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HCELL_VECTOR_DISPLAY:\n' );
    uv_file_name = input ( 'Enter the name of the velocity file:' );
  end

  uv = table_read ( uv_file_name );
%
%  Do you want to normalize the velocities?
%
  if ( normalized == TRUE )
    norm = sqrt ( uv(1,:).^2 + uv(2,:).^2 );
    nonzero = find ( norm ~= 0.0 );
    uv(1,nonzero) = uv(1,nonzero) ./ norm(nonzero);
    uv(2,nonzero) = uv(2,nonzero) ./ norm(nonzero);
  end
%
%  Display the vector field.
%
  quiver ( node_xy(1,:), node_xy(2,:), uv(1,:), uv(2,:), scale )
%
%  Add the boundary of the region to the plot.
%
  hcell_boundary_add ( 'r' )
%
%  Draw the invisible bounding box.
%
  hcell_box_add ( 'w' )

  axis equal
  
  if ( normalized == TRUE )
    title ( 'H-Cell Direction Field' )
  else
    title ( 'H-Cell Flow Field' )
  end

  text ( 45.0, 20.0, uv_file_name )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_FLOW_DISPLAY:\n' );
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

