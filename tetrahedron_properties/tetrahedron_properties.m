function tetrahedron_properties ( node_filename )

%*****************************************************************************80
%
%% TETRAHEDRON_PROPERTIES reports properties of a tetrahedron.
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
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_PROPERTIES:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Determine properties of a tetrahedron.\n' );
%
%  Commandline argument #1 is the file name
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_PROPERTIES:\n' );

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

  if ( dim_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_PROPERTIES - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have spatial dimension 3.\n' );
    error ( 'TETRAHEDRON_PROPERTIES - Fatal error!' );
  end

  if ( node_num ~= 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_PROPERTIES - Fatal error!\n' );
    fprintf ( 1, '  Dataset must have 4 nodes.\n' );
    error ( 'TETRAHEDRON_PROPERTIES - Fatal error!' );
  end

  node_xyz = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print ( dim_num, node_num, node_xyz, '  Node coordinates:' );
%
%  CENTROID
%
  centroid(1:3) = tetrahedron_centroid ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CENTROID:   %f  %f  %f\n', centroid(1:3) );
%
%  CIRCUMSPHERE
%
  [ circum_radius, circum_center(1:3) ] = tetrahedron_circumsphere ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CIRCUM_RADIUS = %f\n', circum_radius );
  fprintf ( 1, '  CIRCUM_CENTER:  %f  %f  %f\n', circum_center(1:3) );
%
%  DIHEDRAL ANGLES
%
  dihedral_angles(1:6) = tetrahedron_dihedral_angles ( node_xyz );

  r8vec_print ( 6, dihedral_angles, '  DIHEDRAL_ANGLES (radians)' );

  dihedral_angles(1:6) = dihedral_angles(1:6) * 180.0 / pi;

  r8vec_print ( 6, dihedral_angles, '  DIHEDRAL_ANGLES (degrees)' );
%
%  EDGES
%
  [ ab, ac, ad, bc, bd, cd ] = tetrahedron_edges ( node_xyz );

  fprintf ( 1, '\n' );
  r8vec_transpose_print ( 3, ab, '  EDGE AB:' );
  r8vec_transpose_print ( 3, ac, '  EDGE AC:' );
  r8vec_transpose_print ( 3, ad, '  EDGE AD:' );
  r8vec_transpose_print ( 3, bc, '  EDGE BC:' );
  r8vec_transpose_print ( 3, bd, '  EDGE BD:' );
  r8vec_transpose_print ( 3, cd, '  EDGE CD:' );
%
%  EDGE LENGTHS
%
  edge_length(1:6) = tetrahedron_edge_length ( node_xyz );

  r8vec_print ( 6, edge_length, '  EDGE_LENGTHS' );
%
%  FACE ANGLES
%
  face_angles(1:3,1:4) = tetrahedron_face_angles ( node_xyz );

  r8mat_transpose_print ( 3, 4, face_angles, '  FACE_ANGLES (radians)' );

  face_angles(1:3,1:4) = face_angles(1:3,1:4) * 180.0 / pi;

  r8mat_transpose_print ( 3, 4, face_angles, '  FACE_ANGLES (degrees)' );
%
%  FACE AREAS
%
  face_areas(1:4) = tetrahedron_face_areas ( node_xyz );

  r8vec_print ( 4, face_areas, '  FACE_AREAS' );
%
%  INSPHERE
%
  [ in_radius, in_center(1:3) ] = tetrahedron_insphere ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  IN_RADIUS = %f\n', in_radius );
  fprintf ( 1, '  IN_CENTER:  %f  %f  %14f\n', in_center(1:3) );
%
%  QUALITY1
%
  quality1 = tetrahedron_quality1 ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY1 = %f\n', quality1 );
%
%  QUALITY2
%
  quality2 = tetrahedron_quality2 ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY2 = %f\n', quality2 );
%
%  QUALITY3
%
  quality3 = tetrahedron_quality3 ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY3 = %f\n', quality3 );
%
%  QUALITY4
%
  quality4 = tetrahedron_quality4 ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY4 = %f\n', quality4 );
%
%  SOLID ANGLES
%
  solid_angles(1:4) = tetrahedron_solid_angles ( node_xyz );

  r8vec_print ( 4, solid_angles, '  SOLID_ANGLES (steradians)' );
%
%  VOLUME
%
  volume = tetrahedron_volume ( node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  VOLUME = %f\n', volume );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_PROPERTIES:\n' );
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
function value = r8_acos ( c )

%*****************************************************************************80
%
%% R8_ACOS computes the arc cosine function, with argument truncation.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

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
function angle = r8vec_angle_3d ( u, v )

%*****************************************************************************80
%
%% R8VEC_ANGLE_3D computes the angle between two vectors in 3D.
%
%  Modified:
%
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U(1:3), V(1:3), the vectors.
%
%    Output, real ANGLE, the angle between the two vectors.
%
  uv_dot = u(1:3) * v(1:3)';

  u_norm = sqrt ( u(1:3) * u(1:3)' );

  v_norm = sqrt ( v(1:3) * v(1:3)' );

  angle_cos = uv_dot / u_norm / v_norm;

  angle = r8_acos ( angle_cos );

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
function r8vec_transpose_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_TRANSPOSE_PRINT prints an R8VEC "transposed".
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%  Example:
%
%    A = (/ 1.0, 2.1, 3.2, 4.3, 5.4, 6.5, 7.6, 8.7, 9.8, 10.9, 11.0 /)
%    TITLE = 'My vector:  '
%
%    My vector:   1.0    2.1    3.2    4.3    5.4
%                 6.5    7.6    8.7    9.8   10.9
%                11.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  title_length = length ( title );
  for ilo = 1 : 5 : n
    if ( ilo == 1 )
      fprintf ( 1, '%s', title );
    else
      for i = 1 : title_length
        fprintf ( 1, ' ' );
      end
    end
    fprintf ( 1, '  ' );
    ihi = min ( ilo + 5 - 1, n );
    for i = ilo : ihi
      fprintf ( 1, '  %12g', a(i) );
    end
    fprintf ( 1, '\n' );
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
function centroid = tetrahedron_centroid ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_CENTROID computes the centroid of a tetrahedron.
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
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real CENTROID(3), the coordinates of the centroid.
%
  centroid = zeros ( 3, 1 );
  
  for i = 1 : 3
    centroid(i) = sum ( tetra(i,1:4) ) / 4.0;
  end

  return
end
function [ r, center ] = tetrahedron_circumsphere ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_CIRCUMSPHERE computes the circumsphere of a tetrahedron.
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

%
%  Set up the linear system.
%
  a(1:3,1:3) = ( tetra(1:3,2:4) )';

  for j = 1 : 3
    a(1:3,j) = a(1:3,j) - tetra(j,1);
  end

  for i = 1 : 3
    a(i,4) = sum ( a(i,1:3).^2 );
  end
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( 3, 1, a );
%
%  If the system was singular, return a consolation prize.
%
  if ( info ~= 0 )
    r = -1.0;
    center(1:3) = 0.0;
    return
  end
%
%  Compute R, X, Y, Z.
%
  r = 0.5 * sqrt ( sum ( a(1:3,4).^2 ) );

  center(1:3) = tetra(1:3,1) + 0.5 * a(1:3,4);

  return
end
function angle = tetrahedron_dihedral_angles ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_DIHEDRAL_ANGLES computes dihedral angles of a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron,
%    which can be labeled as A, B, C and D.
%
%    Output, real ANGLE(6), the dihedral angles along the
%    axes AB, AC, AD, BC, BD and CD, respectively.
%
  [ ab, ac, ad, bc, bd, cd ] = tetrahedron_edges ( tetra );
 
  abc_normal = r8vec_cross_3d ( ac, ab );
  abd_normal = r8vec_cross_3d ( ab, ad );
  acd_normal = r8vec_cross_3d ( ad, ac );
  bcd_normal = r8vec_cross_3d ( bc, bd );

  angle(1) = r8vec_angle_3d ( abc_normal, abd_normal );
  angle(2) = r8vec_angle_3d ( abc_normal, acd_normal );
  angle(3) = r8vec_angle_3d ( abd_normal, acd_normal );
  angle(4) = r8vec_angle_3d ( abc_normal, bcd_normal );
  angle(5) = r8vec_angle_3d ( abd_normal, bcd_normal );
  angle(6) = r8vec_angle_3d ( acd_normal, bcd_normal );

  angle(1:6) = pi - angle(1:6);

  return
end
function edge_length = tetrahedron_edge_length ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_EDGE_LENGTH returns edge lengths of a tetrahedron.
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
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real EDGE_LENGTH(6), the length of the edges.
%
  edge_length = zeros ( 6, 1 );
  
  k = 0;
  for j1 = 1 : 3
    for j2 = j1+1 : 4
      k = k + 1;
      edge_length(k) = r8vec_length ( 3, tetra(1:3,j2) - tetra(1:3,j1) );
    end
  end

  return
end
function [ ab, ac, ad, bc, bd, cd ] = tetrahedron_edges ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_EDGES computes the edges of a tetrahedron.
%
%  Discussion:
%
%    The vertices are A, B, C, D.  The edge from A to B is denoted by AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2014
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
%    Output, real AB(3), AC(3), AD(3), BC(3), BD(3), CD(3), the edges.
%
  ab(1:3) = tetra(1:3,2) - tetra(1:3,1);
  ac(1:3) = tetra(1:3,3) - tetra(1:3,1);
  ad(1:3) = tetra(1:3,4) - tetra(1:3,1);
  bc(1:3) = tetra(1:3,3) - tetra(1:3,2);
  bd(1:3) = tetra(1:3,4) - tetra(1:3,2);
  cd(1:3) = tetra(1:3,4) - tetra(1:3,3);

  return
end
function angles = tetrahedron_face_angles ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_FACE_ANGLES returns the 12 face angles of a tetrahedron.
%
%  Discussion:
%
%    The tetrahedron has 4 triangular faces.  This routine computes the
%    3 planar angles associated with each face.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real ANGLES(3,4), the face angles.
%

%
%  Face 123
%
  tri(1:3,1:3) = tetra(1:3,1:3);
  angles(1:3,1) = triangle_angles_3d ( tri );
%
%  Face 124
%
  tri(1:3,1:2) = tetra(1:3,1:2);
  tri(1:3,3) = tetra(1:3,4);
  angles(1:3,2) = triangle_angles_3d ( tri );
%
%  Face 134
%
  tri(1:3,1) = tetra(1:3,1);
  tri(1:3,2:3) = tetra(1:3,3:4);
  angles(1:3,3) = triangle_angles_3d ( tri );
%
%  Face 234
%
  tri(1:3,1:3) = tetra(1:3,2:4);
  angles(1:3,4) = triangle_angles_3d ( tri );

  return
end
function areas = tetrahedron_face_areas ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_FACE_AREAS returns the 4 face areas of a tetrahedron.
%
%  Discussion:
%
%    The tetrahedron has 4 triangular faces.  This routine computes the
%    area associated with each face.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real AREAS(4), the face areas.
%

%
%  Face 123
%
  tri(1:3,1:3) = tetra(1:3,1:3);
  areas(1) = triangle_area_3d ( tri );
%
%  Face 124
%
  tri(1:3,1:2) = tetra(1:3,1:2);
  tri(1:3,3) = tetra(1:3,4);
  areas(2) = triangle_area_3d ( tri );
%
%  Face 134
%
  tri(1:3,1) = tetra(1:3,1);
  tri(1:3,2:3) = tetra(1:3,3:4);
  areas(3) = triangle_area_3d ( tri );
%
%  Face 234
%
  tri(1:3,1:3) = tetra(1:3,2:4);
  areas(4) = triangle_area_3d ( tri );

  return
end
function [ r, pc ] = tetrahedron_insphere ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_INSPHERE finds the insphere of a tetrahedron.
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
%    Philip Schneider, David Eberly,
%    Geometric Tools for Computer Graphics,
%    Elsevier, 2002,
%    ISBN: 1558605940,
%    LC: T385.G6974.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real R, PC(3), the radius and the center
%    of the sphere.
%
  [ v21, v31, v41, v32, v42, v43 ] = tetrahedron_edges ( tetra );

  n123 = r8vec_cross_3d ( v21, v31 );
  n124 = r8vec_cross_3d ( v41, v21 );
  n134 = r8vec_cross_3d ( v31, v41 );
  n234 = r8vec_cross_3d ( v42, v32 );

  l123 = r8vec_length ( 3, n123 );
  l124 = r8vec_length ( 3, n124 );
  l134 = r8vec_length ( 3, n134 );
  l234 = r8vec_length ( 3, n234 );

  pc(1:3) = ( l234 * tetra(1:3,1)   ...
            + l134 * tetra(1:3,2)   ...
            + l124 * tetra(1:3,3)   ...
            + l123 * tetra(1:3,4) ) ...
          / ( l234 + l134 + l124 + l123 );

  b(1:3,1:4) = tetra(1:3,1:4);
  b(4,1:4) = 1.0;

  gamma = abs ( det ( b ) );

  r = gamma / ( l234 + l134 + l124 + l123 );

  return
end
function quality = tetrahedron_quality1 ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY1: "quality" of a tetrahedron.
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
  r_out = tetrahedron_circumsphere ( tetra );

  r_in = tetrahedron_insphere ( tetra );

  quality = 3.0 * r_in / r_out;

  return
end
function quality2 = tetrahedron_quality2 ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY2: "quality" of a tetrahedron.
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
  edge_length(1:6) = tetrahedron_edge_length ( tetra );

  l_max = max ( edge_length(1:6) );

  r_in = tetrahedron_insphere ( tetra );

  quality2 = 2.0 * sqrt ( 6.0 ) * r_in / l_max;

  return
end
function quality3 = tetrahedron_quality3 ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY3 computes the mean ratio of a tetrahedron.
%
%  Discussion:
%
%    This routine computes QUALITY3, the eigenvalue or mean ratio of
%    a tetrahedron.
%
%      QUALITY3 = 12 * ( 3 * volume )^(2/3) / (sum of square of edge lengths).
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

%
%  Compute the vectors representing the sides of the tetrahedron.
%
  [ ab, ac, ad, bc, bd, cd ] = tetrahedron_edges ( tetra );
%
%  Compute the squares of the lengths of the sides.
%
  lab = sum ( ab(1:3).^2 );
  lac = sum ( ac(1:3).^2 );
  lad = sum ( ad(1:3).^2 );
  lbc = sum ( bc(1:3).^2 );
  lbd = sum ( bd(1:3).^2 );
  lcd = sum ( cd(1:3).^2 );
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
function quality4 = tetrahedron_quality4 ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY4 computes the minimum solid angle of a tetrahedron.
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

%
%  Compute the vectors that represent the sides.
%
  [ ab, ac, ad, bc, bd, cd ] = tetrahedron_edges ( tetra );
%
%  Compute the lengths of the sides.
%
  lab = sqrt ( sum ( ab(1:3).^2 ) );
  lac = sqrt ( sum ( ac(1:3).^2 ) );
  lad = sqrt ( sum ( ad(1:3).^2 ) );
  lbc = sqrt ( sum ( bc(1:3).^2 ) );
  lbd = sqrt ( sum ( bd(1:3).^2 ) );
  lcd = sqrt ( sum ( cd(1:3).^2 ) );
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
function angle = tetrahedron_solid_angles ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_SOLID_ANGLES computes solid angles of a tetrahedron.
%
%  Modified:
%
%    07 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real ANGLE(4), the solid angles.
%
  dihedral_angles = tetrahedron_dihedral_angles ( tetra );

  angle(1) = dihedral_angles(1) + dihedral_angles(2) + dihedral_angles(3) - pi;
  angle(2) = dihedral_angles(1) + dihedral_angles(4) + dihedral_angles(5) - pi;
  angle(3) = dihedral_angles(2) + dihedral_angles(4) + dihedral_angles(6) - pi;
  angle(4) = dihedral_angles(3) + dihedral_angles(5) + dihedral_angles(6) - pi;

  return
end
function volume = tetrahedron_volume ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_VOLUME computes the volume of a tetrahedron.
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

  a(1:3,1:4) = tetra(1:3,1:4);
  a(4,1:4) = 1.0;

  volume = abs ( det ( a ) ) / 6.0;

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
function angle = triangle_angles_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ANGLES_3D computes the angles of a triangle in 3D.
%
%  Discussion:
%
%    The law of cosines is used:
%
%      C * C = A * A + B * B - 2 * A * B * COS ( GAMMA )
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
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real ANGLE(3), the angles opposite
%    sides P1-P2, P2-P3 and P3-P1, in radians.
%

%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:3,1) - t(1:3,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:3,2) - t(1:3,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:3,3) - t(1:3,1) ).^2 ) );
%
%  Take care of a special case.
%
  if ( a == 0.0 && b == 0.0 && c == 0.0 )
    angle(1:3) = 2.0 * pi / 3.0;
    return
  end

  if ( c == 0.0 || a == 0.0 )
    angle(1) = pi;
  else
    angle(1) = r8_acos ( ( c * c + a * a - b * b ) / ( 2.0 * c * a ) );
  end

  if ( a == 0.0 || b == 0.0 )
    angle(2) = pi;
  else
    angle(2) = r8_acos ( ( a * a + b * b - c * c ) / ( 2.0 * a * b ) );
  end

  if ( b == 0.0 || c == 0.0 )
    angle(3) = pi;
  else
    angle(3) = r8_acos ( ( b * b + c * c - a * a ) / ( 2.0 * b * c ) );
  end

  return
end
function area = triangle_area_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_3D computes the area of a triangle in 3D.
%
%  Discussion:
%
%    This routine uses the fact that the norm of the cross product vector
%    is the area of the parallelogram they form.  The triangle they
%    form has half that area.
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
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%

%
%  Compute the cross product vector.
%
  cross(1) = ( t(2,2) - t(2,1) ) * ( t(3,3) - t(3,1) ) ...
           - ( t(3,2) - t(3,1) ) * ( t(2,3) - t(2,1) );

  cross(2) = ( t(3,2) - t(3,1) ) * ( t(1,3) - t(1,1) ) ...
           - ( t(1,2) - t(1,1) ) * ( t(3,3) - t(3,1) );

  cross(3) = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
           - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) );

  area = 0.5 * sqrt ( sum ( cross(1:3).^2 ) );

  return
end
