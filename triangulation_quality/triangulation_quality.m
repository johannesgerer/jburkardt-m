function triangulation_quality ( prefix )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGULATION_QUALITY.
%
%  Discussion:
%
%    TRIANGULATION_QUALITY determines quality measures for a triangulation.
%
%    The code has been modified to 'allow' 6-node triangulations.
%    However, no effort is made to actually process the midside nodes.
%    Only information from the vertices is used.
%
%    The three quality measures are:
%
%      ALPHA_MEASURE
%      AREA_MEASURE
%      Q_MEASURE
%
%    In each case, the ideal value of the quality measure is 1, and
%    the worst possible value is 0.
%
%    The program also prints out the geometric bandwidth, which is the
%    bandwidth of the adjacency matrix of the nodes.
%
%  Usage:
%
%    triangulation_quality ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains the node coordinates;
%    * 'prefix'_elements.txt contains the element definitions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the filename prefix.
%
%  Local parameters:
%
%    Local, integer DIM_NUM, the spatial dimension.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, real NODE_XY(DIM_NUM,NODE_NUM), the point set.
%
%    Local, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), 
%    lists the nodes that make up each triangle.
%
%    Local, integer TRIANGLE_NUM, the number of triangles.
%
%    Local, integer TRIANGLE_ORDER, the order of the triangles, 
%    either 3 or 6.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_QUALITY:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Compute triangulation quality measures.\n' );
%
%  The command line argument is the common filename prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUALITY:\n' );

    prefix = input ( ...
      'Please enter the filename prefix:' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  triangle_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUALITY - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 2.\n' );
    error ( 'TRIANGULATION_QUALITY - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, dim_num, 5, ...
    '  First 5 nodes:' );
%
%  Read the element data.
%
  [ triangle_order, triangle_num ] = i4mat_header_read ( ...
    triangle_filename );

  if ( triangle_order ~= 3 && triangle_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_QUALITY - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 3-node or 6-node triangulation.\n' );
    error ( 'TRIANGULATION_QUALITY - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', ...
    triangle_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle order = %d\n', triangle_order );
  fprintf ( 1, '  Number of triangles TRIANGLE_NUM  = %d\n', ...
    triangle_num );

  triangle_node = i4mat_data_read ( triangle_filename, ...
    triangle_order, triangle_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', triangle_filename );

  i4mat_transpose_print_some ( triangle_order, triangle_num, ...
    triangle_node, 1, 1, triangle_order, 10, ...
    '  First 10 elements:' );
%
%  Detect and correct 0-based indexing.
%
  triangle_node = mesh_base_one ( node_num, triangle_order, triangle_num, ...
    triangle_node );
%
%  Compute the quality measures.
%
  [ alpha_min, alpha_ave, alpha_area ] = alpha_measure ( node_xy, ...
    triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ALPHA compares the smallest angle against 60 degrees.\n' );
  fprintf ( 1, '  Values of ALPHA range from 0 (extremely poor) to 1 (excellent).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1,'  ALPHA_MIN  : minimum over all triangles = %f  %f\n', ...
    alpha_min, alpha_min * 60.0 );
  fprintf ( 1,'  ALPHA_AVE  : average over all triangles = %f  %f\n', ...
    alpha_ave, alpha_ave * 60.0 );
  fprintf ( 1,'  ALPHA_AREA : average weighted by area   = %f  %f\n', ...
    alpha_area, alpha_area * 60.0 );

  [ area_min, area_max, area_ratio, area_ave, area_std, area_negative, ...
    area_zero ] = area_measure ( node_xy, triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA compares the areas of the triangles.\n' );
  fprintf ( 1, '  Values of AREA_RATIO range from 0 (extremely poor) to 1 (excellent).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA_MIN   : minimum area         = %f\n', area_min );
  fprintf ( 1, '  AREA_MAX   : maximum area         = %f\n', area_max );
  fprintf ( 1, '  AREA_RATIO : minimum/maximum area = %f\n', area_ratio );
  fprintf ( 1, '  AREA_AVE   : average area         = %f\n', area_ave );
  fprintf ( 1, '  AREA_STD   : standard deviation   = %f\n', area_std );
  fprintf ( 1, '  AREA_NEG   : area < neg           = %d\n', area_negative );
  fprintf ( 1, '  AREA_ZERO  : area = 0             = %d\n', area_zero );

  [ q_min, q_max, q_ave, q_area ] = q_measure ( node_xy, ...
    triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q is the ratio of 2 * inradius to outradius.\n' );
  fprintf ( 1, '  Values of Q range from 0 (extremely poor) to 1 (excellent).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q_MIN  : minimum Q                  = %f\n', q_min );
  fprintf ( 1, '  Q_MAX  : maximum Q                  = %f\n', q_max );
  fprintf ( 1, '  Q_AVE  : average Q                  = %f\n', q_ave );
  fprintf ( 1, '  Q_AREA : average Q weighted by area = %f\n', q_area );

  [ ml, mu, m ] = bandwidth_mesh ( triangle_order, triangle_num, ...
    triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The geometric bandwidth          M = %d\n', m );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_QUALITY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ alpha_min, alpha_ave, alpha_area ] = alpha_measure ( z, ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% ALPHA_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discusion:
%
%    The ALPHA measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    This measure is naturally extended to higher dimensions, but the
%    given program can only handle DIM_NUM = 2.
%
%    We measure the minimum angle among all the triangles in the triangulated dataset.  
%    In degrees, the maximum possible value is 60.  We divide the achieved value by
%    the maximum possible value to get a quality measure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the triangulation.
%
%    Output, real ALPHA_MIN, the minimum value of ALPHA over all
%    triangles.
%
%    Output, real ALPHA_AVE, the value of ALPHA averaged over
%    all triangles.
%
%    Output, real ALPHA_AREA, the value of ALPHA averaged over
%    all triangles and weighted by area.
%
  alpha_min = r8_huge ( );
  alpha_ave = 0.0;
  alpha_area = 0.0;
  area_total = 0.0;

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    a_x = z(1,a_index);
    a_y = z(2,a_index);
    b_x = z(1,b_index);
    b_y = z(2,b_index);
    c_x = z(1,c_index);
    c_y = z(2,c_index);

    area = 0.5 * abs ( a_x * ( b_y - c_y ) ...
                     + b_x * ( c_y - a_y ) ...
                     + c_x * ( a_y - b_y ) );

    ab_len = sqrt ( ( a_x - b_x )^2 + ( a_y - b_y )^2 );
    bc_len = sqrt ( ( b_x - c_x )^2 + ( b_y - c_y )^2 );
    ca_len = sqrt ( ( c_x - a_x )^2 + ( c_y - a_y )^2 );
%
%  Take care of a ridiculous special case.
%
    if ( ab_len == 0.0 && bc_len == 0.0 && ca_len == 0.0 )
      a_angle = 2.0 * pi / 3.0;
      b_angle = 2.0 * pi / 3.0;
      c_angle = 2.0 * pi / 3.0;
    else

      if ( ca_len == 0.0 || ab_len == 0.0 )
        a_angle = pi;
      else
        a_angle = arc_cosine ( ( ca_len^2 + ab_len^2 - bc_len^2 ) ...
          / ( 2.0 * ca_len * ab_len ) );
      end

      if ( ab_len == 0.0 || bc_len == 0.0 )
        b_angle = pi;
      else
        b_angle = arc_cosine ( ( ab_len^2 + bc_len^2 - ca_len^2 ) ...
          / ( 2.0 * ab_len * bc_len ) );
      end

      if ( bc_len == 0.0 || ca_len == 0.0 )
        c_angle = pi;
      else
        c_angle = arc_cosine ( ( bc_len^2 + ca_len^2 - ab_len^2 ) ...
          / ( 2.0 * bc_len * ca_len ) );
      end

    end

    alpha_min = min ( alpha_min, a_angle );
    alpha_min = min ( alpha_min, b_angle );
    alpha_min = min ( alpha_min, c_angle );

    alpha_ave = alpha_ave + alpha_min;

    alpha_area = alpha_area + area * alpha_min;

    area_total = area_total + area;

  end

  alpha_ave = alpha_ave / triangle_num;
  alpha_area = alpha_area / area_total;
%
%  Normalize angles from [0,pi/3] radians into qualities in [0,1].
%
  alpha_min = alpha_min * 3.0 / pi;
  alpha_ave = alpha_ave * 3.0 / pi;
  alpha_area = alpha_area * 3.0 / pi;

  return
end
function value = arc_cosine ( c )

%*****************************************************************************80
%
%% ARC_COSINE computes the arc cosine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ACOS routine with an input argument that is
%    even slightly outside the range [-1.0, 1.0 ], you may get an unpleasant 
%    surprise (I did).
%
%    This routine simply truncates arguments outside the range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real C, the argument.
%
%    Output, real VALUE, an angle whose cosine is C.
%
  c2 = c;
  c2 = max ( c2, -1.0 );
  c2 = min ( c2, +1.0 );

  value = acos ( c2 );

  return
end
function [ area_min, area_max, area_ratio, area_ave, area_std, ...
  area_negative, area_zero ] =  area_measure ( z, triangle_num, triangle_node )

%*****************************************************************************80
%
%% AREA_MEASURE determines the area ratio quality measure.
%
%  Discusion:
%
%    This measure computes the area of every triangle, and returns
%    the ratio of the minimum to the maximum triangle.  A value of
%    1 is "perfect", indicating that all triangles have the same area.
%    A value of 0 is the worst possible result.
%
%    The code has been modified to 'allow' 6-node triangulations.
%    However, no effort is made to actually process the midside nodes.
%    Only information from the vertices is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(2,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the triangulation.
%
%    Output, real AREA_MIN, AREA_MAX, the minimum and maximum 
%    areas.
%
%    Output, real AREA_RATIO, the ratio of the minimum to the
%    maximum area.
%
%    Output, real AREA_AVE, the average area.
%
%    Output, real AREA_STD, the standard deviation of the areas.
%
%    Output, integer AREA_NEGATIVE, the number of triangles with negative area.
%
%    Output, intgeger AREA_ZERO, the number of triangles with zero area.
%
  area_max = 0.0;
  area_min = r8_huge ( );
  area_ave = 0.0;
  area_negative = 0;
  area_zero = 0;

  for triangle = 1 : triangle_num

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * ( x1 * ( y2 - y3 ) ...
                + x2 * ( y3 - y1 ) ...
                + x3 * ( y1 - y2 ) );

    area_min = min ( area_min, abs ( area ) );
    area_max = max ( area_max, abs ( area ) );
    area_ave = area_ave + abs ( area );

    if ( area < 0 )
      area_negative = area_negative + 1;
    end

    if ( area == 0 )
      area_zero = area_zero + 1;
    end

  end

  area_ave = area_ave / triangle_num;

  area_std = 0.0;
  for triangle = 1 : triangle_num

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                     + x2 * ( y3 - y1 ) ...
                     + x3 * ( y1 - y2 ) );

    area_std = area_std + ( area - area_ave ).^2;
  end
  area_std = sqrt ( area_std / triangle_num );

  if ( 0.0 < area_max )
    area_ratio = area_min / area_max;
  else
    area_ratio = 0.0;
  end

  return
end
function [ ml, mu, m ] = bandwidth_mesh ( element_order, element_num, ...
  element_node )

%*****************************************************************************80
%
%% BANDWIDTH_MESH determines the bandwidth of the coefficient matrix.
%
%  Discussion:
%
%    The quantity computed here is the "geometric" bandwidth determined
%    by the finite element mesh alone.
%
%    If a single finite element variable is associated with each node
%    of the mesh, and if the nodes and variables are numbered in the
%    same way, then the geometric bandwidth is the same as the bandwidth
%    of a typical finite element matrix.
%
%    The bandwidth M is defined in terms of the lower and upper bandwidths:
%
%      M = ML + 1 + MU
%
%    where 
%
%      ML = maximum distance from any diagonal entry to a nonzero
%      entry in the same row, but earlier column,
%
%      MU = maximum distance from any diagonal entry to a nonzero
%      entry in the same row, but later column.
%
%    Because the finite element node adjacency relationship is symmetric,
%    we are guaranteed that ML = MU.
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
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Output, integer ML, MU, the lower and upper bandwidths of the matrix.
%
%    Output, integer M, the bandwidth of the matrix.
%
  ml = 0;
  mu = 0;

  for element = 1 : element_num

    for local_i = 1 : element_order
      global_i = element_node(local_i,element);

      for local_j = 1 : element_order
        global_j = element_node(local_j,element);

        mu = max ( mu, global_j - global_i );
        ml = max ( ml, global_i - global_j );

      end
    end
  end

  m = ml + 1 + mu;

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
    fprintf ( 1, '  NODE_MIN = %d\n', node_min );
    fprintf ( 1, '  NODE_MAX = %d\n', node_max );
    fprintf ( 1, '  NODE_NUM = %d\n', node_num );
  end

  return
end
function [ q_min, q_max, q_ave, q_area ] = q_measure ( z, ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% Q_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discussion:
%
%    The Q measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    For a single triangle T, the value of Q(T) is defined as follows:
%
%      TAU_IN = radius of the inscribed circle,
%      TAU_OUT = radius of the circumscribed circle,
%
%      Q(T) = 2 * TAU_IN / TAU_OUT
%        = ( B + C - A ) * ( C + A - B ) * ( A + B - C ) / ( A * B * C )
%
%    where A, B and C are the lengths of the sides of the triangle T.
%
%    The Q measure computes the value of Q(T) for every triangle T in the
%    triangulation, and then computes the standard deviation of this
%    set of values:
%
%      Q_MEASURE = min ( all T in triangulation ) Q(T)
%
%    In an ideally regular mesh, all triangles would have the same
%    equilateral shape, for which Q = 1.  In a good mesh, 0.5 < Q.
%
%    Given the 2D coordinates of a set of N nodes, stored as Z(1:2,1:N),
%    a triangulation is a list of NT triples of node indices that form
%    triangles.  Generally, a maximal triangulation is expected, namely,
%    a triangulation whose image is a planar graph, but for which the
%    addition of any new triangle would mean the graph was no longer planar.
%    A Delaunay triangulation is a maximal triangulation which maximizes
%    the minimum angle that occurs in any triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, pages 329-345, June 2004.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the triangulation.
%
%    Output, real ( kind = 8 ) Q_MIN, Q_MAX, the minimum and maximum values
%    of Q over all triangles.
%
%    Output, real ( kind = 8 ) Q_AVE, the average value of Q.
%
%    Output, real ( kind = 8 ) Q_AREA, the average value of Q, weighted by
%    the area of each triangle.
%
  q_min = r8_huge ( );
  q_max = - r8_huge ( );
  q_ave = 0.0;
  q_area = 0.0;
  area_total = 0.0;

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    ab_length = sqrt ( ...
        ( z(1,a_index) - z(1,b_index) )^2 ...
      + ( z(2,a_index) - z(2,b_index) )^2 );

    bc_length = sqrt ( ...
        ( z(1,b_index) - z(1,c_index) )^2 ...
      + ( z(2,b_index) - z(2,c_index) )^2 );

    ca_length = sqrt ( ...
        ( z(1,c_index) - z(1,a_index) )^2 ...
      + ( z(2,c_index) - z(2,a_index) )^2 );

    q = ( bc_length + ca_length - ab_length ) ...
      * ( ca_length + ab_length - bc_length ) ...
      * ( ab_length + bc_length - ca_length ) ...
      / ( ab_length * bc_length * ca_length );

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                     + x2 * ( y3 - y1 ) ...
                     + x3 * ( y1 - y2 ) );

    q_min = min ( q_min, q );
    q_max = max ( q_max, q );
    q_ave = q_ave + q;
    q_area = q_area + q * area;

    area_total = area_total + area;

  end

  q_ave = q_ave / triangle_num;

  if ( 0.0 < area_total )
    q_area = q_area / area_total;
  else
    q_area = 0.0;
  end

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
