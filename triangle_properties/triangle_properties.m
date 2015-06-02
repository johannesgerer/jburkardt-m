function triangle_properties ( node_filename )

%*****************************************************************************80
%
%% TRIANGLE_PROPERTIES reports properties of a tetrahedron.
%
%  Usage:
%
%    tetrahedron_properties ( 'filename' )
%
%    where 'filename' is a file containing the coordinates of the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_PROPERTIES:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Determine properties of a triangle.\n' );
%
%  Commandline argument #1 is the file name
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_PROPERTIES:\n' );

    node_filename = input ( '  Please enter the name of the node coordinate file.' );

  end
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  if ( dim_num ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_PROPERTIES - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 2.\n' );
    error ( 'TRIANGLE_PROPERTIES - Fatal error!' );
  end

  if ( node_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_PROPERTIES - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have 3 nodes.\n' );
    error ( 'TRIANGLE_PROPERTIES - Fatal error!' );
  end

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print ( dim_num, node_num, node_xy, '  Node coordinates:' );
%
%  ANGLES
%
  angles(1:3) = triangle_angles_2d ( node_xy );

  r8vec_print ( 3, angles, '  ANGLES (radians):' );

  angles(1:3) = angles(1:3) * 180.0D+00 / pi;

  r8vec_print ( 3, angles, '  ANGLES (degrees):' );
%
%  AREA
%
  area = triangle_area_2d ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA:  %f\n', area );
%
%  CENTROID
%
  centroid(1:2) = triangle_centroid_2d ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CENTROID:   %14f  %14f\n', centroid(1:2) );
%
%  CIRCUMCIRCLE
%
  [ circum_radius, circum_center(1:2) ] = triangle_circumcircle_2d ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CIRCUM_RADIUS:  %f\n', circum_radius );
  fprintf ( 1, '  CIRCUM_CENTER:  %14f  %14f\n', circum_center(1:2) );
%
%  EDGE LENGTHS
%
  edge_length(1:3) = triangle_edge_length_2d ( node_xy );

  r8vec_print ( 3, edge_length, '  EDGE_LENGTHS:' );
%
%  INCIRCLE
%
  [ in_radius, in_center(1:2) ] = triangle_incircle_2d ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  IN_RADIUS:  %f\n', in_radius );
  fprintf ( 1, '  IN_CENTER:  %14f  %14f\n', in_center(1:2) );
%
%  ORIENTATION
%
  orientation = triangle_orientation_2d ( node_xy );

  fprintf ( 1, '\n' );
  if ( orientation == 0 )
    fprintf ( 1, '  ORIENTATION: CounterClockwise.\n' );
  elseif ( orientation == 1 )
    fprintf ( 1, '  ORIENTATION: Clockwise.\n' );
  elseif ( orientation == 2 )
    fprintf ( 1,'  ORIENTATION: Degenerate Distinct Colinear Points.\n' );
  elseif ( orientation == 3 )
    fprintf ( 1,'  ORIENTATION: Degenerate, at least two points identical.\n' );
  end
%
%  ORTHOCENTER
%
  [ ortho_center, flag ] = triangle_orthocenter_2d ( node_xy );

  if ( flag )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ORTHO_CENTER:  Could not be computed.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ORTHO_CENTER: %14f  %14f\n', ortho_center(1:2) );
  end
%
%  QUALITY
%
  quality = triangle_quality_2d ( node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY: %f\n', quality );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_PROPERTIES:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = arc_cosine ( c )

%*******************************************************************************
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
function [ p4, flag ] = line_exp_perp_2d ( p1, p2, p3 )

%*****************************************************************************80
%
%% LINE_EXP_PERP_2D computes a line perpendicular to a line and through a point.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The input point P3 should NOT lie on the line (P1,P2).  If it
%    does, then the output value P4 will equal P3.
%
%    P1-----P4-----------P2
%            |
%            |
%           P3
%
%    P4 is also the nearest point on the line (P1,P2) to the point P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), two points on the line.
%
%    Input, real P3(2), a point (presumably not on the 
%    line (P1,P2)), through which the perpendicular must pass.
%
%    Output, real P4(2), a point on the line (P1,P2),
%    such that the line (P3,P4) is perpendicular to the line (P1,P2).
%
%    Output, logical FLAG, is TRUE if the point could not be computed.
%
  dim_num = 2;

  bot = sum ( ( p2(1:dim_num) - p1(1:dim_num) ).^2 );

  if ( bot == 0.0 )
    p4(1:dim_num) = Inf;
    flag = 1;
    return
  end
%
%  (P3-P1) dot (P2-P1) = Norm(P3-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P3-P1) dot (P2-P1) / Norm(P3-P1)**2 = normalized coordinate T
%  of the projection of (P3-P1) onto (P2-P1).
%
  t = sum ( ( p1(1:dim_num) - p3(1:dim_num) ) .* ( p1(1:dim_num) - p2(1:dim_num) ) ) / bot;

  p4(1:dim_num) = p1(1:dim_num) + t * ( p2(1:dim_num) - p1(1:dim_num) );
  flag = 0;

  return
end
function [ a, b, c ] = line_exp2imp_2d ( p1, p2 )

%*****************************************************************************80
%
%% LINE_EXP2IMP_2D converts an explicit line to implicit form in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The implicit form of a line in 2D is:
%
%      A * X + B * Y + C = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), two points on the line.
%
%    Output, real A, B, C, the implicit form of the line.
%
  dim_num = 2;
%
%  Take care of degenerate cases.
%
  if ( p1(1:dim_num) == p2(1:dim_num) )
    fprintf ( 1, '\n' );
    fprintf ( 1,  'LINE_EXP2IMP_2D - Fatal error!\n' );
    fprintf ( 1,  '  P1 = P2\n' );
    fprintf ( 1,  '  P1 = %f  %f\n', p1(1:dim_num) );
    fprintf ( 1,  '  P2 = %f  %f\n', p2(1:dim_num) );
    error ( 'LINE_EXP2IMP_2D - Fatal error!' );
  end

  a = p2(2) - p1(2);
  b = p1(1) - p2(1);
  c = p2(1) * p1(2) - p1(1) * p2(2);

  norm = a * a + b * b + c * c;

  if ( 0.0 < norm )
    a = a / norm;
    b = b / norm;
    c = c / norm;
  end

  if ( a < 0.0 )
    a = -a;
    b = -b;
    c = -c;
  end

  return
end
function [ ival, p ] = lines_exp_int_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_INT_2D determines where two explicit lines intersect in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      the line through the points P1, P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), two points on the first line.
%
%    Input, real Q1(2), Q2(2), two points on the second line.
%
%    Output, integer IVAL, reports on the intersection:
%    0, no intersection, the lines may be parallel or degenerate.
%    1, one intersection point, returned in P.
%    2, infinitely many intersections, the lines are identical.
%
%    Output, real P(2), if IVAl = 1, P is
%    the intersection point.  Otherwise, P = 0.
%
  dim_num = 2;

  ival = 0;
  p(1:dim_num) = 0.0;
%
%  Check whether either line is a point.
%
  if ( p1(1:dim_num) == p2(1:dim_num) )
    point_1 = 1;
  else
    point_1 = 0;
  end

  if ( q1(1:dim_num) == q2(1:dim_num) )
    point_2 = 1;
  else
    point_2 = 0;
  end
%
%  Convert the lines to ABC format.
%
  if ( ~point_1 )
    [ a1, b1, c1 ] = line_exp2imp_2d ( p1, p2 );
  end

  if ( ~point_2 )
    [ a2, b2, c2 ] = line_exp2imp_2d ( q1, q2 );
  end
%
%  Search for intersection of the lines.
%
  if ( point_1 && point_2 )
    if ( p1(1:dim_num) == q1(1:dim_num) )
      ival = 1;
      p(1:dim_num) = p1(1:dim_num);
    end
  elseif ( point_1 )
    if ( a2 * p1(1) + b2 * p1(2) == c2 )
      ival = 1;
      p(1:dim_num) = p1(1:dim_num);
    end
  elseif ( point_2 )
    if ( a1 * q1(1) + b1 * q1(2) == c1 )
      ival = 1;
      p(1:dim_num) = q1(1:dim_num);
    end
  else
    [ ival, p ] = lines_imp_int_2d ( a1, b1, c1, a2, b2, c2 );
  end

  return
end
function [ ival, p ] = lines_imp_int_2d ( a1, b1, c1, a2, b2, c2 )

%*****************************************************************************80
%
%% LINES_IMP_INT_2D determines where two implicit lines intersect in 2D.
%
%  Discussion:
%
%    The implicit form of a line in 2D is:
%
%      A * X + B * Y + C = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A1, B1, C1, define the first line.
%    At least one of A1 and B1 must be nonzero.
%
%    Input, real A2, B2, C2, define the second line.
%    At least one of A2 and B2 must be nonzero.
%
%    Output, integer IVAL, reports on the intersection.
%
%    -1, both A1 and B1 were zero.
%    -2, both A2 and B2 were zero.
%     0, no intersection, the lines are parallel.
%     1, one intersection point, returned in X, Y.
%     2, infinitely many intersections, the lines are identical.
%
%    Output, real P(2), if IVAL = 1, then P is
%    the intersection point.  if IVAL = 2, then P is one of the
%    points of intersection.  Otherwise, P = [].
%
  dim_num = 2;
%
%  Refuse to handle degenerate lines.
%
  if ( a1 == 0.0 && b1 == 0.0 )
    ival = -1;
    p = [];
    return
  elseif ( a2 == 0.0 && b2 == 0.0 )
    ival = -2;
    p = [];
    return
  end 
%
%  Set up and solve a linear system.
%
  a(1,1) = a1;
  a(1,2) = b1;
  a(1,3) = -c1;

  a(2,1) = a2;
  a(2,2) = b2;
  a(2,3) = -c2;

  [ a, info ] = r8mat_solve ( 2, 1, a );
%
%  If the inverse exists, then the lines intersect at the solution point.
%
  if ( info == 0 )

    ival = 1;
    p(1:dim_num) = a(1:dim_num,3);
%
%  If the inverse does not exist, then the lines are parallel
%  or coincident.  Check for parallelism by seeing if the
%  C entries are in the same ratio as the A or B entries.
%
  else

    ival = 0;
    p = [];
    
    if ( a1 == 0.0 )
      if ( b2 * c1 == c2 * b1 )
        ival = 2;
        p(1:dim_num) = [ 0.0, - c1 / b1 ];
      end
    else
      if ( a2 * c1 == c2 * a1 )
        ival = 2;
        if ( abs ( a1 ) < abs ( b1 ) )
          p(1:dim_num) = [ 0.0, - c1 / b1 ];
        else
          p(1:dim_num) = [ - c1 / a1, 0.0 ];
        end
      end
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
function r8vec_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT prints a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d  %12f\n', i, a(i) );
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
function angle = triangle_angles_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ANGLES_2D computes the angles of a triangle in 2D.
%
%  Discussion:
%
%    The law of cosines is used:
%
%      C^2 = A^2 + B^2 - 2 * A * B * COS ( GAMMA )
%
%    where GAMMA is the angle opposite side C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real ANGLE(3), the angles opposite
%    sides P1-P2, P2-P3 and P3-P1, in radians.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );
%
%  Take care of unlikely special cases.
%
  if ( a == 0.0 && b == 0.0 && c == 0.0 )
    angle(1:3) = 2.0 * pi / 3.0;
    return
  end

  if ( c == 0.0 || a == 0.0 )
    angle(1) = pi;
  else
    angle(1) = arc_cosine ( ( c * c + a * a - b * b ) / ( 2.0 * c * a ) );
  end

  if ( a == 0.0 || b == 0.0 )
    angle(2) = pi;
  else
    angle(2) = arc_cosine ( ( a * a + b * b - c * c ) / ( 2.0 * a * b ) );
  end

  if ( b == 0.0 || c == 0.0 )
    angle(3) = pi;
  else
    angle(3) = arc_cosine ( ( b * b + c * c - a * a ) / ( 2.0 * b * c ) );
  end

  return
end
function area = triangle_area_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_2D computes the area of a triangle in 2D.
%
%  Discussion:
%
%    If the triangle's vertices are given in counterclockwise order,
%    the area will be positive.  If the triangle's vertices are given
%    in clockwise order, the area will be negative!
%
%    An earlier version of this routine always returned the absolute
%    value of the computed area.  I am convinced now that that is
%    a less useful result!  For instance, by returning the signed 
%    area of a triangle, it is possible to easily compute the area 
%    of a nonconvex polygon as the sum of the (possibly negative) 
%    areas of triangles formed by node 1 and successive pairs of vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  area = 0.5 * ( ...
      t(1,1) * ( t(2,2) - t(2,3) ) ...
    + t(1,2) * ( t(2,3) - t(2,1) ) ...
    + t(1,3) * ( t(2,1) - t(2,2) ) );

  return
end
function centroid = triangle_centroid_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CENTROID_2D computes the centroid of a triangle in 2D.
%
%  Discussion:
%
%    The centroid of a triangle can also be considered the
%    center of gravity, or center of mass, assuming that the triangle
%    is made of a thin uniform sheet of massy material.
%
%    The centroid of a triangle is the intersection of the medians.
%
%    A median of a triangle is a line connecting a vertex to the
%    midpoint of the opposite side.
%
%    In barycentric coordinates, in which the vertices of the triangle
%    have the coordinates (1,0,0), (0,1,0) and (0,0,1), the centroid
%    has coordinates (1/3,1/3,1/3).
%
%    In geometry, the centroid of a triangle is often symbolized by "G".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2005
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
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTROID(2), the coordinates of the centroid.
%
  dim_num = 2;
  centroid = zeros ( dim_num, 2 );
  for i = 1 : dim_num
    centroid(i) = sum ( t(i,1:3) ) / 3.0;
  end

  return
end
function [ r, center ] = triangle_circumcircle_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCIRCLE_2D computes the circumcircle of a triangle in 2D.
%
%  Discussion:
%
%    The circumcenter of a triangle is the center of the circumcircle, the
%    circle that passes through the three vertices of the triangle.
%
%    The circumcircle contains the triangle, but it is not necessarily the
%    smallest triangle to do so.
%
%    If all angles of the triangle are no greater than 90 degrees, then
%    the center of the circumscribed circle will lie inside the triangle.
%    Otherwise, the center will lie outside the triangle.
%
%    The circumcenter is the intersection of the perpendicular bisectors
%    of the sides of the triangle.
%
%    In geometry, the circumcenter of a triangle is often symbolized by "O".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real R, CENTER(2), the circumradius and circumcenter
%    of the triangle.
%

%
%  Circumradius.
%
  a = sqrt ( ( t(1,2) - t(1,1) ).^2 + ( t(2,2) - t(2,1) ).^2 );
  b = sqrt ( ( t(1,3) - t(1,2) ).^2 + ( t(2,3) - t(2,2) ).^2 );
  c = sqrt ( ( t(1,1) - t(1,3) ).^2 + ( t(2,1) - t(2,3) ).^2 );

  bot = ( a + b + c ) * ( - a + b + c ) * (   a - b + c ) * (   a + b - c );

  if ( bot <= 0.0 )
    r = -1.0;
    center(1:2) = 0.0;
    return
  end

  r = a * b * c / sqrt ( bot );
%
%  Circumcenter.
%
  f(1) = ( t(1,2) - t(1,1) ).^2 + ( t(2,2) - t(2,1) ).^2;
  f(2) = ( t(1,3) - t(1,1) ).^2 + ( t(2,3) - t(2,1) ).^2;
  
  top(1) =    ( t(2,3) - t(2,1) ) * f(1) - ( t(2,2) - t(2,1) ) * f(2);
  top(2) =  - ( t(1,3) - t(1,1) ) * f(1) + ( t(1,2) - t(1,1) ) * f(2);

  det  =    ( t(2,3) - t(2,1) ) * ( t(1,2) - t(1,1) ) ...
          - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) ) ;

  center(1:2) = t(1:2,1)' + 0.5 * top(1:2) / det;

  return
end
function edge_length = triangle_edge_length_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_EDGE_LENGTH_2D returns edge lengths of a triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real EDGE_LENGTH(3), the length of the edges.
%
  edge_length = zeros ( 3, 1 );
  
  for j1 = 1 : 3
    j2 = i4_wrap ( j1 + 1, 1, 3 );
    edge_length(j1) = sqrt ( ( t(1,j2) - t(1,j1) )^2 + ( t(2,j2) - t(2,j1) )^2 );
  end

  return
end
function [ r, center ] = triangle_incircle_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_INCIRCLE_2D computes the inscribed circle of a triangle in 2D.
%
%  Discussion:
%
%    The inscribed circle of a triangle is the largest circle that can
%    be drawn inside the triangle.  It is tangent to all three sides,
%    and the lines from its center to the vertices bisect the angles
%    made by each vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
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
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real R, CENTER(2), the radius and center of the
%    inscribed circle.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );

  perimeter = a + b + c;

  if ( perimeter == 0.0 )
    center(1:dim_num) = t(1:dim_num,1);
    r = 0.0;
    return
  end

  center(1:dim_num) = (  ...
      b * t(1:dim_num,1) ...
    + c * t(1:dim_num,2) ...
    + a * t(1:dim_num,3) ) / perimeter;

  r = 0.5 * sqrt ( ...
      ( - a + b + c )  ...
    * ( + a - b + c )  ...
    * ( + a + b - c ) / perimeter );

  return
end
function value = triangle_orientation_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ORIENTATION_2D determines the orientation of a triangle in 2D.
%
%  Discussion:
%
%    Three distinct non-colinear points in the plane define a circle.
%    If the points are visited in the order P1, P2, and then
%    P3, this motion defines a clockwise or counterclockwise
%    rotation along the circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, integer VALUE, reports if the three points lie
%    clockwise on the circle that passes through them.  The possible
%    return values are:
%    0, the points are distinct, noncolinear, and lie counterclockwise
%    on their circle.
%    1, the points are distinct, noncolinear, and lie clockwise
%    on their circle.
%    2, the points are distinct and colinear.
%    3, at least two of the points are identical.
%
  dim_num = 2;

  if ( all ( t(1:dim_num,1) == t(1:dim_num,2) ) || ...
       all ( t(1:dim_num,2) == t(1:dim_num,3) ) || ...
       all ( t(1:dim_num,3) == t(1:dim_num,1) ) ) 
    value = 3;
    return
  end

  det = ( t(1,1) - t(1,3) ) * ( t(2,2) - t(2,3) ) ...
      - ( t(1,2) - t(1,3) ) * ( t(2,1) - t(2,3) );

  if ( det == 0.0 )
    value = 2;
  elseif ( det < 0.0 )
    value = 1;
  elseif ( 0.0 < det )
    value = 0;
  end

  return
end
function [ center, flag ] = triangle_orthocenter_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ORTHOCENTER_2D computes the orthocenter of a triangle in 2D.
%
%  Discussion:
%
%    The orthocenter is defined as the intersection of the three altitudes
%    of a triangle.
%
%    An altitude of a triangle is the line through a vertex of the triangle
%    and perpendicular to the opposite side.
%
%    In geometry, the orthocenter of a triangle is often symbolized by "H".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
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
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTER(2), the orthocenter of the triangle.
%
%    Output, logical FLAG, is TRUE if the point could not be computed.
%

%
%  Determine a point P23 common to the line (P2,P3) and
%  its perpendicular through P1.
%
  [ p23, flag ] = line_exp_perp_2d ( t(1:2,2), t(1:2,3), t(1:2,1) );

  if ( flag )
    center(1:2) = Inf;
    return
  end
%
%  Determine a point P31 common to the line (P3,P1) and
%  its perpendicular through P2.
%
  [ p31, flag ] = line_exp_perp_2d ( t(1:2,3), t(1:2,1), t(1:2,2) );

  if ( flag )
    center(1:2) = Inf;
    return
  end
%
%  Determine CENTER, the intersection of the lines (P1,P23) and (P2,P31).
%
  [ ival, center ] = lines_exp_int_2d ( t(1:2,1), p23(1:2)', t(1:2,2), p31(1:2)' );

  if ( ival ~= 1 )
    center(1:2) = Inf;
    flag = 1;
    return
  end

  return
end
function quality = triangle_quality_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_QUALITY_2D: "quality" of a triangle in 2D.
%
%  Discussion:
%
%    The quality of a triangle is 2 times the ratio of the radius of the inscribed
%    circle divided by that of the circumscribed circle.  An equilateral
%    triangle achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
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
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real QUALITY, the quality of the triangle.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );

  if ( a * b * c == 0.0 )
    quality = 0.0;
  else
    quality = ( - a + b + c ) * ( a - b + c ) * ( a + b - c ) / ( a * b * c );
  end

  return
end
