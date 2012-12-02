function tet_mesh_quality ( prefix )

%*****************************************************************************80
%
%% TET_MESH_QUALITY determines quality measures for a tet mesh.
%
%  Usage:
%
%    tet_mesh_quality ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains nodal coordinates;
%    * 'prefix'_elements.txt contains the element definitions;
%    * 'prefix'_quality.txt will contain the element qualities.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_QUALITY:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Compute tet mesh quality measures.\n' );
%
%  Argument 1 is the common file prefix.
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_QUALITY:\n' );
    prefix = input ( '  Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read (  node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  if ( dim_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_QUALITY - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 3.\n' );
    error ( 'TET_MESH_QUALITY - Fatal error!' );
  end

  node_xyz = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xyz, 1, 1, 5, 5, ...
    '  5 by 5 portion of data read from file:' );
%
%  Read the tetra data.
%
  [ tetra_order, tetra_num ] = i4mat_header_read ( element_filename );

  if ( tetra_order ~= 4 && tetra_order ~= 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_QUALITY - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 4-node or 10-node tet mesh.\n' );
    error ( 'TET_MESH_QUALITY - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron order = %d\n', tetra_order );
  fprintf ( 1, '  Number of tetras  = %d\n', tetra_num );

  tetra_node = i4mat_data_read ( element_filename, tetra_order, ...
    tetra_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', element_filename );

  i4mat_transpose_print_some ( tetra_order, tetra_num, ...
    tetra_node, 1, 1, tetra_order, 10, '  Portion of TETRA_NODE:' );
%
%  Detect and correct 0-based indexing.
%
  tetra_node = mesh_base_one ( node_num, tetra_order, tetra_num, ...
    tetra_node );
%
%  Compute and print the quality measures.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Measure     Minimum     Mean        Maximum     Variance\n' );
  fprintf ( 1, '\n' );

  [ value_min, value_mean, value_max, value_var ] = ...
    tet_mesh_quality1 ( node_xyz, tetra_num, ...
    tetra_node );

  fprintf ( 1, '        1  %10f  %10f  %10f  %10f\n', ...
    value_min, value_mean, value_max, value_var );

  [ value_min, value_mean, value_max, value_var ] = ...
    tet_mesh_quality2 ( node_xyz, tetra_num, ...
    tetra_node );

  fprintf ( 1, '        2  %10f  %10f  %10f  %10f\n', ...
    value_min, value_mean, value_max, value_var );

  [ value_min, value_mean, value_max, value_var ] = ...
    tet_mesh_quality3 ( node_xyz, tetra_num, ...
    tetra_node );

  fprintf ( 1, '        3  %10f  %10f  %10f  %10f\n', ...
    value_min, value_mean, value_max, value_var );

  [ value_min, value_mean, value_max, value_var ] = ...
    tet_mesh_quality4 ( node_xyz, tetra_num, ...
    tetra_node );

  fprintf ( 1, '        4  %10f  %10f  %10f  %10f\n', ...
    value_min, value_mean, value_max, value_var );

  [ value_min, value_mean, value_max, value_var ] = ...
    tet_mesh_quality5 ( node_xyz, tetra_num, ...
    tetra_node );

  fprintf ( 1, '        5  %10f  %10f  %10f  %10f\n', ...
    value_min, value_mean, value_max, value_var );

  node_order = tet_mesh_node_order ( tetra_order, tetra_num, tetra_node, ...
    node_num );

  histo_num = max ( node_order(1:node_num) );

  histo_gram = i4vec_histogram ( node_num, node_order, histo_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is a numerical histogram of the "order" of\n' );
  fprintf ( 1, '  each node in the mesh, that is, the number of\n' );
  fprintf ( 1, '  tetrahedrons that include that node as a vertex.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For a regular mesh, most nodes would have the\n' );
  fprintf ( 1, '  same order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Order  Number of Nodes\n' );
  fprintf ( 1, '\n' );

  for i = 0 : histo_num
    if ( histo_gram(i+1) ~= 0 )
      fprintf ( 1, '  %6d  %6d\n', i, histo_gram(i+1) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_QUALITY:\n' );
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
  table = zeros ( m, n );
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
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 10;

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
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function histo_gram = i4vec_histogram ( n, a, histo_num )

%*****************************************************************************80
%
%% I4VEC_HISTOGRAM computes a histogram of the elements of an I4VEC.
%
%  Discussion:
%
%    It is assumed that the entries in the vector A are nonnegative.
%    Only values between 0 and HISTO_NUM will be histogrammed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array to examine.
%
%    Input, integer HISTO_NUM, the maximum value for which a
%    histogram entry will be computed.
%
%    Output, integer HISTO_GRAM(1:HISTO_NUM+1), contains the number of
%    entries of A with the values of 0 through HISTO_NUM.
%
  histo_gram(1:histo_num+1) = 0;

  for i = 1 : n

    if ( 0 <= a(i) && a(i) <= histo_num )
      histo_gram(a(i)+1) = histo_gram(a(i)+1) + 1;
    end

  end

  return
end
function element_node = mesh_base_one ( node_num, element_order, ...
  element_num, element_node )

%*****************************************************************************80
%
%% MESH_BASE_ONE ensures that the element definition is one-based.
%
%  Discussion:
%
%    The ELEMENT_NODE array contains nodes indices that form elements.
%    The convention for node indexing might start at 0 or at 1.
%    Since a MATLAB program will naturally assume a 1-based indexing, it is
%    necessary to check a given element definition and, if it is actually
%    0-based, to convert it.
%
%    This function attempts to detect 0-based node indexing and correct it.
%
%    Thanks to Feifei Xu for pointing out that I was subtracting 1 when I
%    should have been adding 1!  29 November 2012.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDE,ELEMENT_NUM), the element
%    definitions.
%
  node_min = min ( min ( element_node(1:element_order,1:element_num) ) );
  node_max = max ( max ( element_node(1:element_order,1:element_num) ) );

  if ( node_min == 0 && node_max == node_num - 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
    fprintf ( 1, '  This will be converted to 1-based.\n' );
    element_node(1:element_order,1:element_num) = ...
      element_node(1:element_order,1:element_num) + 1;
  elseif ( node_min == 1 && node_max == node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
    fprintf ( 1, '  No conversion is necessary.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE - Warning!\n' );
    fprintf ( 1, '  The element indexing is not of a recognized type.\n' );
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
function det = r8mat_det_4d ( a )

%*****************************************************************************80
%
%% R8MAT_DET_4D computes the determinant of a 4 by 4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(4,4), the matrix whose determinant is desired.
%
%    Output, real DET, the determinant of the matrix.
%
  det = ...
      a(1,1) * ( ...
        a(2,2) * ( a(3,3) * a(4,4) - a(3,4) * a(4,3) ) ...
      - a(2,3) * ( a(3,2) * a(4,4) - a(3,4) * a(4,2) ) ...
      + a(2,4) * ( a(3,2) * a(4,3) - a(3,3) * a(4,2) ) ) ...
    - a(1,2) * ( ...
        a(2,1) * ( a(3,3) * a(4,4) - a(3,4) * a(4,3) ) ...
      - a(2,3) * ( a(3,1) * a(4,4) - a(3,4) * a(4,1) ) ...
      + a(2,4) * ( a(3,1) * a(4,3) - a(3,3) * a(4,1) ) ) ...
    + a(1,3) * ( ...
        a(2,1) * ( a(3,2) * a(4,4) - a(3,4) * a(4,2) ) ...
      - a(2,2) * ( a(3,1) * a(4,4) - a(3,4) * a(4,1) ) ...
      + a(2,4) * ( a(3,1) * a(4,2) - a(3,2) * a(4,1) ) ) ...
    - a(1,4) * ( ...
        a(2,1) * ( a(3,2) * a(4,3) - a(3,3) * a(4,2) ) ...
      - a(2,2) * ( a(3,1) * a(4,3) - a(3,3) * a(4,1) ) ...
      + a(2,3) * ( a(3,1) * a(4,2) - a(3,2) * a(4,1) ) );

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
function [ a, info ] = r8mat_solve ( n, nrhs, a )

%*****************************************************************************80
%
%% R8MAT_SOLVE uses Gauss-Jordan elimination to solve an N by N linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer NRHS, the number of right hand sides.  NRHS
%    must be at least 0.
%
%    Input, real A(N,N+NRHS), contains in rows and
%    columns 1 to N the coefficient matrix, and in columns N+1 through
%    N+NRHS, the right hand sides.
%
%    Output, real A(N,N+NRHS), the coefficient matrix
%    area has been destroyed, while the right hand sides have
%    been overwritten with the corresponding solutions.
%
%    Output, integer INFO, singularity flag.
%    0, the matrix was not singular, the solutions were computed;
%    J, factorization failed on step J, and the solutions could not
%    be computed.
%
  info = 0;

  for j = 1 : n
%
%  Choose a pivot row IPIVOT.
%
    ipivot = j;
    apivot = a(j,j);

    for i = j+1 : n
      if ( abs ( apivot ) < abs ( a(i,j) ) )
        apivot = a(i,j);
        ipivot = i;
      end
    end

    if ( apivot == 0.0 )
      info = j;
      return;
    end
%
%  Interchange.
%
    temp               = a(ipivot,1:n+nrhs);
    a(ipivot,1:n+nrhs) = a(j,     1:n+nrhs);
    a(j,     1:n+nrhs) = temp;
%
%  A(J,J) becomes 1.
%
    a(j,j) = 1.0;
    a(j,j+1:n+nrhs) = a(j,j+1:n+nrhs) / apivot;
%
%  A(I,J) becomes 0.
%
    for i = 1 : n

      if ( i ~= j )

        factor = a(i,j);
        a(i,j) = 0.0;
        a(i,j+1:n+nrhs) = a(i,j+1:n+nrhs) - factor * a(j,j+1:n+nrhs);

      end

    end

  end

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
function v3 = r8vec_cross_3d ( v1, v2 )

%*****************************************************************************80
%
%% R8VEC_CROSS_3D computes the cross product of two R8VEC's in 3D.
%
%  Discussion:
%
%    The cross product in 3D can be regarded as the determinant of the
%    symbolic matrix:
%
%          |  i  j  k |
%      det | x1 y1 z1 |
%          | x2 y2 z2 |
%
%      = ( y1 * z2 - z1 * y2 ) * i
%      + ( z1 * x2 - x1 * z2 ) * j
%      + ( x1 * y2 - y1 * x2 ) * k
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), the two vectors.
%
%    Output, real V3(3), the cross product vector.
%
  v3(1) = v1(2) * v2(3) - v1(3) * v2(2);
  v3(2) = v1(3) * v2(1) - v1(1) * v2(3);
  v3(3) = v1(1) * v2(2) - v1(2) * v2(1);

  return
end
function value = r8vec_length ( dim_num, x )

%*****************************************************************************80
%
%% R8VEC_LENGTH returns the Euclidean length of an R8VEC
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real X(DIM_NUM), the vector.
%
%    Output, real VALUE, the Euclidean length of the vector.
%
  value = sqrt ( sum ( ( x(1:dim_num) ).^2 ) );

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
function node_order = tet_mesh_node_order ( tetra_order, tetra_num, ...
  tetra_node, node_num )

%*****************************************************************************80
%
%% TET_MESH_NODE_ORDER: determines the order of nodes.
%
%  Discussion:
%
%    The order of a node is the number of tetrahedrons that use that node
%    as a vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the nodes
%    that make up the tetrahedrons.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_ORDER(NODE_NUM), the order of each node.
%
  node_order(1:node_num) = 0;

  for tetra = 1 : tetra_num
    for i = 1 : tetra_order
      node = tetra_node(i,tetra);
      if ( node < 1 || node_num < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TET_MESH_NODE_ORDER - Fatal error!\n' );
        fprintf ( 1, '  Illegal entry in TETRA_NODE.\n' );
        error ( 'TET_MESH_NODE_ORDER - Fatal error!' );
      else
        node_order(node) = node_order(node) + 1;
      end
    end
  end

  return
end
function [ value_min, value_mean, value_max, value_var ] = ...
 tet_mesh_quality1 ( node_xyz, tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_QUALITY1 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the minimum of the
%    corresponding tetrahedron quality measure, over all tetrahedrons in the
%    tet mesh.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, double NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, double VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;
  tetrahedron_quality = zeros ( tetra_num, 1 );
  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_quality1_3d ( tetrahedron );

  end

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end
function [ value_min, value_mean, value_max, value_var ] = ...
  tet_mesh_quality2 ( node_xyz, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
%% TET_MESH_QUALITY2 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the minimum of the
%    corresponding tetrahedron quality measure, over all tetrahedrons in the
%    tet mesh.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, real VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;
  tetrahedron_quality = zeros ( tetra_num, 1 );
  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_quality2_3d ( tetrahedron );

  end

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end
function [ value_min, value_mean, value_max, value_var ] = ...
  tet_mesh_quality3 ( node_xyz, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
%% TETRAS_QUALITY3 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the minimum of the
%    corresponding tetrahedron quality measure, over all tetrahedrons in the
%    tet mesh.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, double NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, double VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;
  tetrahedron_quality = zeros ( tetra_num, 1 );
  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_quality3_3d ( tetrahedron );

  end

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end
function [ value_min, value_mean, value_max, value_var ] = ...
  tet_mesh_quality4 ( node_xyz, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
%% TET_MESH_QUALITY4 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the minimum of the
%    corresponding tetrahedron quality measure, over all tetrahedrons in the
%    tet mesh.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, real VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;
  tetrahedron_quality = zeros ( tetra_num, 1 );
  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_quality4_3d ( tetrahedron );

  end

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end
function [ value_min, value_mean, value_max, value_var ] = ...
  tet_mesh_quality5 ( node_xyz, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
%% TET_MESH_QUALITY5 returns a tet mesh quality factor.
%
%  Discussion:
%
%    The tet mesh quality measure is the ratio of the minimum
%    tetrahedron volume to the maximum tetrahedron volume.
%
%    This routine is designed for an order-4 tet mesh.  Order 10 tet meshes
%    may be input, but the extra nodes are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the nodes.
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the indices of the nodes
%    that make up the tetrahedrons.
%
%    Output, real VALUE_MIN, VALUE_MEAN, VALUE_MAX, VALUE_VAR,
%    the minimum, mean, maximum and variance of the quality measure.
%
  dim_num = 3;
  tetrahedron_quality = zeros ( tetra_num, 1 );
  
  for tetra = 1 : tetra_num

    tetrahedron(1:dim_num,1:4) = node_xyz(1:dim_num,tetra_node(1:4,tetra));

    tetrahedron_quality(tetra) = tetrahedron_volume_3d ( tetrahedron );

  end

  volume_max = max ( tetrahedron_quality(1:tetra_num) );

  tetrahedron_quality(1:tetra_num) = tetrahedron_quality(1:tetra_num) ...
    / volume_max;

  value_max  = max  ( tetrahedron_quality(1:tetra_num) );
  value_min  = min  ( tetrahedron_quality(1:tetra_num) );
  value_mean = mean ( tetrahedron_quality(1:tetra_num) );
  value_var  = var  ( tetrahedron_quality(1:tetra_num) );

  return
end
function [ r, center ] = tetrahedron_circumsphere_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_CIRCUMSPHERE_3D computes the circumsphere of a tetrahedron in 3D.
%
%  Discussion:
%
%    The circumsphere, or circumscribed sphere, of a tetrahedron is the sphere that
%    passes through the four vertices.  The circumsphere is not necessarily
%    the smallest sphere that contains the tetrahedron.
%
%    Surprisingly, the diameter of the sphere can be found by solving
%    a 3 by 3 linear system.  This is because the vectors P2 - P1,
%    P3 - P1 and P4 - P1 are secants of the sphere, and each forms a
%    right triangle with the diameter through P1.  Hence, the dot product of
%    P2 - P1 with that diameter is equal to the square of the length
%    of P2 - P1, and similarly for P3 - P1 and P4 - P1.  This determines
%    the diameter vector originating at P1, and hence the radius and
%    center.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real R, CENTER(3), the center of the
%    circumscribed sphere, and its radius.  If the linear system is
%    singular, then R = -1, CENTER(1:3) = 0.
%
  dim_num = 3;
  nrhs = 1;
%
%  Set up the linear system.
%
  a(1:dim_num,1:3) = ( tetra(1:dim_num,2:4) )';

  for j = 1 : dim_num
    a(1:dim_num,j) = a(1:dim_num,j) - tetra(j,1);
  end

  for i = 1 : dim_num
    a(i,4) = sum ( a(i,1:3).^2 );
  end
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, nrhs, a );
%
%  If the system was singular, return a consolation prize.
%
  if ( info ~= 0 )
    r = -1.0;
    center(1:dim_num) = 0.0;
    return
  end
%
%  Compute R, X, Y, Z.
%
  r = 0.5 * sqrt ( sum ( a(1:dim_num,dim_num+1).^2 ) );

  center(1:dim_num) = tetra(1:dim_num,1) + 0.5 * a(1:dim_num,dim_num+1);

  return
end
function edge_length = tetrahedron_edge_length_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_EDGE_LENGTH_3D returns edge lengths of a tetrahedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real EDGE_LENGTH(6,1), the length of the edges.
%
  dim_num = 3;
  edge_length = zeros ( 6, 1 );
  k = 0;
  for j1 = 1 : 3
    for j2 = j1+1 : 4
      k = k + 1;
      edge_length(k) = r8vec_length ( dim_num, ...
        tetra(1:dim_num,j2) - tetra(1:dim_num,j1) );
    end
  end

  return
end
function [ r, pc ] = tetrahedron_insphere_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_INSPHERE_3D finds the insphere of a tetrahedron in 3D.
%
%  Discussion:
%
%    The insphere of a tetrahedron is the inscribed sphere, which touches
%    each face of the tetrahedron at a single point.
%
%    The points of contact are the centroids of the triangular faces
%    of the tetrahedron.  Therefore, the point of contact for a face
%    can be computed as the average of the vertices of that face.
%
%    The sphere can then be determined as the unique sphere through
%    the four given centroids.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Eberly,
%    Centers of a Simplex,
%    http://www.geometrictools.com
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real R, PC(3), the radius and the center
%    of the sphere.
%
  dim_num = 3;

  v21(1:dim_num) = tetra(1:dim_num,2) - tetra(1:dim_num,1);
  v31(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,1);
  v41(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,1);
  v32(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,2);
  v42(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,2);
% v43(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,3);

  n123 = r8vec_cross_3d ( v21, v31 );
  n124 = r8vec_cross_3d ( v41, v21 );
  n134 = r8vec_cross_3d ( v31, v41 );
  n234 = r8vec_cross_3d ( v42, v32 );

  l123 = r8vec_length ( dim_num, n123 );
  l124 = r8vec_length ( dim_num, n124 );
  l134 = r8vec_length ( dim_num, n134 );
  l234 = r8vec_length ( dim_num, n234 );

  pc(1:dim_num) = ( l234 * tetra(1:dim_num,1)   ...
                  + l134 * tetra(1:dim_num,2)   ...
                  + l124 * tetra(1:dim_num,3)   ...
                  + l123 * tetra(1:dim_num,4) ) ...
                / ( l234 + l134 + l124 + l123 );

  b(1:dim_num,1:4) = tetra(1:dim_num,1:4);
  b(4,1:4) = 1.0;

  gamma = abs ( r8mat_det_4d ( b ) );

  r = gamma / ( l234 + l134 + l124 + l123 );

  return
end
function quality = tetrahedron_quality1_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY1_3D: "quality" of a tetrahedron in 3D.
%
%  Discussion:
%
%    The quality of a tetrahedron is 3.0 times the ratio of the radius of
%    the inscribed sphere divided by that of the circumscribed sphere.
%
%    An equilateral tetrahredron achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real QUALITY, the quality of the tetrahedron.
%
  r_out = tetrahedron_circumsphere_3d ( tetra );

  r_in = tetrahedron_insphere_3d ( tetra );

  quality = 3.0 * r_in / r_out;

  return
end
function quality2 = tetrahedron_quality2_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY2_3D: "quality" of a tetrahedron in 3D.
%
%  Discussion:
%
%    The quality measure #2 of a tetrahedron is:
%
%      QUALITY2 = 2 * sqrt ( 6 ) * RIN / LMAX
%
%    where
%
%      RIN = radius of the inscribed sphere;
%      LMAX = length of longest side of the tetrahedron.
%
%    An equilateral tetrahredron achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du, Desheng Wang,
%    The Optimal Centroidal Voronoi Tesselations and the Gersho's
%    Conjecture in the Three-Dimensional Space,
%    Computers and Mathematics with Applications,
%    Volume 49, 2005, pages 1355-1373.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real QUALITY2, the quality of the tetrahedron.
%
  edge_length(1:6) = tetrahedron_edge_length_3d ( tetra );;

  l_max = max ( edge_length(1:6) );

  r_in = tetrahedron_insphere_3d ( tetra );

  quality2 = 2.0 * sqrt ( 6.0 ) * r_in / l_max;

  return
end
function quality3 = tetrahedron_quality3_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY3_3D computes the mean ratio of a tetrahedron.
%
%  Discussion:
%
%    This routine computes QUALITY3, the eigenvalue or mean ratio of
%    a tetrahedron.
%
%      QUALITY3 = 12 * ( 3 * volume )**(2/3) / (sum of square of edge lengths).
%
%    This value may be used as a shape quality measure for the tetrahedron.
%
%    For an equilateral tetrahedron, the value of this quality measure
%    will be 1.  For any other tetrahedron, the value will be between
%    0 and 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real QUALITY3, the mean ratio of the tetrahedron.
%
  dim_num = 3;
%
%  Compute the vectors representing the sides of the tetrahedron.
%
  ab(1:3) = tetra(1:3,2) - tetra(1:3,1);
  ac(1:3) = tetra(1:3,3) - tetra(1:3,1);
  ad(1:3) = tetra(1:3,4) - tetra(1:3,1);
  bc(1:3) = tetra(1:3,3) - tetra(1:3,2);
  bd(1:3) = tetra(1:3,4) - tetra(1:3,2);
  cd(1:3) = tetra(1:3,4) - tetra(1:3,3);
%
%  Compute the squares of the lengths of the sides.
%
  lab = sum ( ab(1:dim_num).^2 );
  lac = sum ( ac(1:dim_num).^2 );
  lad = sum ( ad(1:dim_num).^2 );
  lbc = sum ( bc(1:dim_num).^2 );
  lbd = sum ( bd(1:dim_num).^2 );
  lcd = sum ( cd(1:dim_num).^2 );
%
%  Compute the volume.
%
  vol = abs ( ...
      ab(1) * ( ac(2) * ad(3) - ac(3) * ad(2) ) ...
    + ab(2) * ( ac(3) * ad(1) - ac(1) * ad(3) ) ...
    + ab(3) * ( ac(1) * ad(2) - ac(2) * ad(1) ) ) / 6.0;

  denom = lab + lac + lad + lbc + lbd + lcd;

  if ( denom == 0.0 )
    quality3 = 0.0;
  else
    quality3 = 12.0 * ( 3.0 * vol ).^( 2.0 / 3.0 ) / denom;
  end

  return
end
function quality4 = tetrahedron_quality4_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY4_3D computes the minimum solid angle of a tetrahedron.
%
%  Discussion:
%
%    This routine computes a quality measure for a tetrahedron, based
%    on the sine of half the minimum of the four solid angles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real QUALITY4, the value of the quality measure.
%
  dim_num = 3;
%
%  Compute the vectors that represent the sides.
%
  ab(1:dim_num) = tetra(1:dim_num,2) - tetra(1:dim_num,1);
  ac(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,1);
  ad(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,1);
  bc(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,2);
  bd(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,2);
  cd(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,3);
%
%  Compute the lengths of the sides.
%
  lab = sqrt ( sum ( ab(1:dim_num).^2 ) );
  lac = sqrt ( sum ( ac(1:dim_num).^2 ) );
  lad = sqrt ( sum ( ad(1:dim_num).^2 ) );
  lbc = sqrt ( sum ( bc(1:dim_num).^2 ) );
  lbd = sqrt ( sum ( bd(1:dim_num).^2 ) );
  lcd = sqrt ( sum ( cd(1:dim_num).^2 ) );
%
%  Compute the volume
%
  volume = abs ( ...
      ab(1) * ( ac(2) * ad(3) - ac(3) * ad(2) ) ...
    + ab(2) * ( ac(3) * ad(1) - ac(1) * ad(3) ) ...
    + ab(3) * ( ac(1) * ad(2) - ac(2) * ad(1) ) ) / 6.0;

  quality4 = 1.0;

  l1 = lab + lac;
  l2 = lab + lad;
  l3 = lac + lad;

  denom = ( l1 + lbc ) * ( l1 - lbc ) ...
        * ( l2 + lbd ) * ( l2 - lbd ) ...
        * ( l3 + lcd ) * ( l3 - lcd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lab + lbc;
  l2 = lab + lbd;
  l3 = lbc + lbd;

  denom = ( l1 + lac ) * ( l1 - lac ) ...
        * ( l2 + lad ) * ( l2 - lad ) ...
        * ( l3 + lcd ) * ( l3 - lcd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lac + lbc;
  l2 = lac + lcd;
  l3 = lbc + lcd;

  denom = ( l1 + lab ) * ( l1 - lab ) ...
        * ( l2 + lad ) * ( l2 - lad ) ...
        * ( l3 + lbd ) * ( l3 - lbd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lad + lbd;
  l2 = lad + lcd;
  l3 = lbd + lcd;

  denom = ( l1 + lab ) * ( l1 - lab ) ...
        * ( l2 + lac ) * ( l2 - lac ) ...
        * ( l3 + lbc ) * ( l3 - lbc );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  quality4 = quality4 * 1.5 * sqrt ( 6.0 );

  return
end
function volume = tetrahedron_volume_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_VOLUME_3D computes the volume of a tetrahedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real VOLUME, the volume of the tetrahedron.
%
  dim_num = 3;

  a(1:dim_num,1:4) = tetra(1:dim_num,1:4);
  a(4,1:4) = 1.0;

  volume = abs ( r8mat_det_4d ( a ) ) / 6.0;

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
