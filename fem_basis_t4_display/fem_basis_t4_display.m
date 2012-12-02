function fem_basis_t4_display ( prefix )

%*****************************************************************************80
%
%% FEM_BASIS_T4_DISPLAY displays a finite element T6 basis.
%
%  Discussion:
%
%    This program reads a data file defining a set of nodes, and a
%    data file defining the triangulation of those nodes using 4 node triangles.
%
%    The first three nodes are the vertices of the triangle; the fourth
%    node is the centroid (the average of the first three).
%
%    The program then asks the user interactively to select one of the
%    nodes.  It computes the basis function associated with that node
%    and displays it over the entire mesh.  Of course, the basis function
%    will only be nonzero over a small number of the elements, but it
%    is instructive to see the entire mesh.
%
%    The display is initially "flat", but by using the manipulator
%    on the graphics menu, the user can easily get some dramatic images
%    of the basis function.
%
%  Usage:
%
%    fem_basis_t3_display ( 'prefix' )
%
%    where 'prefix' is the common prefix for the FEM files:
%
%    * 'prefix'_nodes.txt,    the node coordinates.
%    * 'prefix'_elements.txt, the nodes that make up each element;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_T4_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display basis functions associated with \n' );
  fprintf ( 1, '  a finite element grid of T4 triangles.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program reads two files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * node_file,     the node file,\n' );
  fprintf ( 1, '  * element_file,  the element file,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies a basis function by node index,\n' );
  fprintf ( 1, '  and the program displays a surface plot of that basis function.\n' );
  fprintf ( 1, '  (Use the 3D ROTATE option to see the full picture!\n' );
%
%  Get the prefix if missing.
%
  if ( nargin < 1 )
    prefix = input ( '  Enter the common file prefix:  ' );
  end
%
%  Construct the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the nodes.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM_BASIS_T4_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension is not 2.\n' );
    error ( 'FEM_BASIS_T4_DISPLAY - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );
%
%  Read the elements.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  if ( element_order ~= 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM_BASIS_T4_DISPLAY\n' );
    fprintf ( 1, '  This program requires that the elements have order 3.\n' );
    fprintf ( 1, '  Your elements have order %d\n', element_order );
    error ( 'FEM_BASIS_T4_DISPLAY - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  x_min = min ( node_xy(1,:) );
  x_max = max ( node_xy(1,:) );
  y_min = min ( node_xy(2,:) );
  y_max = max ( node_xy(2,:) );

  node_min = min ( min ( element_node ) );
  node_max = max ( max ( element_node ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Every basis function is associated with a node.\n' );
  fprintf ( 1, '  To chooose a basis function, you specify a node.\n' );
  fprintf ( 1, '  Nodes range in value from %d to %d.\n', node_min, node_max );
  
  while ( 1 )

    fprintf ( 1, '\n' );
    prompt = sprintf ( 'Enter a node between %d and %d: ', node_min, node_max );
    node_index = input ( prompt );

    if ( node_index < node_min | node_max < node_index )
      break
    end
%
%  Clear the graphics page.
%
    clf
  
    fprintf ( 1, '\n' );
  
    z_min = 0.0;
    z_max = 0.0;

    for element = 1 : element_num

      pt(1,1:4) = node_xy(1,element_node(1:4,element)); 
      pt(2,1:4) = node_xy(2,element_node(1:4,element));

      local = 0;
      for j = 1 : element_order
        if ( element_node(j,element) == node_index )
          local = j;
          fprintf ( 1, '  Node %d occurs as local node %d in element %d.\n', ...
            node_index, j, element );
        end 
      end
%
%  If the node is not part of this element, we can draw the zero patch easily.
%
      if ( local == 0 )

        x = zeros(2,2);
        y = zeros(2,2);
        z = zeros(2,2);

        x(1,1) = pt(1,1);
        y(1,1) = pt(2,1);
        x(2,1) = pt(1,1);
        y(2,1) = pt(2,1);
        x(1,2) = pt(1,2);
        y(1,2) = pt(2,2);
        x(2,2) = pt(1,3);
        y(2,2) = pt(2,3);
%
%  If the node is part of this element, then we want to use an 11x11 grid of points
%  to sample the (reference) element and generate data for a smooth surface.
%
      else

        x = zeros(11,11);
        y = zeros(11,11);
        z = zeros(11,11);

        for i = 0 : 10
%
%  To use SURFACE, we need to define a logical rectangular grid of points.
%  But our region is a triangle, so the easiest thing to do is to identify
%  two corners of the grid.  
%  We try to do this in such a way that the same thing happens in each
%  element, and the resulting grid looks less haphazard.
%
          if ( local == 1 )
            xlo = ( ( 10 - i ) * pt(1,1) + i * pt(1,2) ) / 10;
            ylo = ( ( 10 - i ) * pt(2,1) + i * pt(2,2) ) / 10;
            xhi = ( ( 10 - i ) * pt(1,1) + i * pt(1,3) ) / 10;
            yhi = ( ( 10 - i ) * pt(2,1) + i * pt(2,3) ) / 10;
          elseif ( local == 2 )
            xlo = ( ( 10 - i ) * pt(1,2) + i * pt(1,1) ) / 10;
            ylo = ( ( 10 - i ) * pt(2,2) + i * pt(2,1) ) / 10;
            xhi = ( ( 10 - i ) * pt(1,2) + i * pt(1,3) ) / 10;
            yhi = ( ( 10 - i ) * pt(2,2) + i * pt(2,3) ) / 10;
          elseif ( local == 3 )
            xlo = ( ( 10 - i ) * pt(1,3) + i * pt(1,2) ) / 10;
            ylo = ( ( 10 - i ) * pt(2,3) + i * pt(2,2) ) / 10;
            xhi = ( ( 10 - i ) * pt(1,3) + i * pt(1,1) ) / 10;
            yhi = ( ( 10 - i ) * pt(2,3) + i * pt(2,1) ) / 10;
          elseif ( local == 4 )
            xlo = ( ( 10 - i ) * pt(1,1) + i * pt(1,2) ) / 10;
            ylo = ( ( 10 - i ) * pt(2,1) + i * pt(2,2) ) / 10;
            xhi = ( ( 10 - i ) * pt(1,1) + i * pt(1,3) ) / 10;
            yhi = ( ( 10 - i ) * pt(2,1) + i * pt(2,3) ) / 10;
          end 

          for j = 0 : 10

            pp(1) = ( ( 10 - j ) * xlo + j * xhi ) / 10;
            pp(2) = ( ( 10 - j ) * ylo + j * yhi ) / 10;
          
            zz = basis_11_t4 ( pt, local, pp );

            z_min = min ( z_min, zz );
            z_max = max ( z_max, zz );

            x(i+1,j+1) = pp(1);
            y(i+1,j+1) = pp(2);
            z(i+1,j+1) = zz;

          end
        end

      end

      caxis ( 'auto' )
     
      surface ( x, y, z, 'FaceColor', 'interp' )

    end
%
%  Using SHADING FACETED draws nice little boundary lines between each patch.
%  However, the way we draw the basis function means that that surface is simply
%  covered in black lines, losing all the color information.
%
%  SHADING INTERP loses the little boundary lines, but allows the color information
%  to be seen.
%
%  You have your clumsy choice of ONE or THE OTHER.
%
%   shading faceted;
    shading interp;

    axis ( [ x_min, x_max, y_min, y_max, z_min, z_max ] );
    axis equal

    xlabel ( '--X axis--' )
    ylabel ( '--Y axis--' )
    zlabel ( '--Z axis--' )

    title_string = sprintf ( 'T4 basis function for node %d', node_index );
    title ( title_string );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %f <= Z <= %f\n', z_min, z_max );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_T4_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ phi, dphidx, dphidy ] = basis_11_t4 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T4: one basis at one point for a T4 element.
%
%  Discussion:
%
%    The T4 element is the cubic bubble triangle.
%
%    The routine is given the coordinates of the vertices of a triangle.
%    It works directly with these coordinates, and does not refer to a
%    reference element.
%
%    The sides of the triangle DO NOT have to lie along a coordinate
%    axis.
%
%    The routine evaluates the basis functions associated with each vertex,
%    and their derivatives with respect to X and Y.
%
%  Physical Element T4:
%
%            3
%           / \
%          /   \
%         /  4  \
%        /       \
%       1---------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,4), the coordinates of the vertices
%    of the triangle, and the coordinates of the centroid.
%    It is common to list the first three points in counter clockwise
%    order.
%
%    Input, integer I, the index of the basis function.
%
%    Input, real P(2), the points where the basis function
%    is to be evaluated.
%
%    Output, real PHI, the value of the basis function
%    at the evaluation point.
%
%    Output, real DPHIDX, DPHIDY, the value of the
%    derivatives at the evaluation point.
%
%  Local parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%
  area = t(1,1) * ( t(2,2) - t(2,3) ) ...
       + t(1,2) * ( t(2,3) - t(2,1) ) ...
       + t(1,3) * ( t(2,1) - t(2,2) );

  psi(1) =     (   ( t(1,3) - t(1,2) ) * ( p(2) - t(2,2) )     ...
                 - ( t(2,3) - t(2,2) ) * ( p(1) - t(1,2) ) );
  dpsidx(1) =    - ( t(2,3) - t(2,2) );
  dpsidy(1) =      ( t(1,3) - t(1,2) );

  psi(2) =     (   ( t(1,1) - t(1,3) ) * ( p(2) - t(2,3) )     ...
                 - ( t(2,1) - t(2,3) ) * ( p(1) - t(1,3) ) );
  dpsidx(2) =    - ( t(2,1) - t(2,3) );
  dpsidy(2) =      ( t(1,1) - t(1,3) );

  psi(3) =     (   ( t(1,2) - t(1,1) ) * ( p(2) - t(2,1) )     ...
                 - ( t(2,2) - t(2,1) ) * ( p(1) - t(1,1) ) );
  dpsidx(3) =    - ( t(2,2) - t(2,1) );
  dpsidy(3) =      ( t(1,2) - t(1,1) );
%
%  Normalize the first three functions.
%
  psi(1:3)    =    psi(1:3) / area;
  dpsidx(1:3) = dpsidx(1:3) / area;
  dpsidy(1:3) = dpsidy(1:3) / area;
%
%  Compute the cubic bubble function.
%
  psi(4) = 27.0D+00 * psi(1) * psi(2) * psi(3);

  dpsidx(4) = 27.0D+00 * ( ...
                dpsidx(1) *    psi(2) *    psi(3) ...
                +  psi(1) * dpsidx(2) *    psi(3) ...
                +  psi(1) *    psi(2) * dpsidx(3) );

  dpsidy(4) = 27.0D+00 * ( ...
                dpsidy(1) *    psi(2) *    psi(3) ...
                +  psi(1) * dpsidy(2) *    psi(3) ...
                +  psi(1) *    psi(2) * dpsidy(3) );
%
%  Subtract 1/3 of the cubic bubble function from each of the three linears.
%
  for j = 1 : 3
    psi(j)    =    psi(j) -    psi(4) / 3.0;
    dpsidx(j) = dpsidx(j) - dpsidx(4) / 3.0;
    dpsidy(j) = dpsidy(j) - dpsidy(4) / 3.0;
  end

  phi    = psi(i);
  dphidx = dpsidx(i);
  dphidy = dpsidy(i);

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
function value = i4_modp ( i, j )

%*****************************************************************************80
%
%% I4_MODP returns the nonnegative remainder of I4 division.
%
%  Discussion:
%
%    If
%      NREM = I4_MODP ( I, J )
%      NMULT = ( I - NREM ) / J
%    then
%      I = J * NMULT + NREM
%    where NREM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, I4_MODP(A,360) is between 0 and 360, always.
%
%  Example:
%
%        I     J     MOD  I4_MODP    Factorization
%
%      107    50       7       7    107 =  2 *  50 + 7
%      107   -50       7       7    107 = -2 * -50 + 7
%     -107    50      -7      43   -107 = -3 *  50 + 43
%     -107   -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be divided.
%
%    Input, integer J, the number that divides I.
%
%    Output, integer VALUE, the nonnegative remainder when I is
%    divided by J.
%
  if ( j == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODP - Fatal error!\n' );
    fprintf ( 1, '  Illegal divisor J = %d\n', j );
    error ( 'I4_MODP - Fatal error!' );
  end

  value = mod ( i, j );

  if ( value < 0 )
    value = value + abs ( j );
  end

  return
end
function value = i4_wrap ( ival, ilo, ihi )

%*****************************************************************************80
%
%% I4_WRAP forces an integer to lie between given limits by wrapping.
%
%  Example:
%
%    ILO = 4, IHI = 8
%
%    I   Value
%
%    -2     8
%    -1     4
%     0     5
%     1     6
%     2     7
%     3     8
%     4     4
%     5     5
%     6     6
%     7     7
%     8     8
%     9     4
%    10     5
%    11     6
%    12     7
%    13     8
%    14     4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IVAL, an integer value.
%
%    Input, integer ILO, IHI, the desired bounds for the integer value.
%
%    Output, integer I4_WRAP, a "wrapped" version of IVAL.
%
  jlo = min ( ilo, ihi );
  jhi = max ( ilo, ihi );

  wide = jhi - jlo + 1;

  if ( wide == 1 )
    value = jlo;
  else
    value = jlo + i4_modp ( ival - jlo, wide );
  end

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
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
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%
  table = [];
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
    return;
  end

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
