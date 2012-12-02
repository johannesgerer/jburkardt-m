function table_voronoi ( file_name )

%*****************************************************************************80
%
%% MAIN is the main program for TABLE_VORONOI.
%
%  Discussion:
%
%    TABLE_VORONOI uses GEOMPACK to get some Voronoi diagram information.
%
%  Usage:
%
%    table_voronoi file_name
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input or command line argument, string FILE_NAME, the name of a file 
%    containing the coordinates of a point set to be analyzed.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_VORONOI\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  This program is given the coordinates of a set of\n' );
  fprintf ( 1, '  points in the plane, calls GEOMPACK to determine the\n' );
  fprintf ( 1, '  Delaunay triangulation of those points, and then\n' );
  fprintf ( 1, '  digests that data to produce information defining\n' );
  fprintf ( 1, '  the Voronoi diagram.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The input file contains the following data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    G_NUM:    the number of generators;\n' );
  fprintf ( 1, '    G_XY:     the (X,Y) coordinates of the generators.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The computed Voronoi information includes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    G_DEGREE: the degree of each Voronoi cell;\n' );
  fprintf ( 1, '    G_START:  the index of the first Voronoi vertex;\n' );
  fprintf ( 1, '    G_FACE:   the list of all Voronoi vertices;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    V_NUM:    the number of (finite) Voronoi vertices;\n' );
  fprintf ( 1, ...
    '    V_XY:     the (X,Y) coordinates of the Voronoi vertices;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    I_NUM:    the number of Voronoi vertices at infinity;\n' );
  fprintf ( 1, '    I_XY:     the directions associated with the Voronoi\n' );
  fprintf ( 1, '              vertices at infinity.\n' );
%
%  If at least one command line argument, it's the input file name.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    file_name = input ( '  Enter the generator file name.' );
  end

  [ g_num, g_xy, g_degree, g_start, g_face, v_num, v_xy, i_num, ...
  i_xy ] = handle_file ( file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_VORONOI\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = diaedg ( x0, y0, x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% DIAEDG chooses a diagonal edge.
%
%  Discussion:
%
%    The routine determines whether 0--2 or 1--3 is the diagonal edge
%    that should be chosen, based on the circumcircle criterion, where
%    (X0,Y0), (X1,Y1), (X2,Y2), (X3,Y3) are the vertices of a simple
%    quadrilateral in counterclockwise order.
%
%  Modified:
%
%    07 February 2005
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
%    Input, real X0, Y0, X1, Y1, X2, Y2, X3, Y3, the
%    coordinates of the vertices of a quadrilateral, given in
%    counter clockwise order.
%
%    Output, integer VALUE, chooses a diagonal:
%    +1, if diagonal edge 02 is chosen;
%    -1, if diagonal edge 13 is chosen;
%     0, if the four vertices are cocircular.
%
  tol = 100.0 * eps;

  dx10 = x1 - x0;
  dy10 = y1 - y0;
  dx12 = x1 - x2;
  dy12 = y1 - y2;
  dx30 = x3 - x0;
  dy30 = y3 - y0;
  dx32 = x3 - x2;
  dy32 = y3 - y2;

  tola = tol * max ( abs ( dx10 ), ...
               max ( abs ( dy10 ), ...
               max ( abs ( dx30 ), abs ( dy30 ) )));
           
  tolb = tol * max ( abs ( dx12 ), ...
               max ( abs ( dy12 ), ...
               max ( abs ( dx32 ), abs ( dy32 ) )));

  ca = dx10 * dx30 + dy10 * dy30;
  cb = dx12 * dx32 + dy12 * dy32;

  if ( tola < ca & tolb < cb )

    value = -1;

  elseif ( ca < -tola & cb < -tolb )

    value = 1;

  else

    tola = max ( tola, tolb );
    s = ( dx10 * dy30 - dx30 * dy10 ) * cb ...
      + ( dx32 * dy12 - dx12 * dy32 ) * ca;

    if ( tola < s )
      value = -1;
    elseif ( s < -tola )
      value = 1;
    else
      value = 0;
    end

  end

  return
end
function [ tri_num, tri_vert, tri_nabe ] = dtris2 ( point_num, p )

%*****************************************************************************80
%
%% DTRIS2 constructs a Delaunay triangulation of 2D vertices.
%
%  Discussion:
%
%    The routine constructs the Delaunay triangulation of a set of 2D vertices
%    using an incremental approach and diagonal edge swaps.  Vertices are
%    first sorted in lexicographically increasing (X,Y) order, and
%    then are inserted one at a time from outside the convex hull.
%
%  Modified:
%
%    07 February 2005
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
%    Input, integer POINT_NUM, the number of vertices.
%
%    Input, real P(2,POINT_NUM), the vertices.
%
%    Output, integer TRI_NUM, the number of triangles in the triangulation;
%    TRI_NUM is equal to 2*POINT_NUM - NB - 2, where NB is the number
%    of boundary vertices.
%
%    Output, integer TRI_VERT(3,TRI_NUM), the nodes that make up each triangle.
%    The elements are indices of P.  The vertices of the triangles are
%    in counter clockwise order.
%
%    Output, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list.
%    Positive elements are indices of TIL; negative elements are used for links
%    of a counter clockwise linked list of boundary edges; LINK = -(3*I + J-1)
%    where I, J = triangle, edge index; TRI_NABE(J,I) refers to
%    the neighbor along edge from vertex J to J+1 (mod 3).
%
  tri_num = 0;
  tri_vert = [];
  tri_nabe = [];

  tol = 100.0 * eps;
%
%  Sort the vertices by increasing (x,y).
%
  indx = r82vec_sort_heap_index_a ( point_num, p );

  p = r82vec_permute ( point_num, p, indx );
%
%  Make sure that the data points are "reasonably" distinct.
%
  m1 = 1;

  for i = 2 : point_num

    m = m1;
    m1 = i;

    k = 0;

    for j = 1 : 2

      cmax = max ( abs ( p(j,m) ), abs ( p(j,m1) ) );

      if ( tol * ( cmax + 1.0 ) < abs ( p(j,m) - p(j,m1) ) )
        k = j;
        break
      end

    end

    if ( k == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DTRIS2 - Fatal error!\n' );
      fprintf ( 1, '  Fails for point number I = %d\n', i );
      fprintf ( 1, '  M = %d\n', m );
      fprintf ( 1, '  M1 = %d\n', m1 );
      fprintf ( 1, '  X,Y(M)  = %f  %f\n', p(1,m), p(2,m) );
      fprintf ( 1, '  X,Y(M1) = %f  %f\n', p(1,m1), p(2,m1) );
      error ( 'DTRIS2 - Fatal error!' )
      return
    end

  end
%
%  Starting from points M1 and M2, search for a third point M that
%  makes a "healthy" triangle (M1,M2,M)
%
  m1 = 1;
  m2 = 2;
  j = 3;

  while ( 1 )

    if ( point_num < j )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DTRIS2 - Fatal error!\n' );
      error ( 'DTRIS2 - Fatal error!' )
      return
    end

    m = j;

    lr = lrline ( p(1,m), p(2,m), p(1,m1), p(2,m1), p(1,m2), p(2,m2), 0.0 );

    if ( lr ~= 0 )
      break
    end

    j = j + 1;

  end
%
%  Set up the triangle information for (M1,M2,M), and for any other
%  triangles you created because points were collinear with M1, M2.
%
  tri_num = j - 2;

  if ( lr == -1 )

    tri_vert(1,1) = m1;
    tri_vert(2,1) = m2;
    tri_vert(3,1) = m;
    tri_nabe(3,1) = -3;

    for i = 2 : tri_num

      m1 = m2;
      m2 = i+1;
      tri_vert(1,i) = m1;
      tri_vert(2,i) = m2;
      tri_vert(3,i) = m;
      tri_nabe(1,i-1) = -3 * i;
      tri_nabe(2,i-1) = i;
      tri_nabe(3,i) = i - 1;

    end

    tri_nabe(1,tri_num) = -3 * tri_num - 1;
    tri_nabe(2,tri_num) = -5;
    ledg = 2;
    ltri = tri_num;

  else

    tri_vert(1,1) = m2;
    tri_vert(2,1) = m1;
    tri_vert(3,1) = m;
    tri_nabe(1,1) = -4;

    for i = 2 : tri_num
      m1 = m2;
      m2 = i+1;
      tri_vert(1,i) = m2;
      tri_vert(2,i) = m1;
      tri_vert(3,i) = m;
      tri_nabe(3,i-1) = i;
      tri_nabe(1,i) = -3 * i - 3;
      tri_nabe(2,i) = i - 1;
    end

    tri_nabe(3,tri_num) = -3 * tri_num;
    tri_nabe(2,1) = -3 * tri_num - 2;
    ledg = 2;
    ltri = 1;

  end
%
%  Insert the vertices one at a time from outside the convex hull,
%  determine visible boundary edges, and apply diagonal edge swaps until
%  Delaunay triangulation of vertices (so far) is obtained.
%
  top = 0;

  for i = j+1 : point_num

    m = i;
    m1 = tri_vert(ledg,ltri);

    if ( ledg <= 2 )
      m2 = tri_vert(ledg+1,ltri);
    else
      m2 = tri_vert(1,ltri);
    end

    lr = lrline ( p(1,m), p(2,m), p(1,m1), p(2,m1), p(1,m2), p(2,m2), 0.0 );

    if ( 0 < lr ) 
      rtri = ltri;
      redg = ledg;
      ltri = 0;
    else
      l = -tri_nabe(ledg,ltri);
      rtri = floor ( l / 3 );
      redg = mod(l,3) + 1;
    end

    [ ltri, ledg, rtri, redg ] = vbedg ( p(1,m), p(2,m), point_num, p, ...
      tri_num, tri_vert, tri_nabe, ltri, ledg, rtri, redg );

    n = tri_num + 1;
    l = -tri_nabe(ledg,ltri);

    while ( 1 )

      t = floor ( l / 3 );
      e = mod ( l, 3 ) + 1;
      l = -tri_nabe(e,t);
      m2 = tri_vert(e,t);

      if ( e <= 2 )
        m1 = tri_vert(e+1,t);
      else
        m1 = tri_vert(1,t);
      end

      tri_num = tri_num + 1;
      tri_nabe(e,t) = tri_num;
      tri_vert(1,tri_num) = m1;
      tri_vert(2,tri_num) = m2;
      tri_vert(3,tri_num) = m;
      tri_nabe(1,tri_num) = t;
      tri_nabe(2,tri_num) = tri_num - 1;
      tri_nabe(3,tri_num) = tri_num + 1;
      top = top + 1;

      if ( point_num < top )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DTRIS2 - Fatal error!\n' );
        fprintf ( 1, '  Stack overflow.\n' );
        error ( 'DTRIS2 - Fatal error!' )
      end

      work(top) = tri_num;

      if ( t == rtri & e == redg )
        break
      end

    end

    tri_nabe(ledg,ltri) = -3 * n - 1;
    tri_nabe(2,n) = -3 * tri_num - 2;
    tri_nabe(3,tri_num) = -l;
    ltri = n;
    ledg = 2;

    [ top, ltri, ledg, tri_vert, tri_nabe ] = swapec ( ...
      m, top, ltri, ledg, point_num, p, tri_num, tri_vert, tri_nabe, work );

  end
%
%  Now account for the sorting that we did.
%
  for i = 1 : 3
    for j = 1 : tri_num
      tri_vert(i,j) = indx ( tri_vert(i,j) );
    end
  end

  indx = perm_inverse ( point_num, indx );

  p = r82vec_permute ( point_num, p, indx );

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
%    08 February 2010
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
    return
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
%    08 February 2010
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
function [ g_num, g_xy, g_degree, g_start, g_face, v_num, v_xy, i_num, ...
  i_xy ] = handle_file ( file_name )

%*****************************************************************************80
%
%% HANDLE_FILE computes Voronoi information for a given set of data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of an XY file whose data
%    is to be read and processed.
%
%  Parameters:
%
%    Output, integer G_NUM, the number of generators.
%
%    Output, real G_XY(2,G_NUM), the point coordinates.
%
%    Output, integer G_DEGREE(G_NUM), the degree of each Voronoi
%    cell.
%
%    Output, integer G_START(G_NUM), the index in G_FACE of the
%    first vertex at which to begin a traversal of the boundary of the
%    cell associated with each point.
%
%    Output, integer G_FACE(6*G_NUM), the sequence of vertices to
%    be used in a traversal of the boundary of the cell associated with each
%    point.
%
%    Output, integer V_NUM, the number of vertices of the Voronoi
%    diagram.
%
%    Output, real V_XY(2,V_NUM), the coordinates of the vertices
%    of the Voronoi diagram.
%
%    Output, integer I_NUM, the number of vertices at infinity of the
%    Voronoi diagram.
%
%    Output, real I_XY(2,I_NUM), the direction of the
%    vertices at infinity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HANDLE_FILE\n' );
  fprintf ( 1, '  Read the TABLE file "%s".\n', file_name );

  [ m, g_num ] = r8mat_header_read ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The header has been read.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension of the data M = %d\n', m );
  fprintf ( 1, '  The number of generators, G_NUM = %d\n', g_num );

  if ( m ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HANDLE - Fatal error!\n' );
    fprintf ( 1, '  The input spatial dimension is not 2.\n' );
    error ( 'HANDLE - Fatal error!' );
  end

  g_xy = r8mat_data_read ( file_name, m, g_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data has been read.\n' );

  r8mat_transpose_print ( m, g_num, g_xy, '  The generators' );

  [ g_degree, g_start, g_face, v_num, v_xy, i_num, i_xy ] = voronoi_data ( ...
    g_num, g_xy )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  G_START: The index of the first Voronoi vertex\n' );
  fprintf ( 1, '  G_FACE: The Voronoi vertices\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   G  G_START  G_FACE\n' );
  for j = 1 : g_num

    k = g_start(j);
    fprintf ( 1, '\n' );
    fprintf ( 1, '%8d     %8d  %8d\n', j, k, g_face(k) );
    for i = 2 : g_degree(j)
      k = k + 1;
      fprintf ( 1, '                       %8d\n', g_face(k) );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  V_NUM: Number of Voronoi vertices = %d\n', v_num );

  r8mat_transpose_print ( m, v_num, v_xy, '  Voronoi vertices:' );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  I_NUM: Number of Voronoi vertices at infinity = %d\n', ...
    i_num );

  r8mat_transpose_print ( m, i_num, i_xy, '  Directions at infinity:' );

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
function value = i4_sign ( i )

%*****************************************************************************80
%
%% I4_SIGN returns the sign of an integer.
%
%  Discussion:
%
%    The value is +1 if the number is positive or zero, and it is -1 otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose sign is desired.
%
%    Output, integer VALUE, the sign of I.
%
  if ( 0 <= i )
    value = +1;
  else
    value = -1;
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
function i4mat_transpose_print ( m, n, a, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT prints an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
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
%    Input, string TITLE, a title.
%
  i4mat_transpose_print_some ( m, n, a, 1, 1, m, n, title );

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
%    10 September 2009
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
%    Input, string TITLE, a title.
%
  incx = 10;

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
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d: ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function  a = i4vec_indicator ( n )

%*****************************************************************************80
%
%% I4VEC_INDICATOR sets an I4VEC to the indicator vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Output, integer A(N), the vector with entries (1, 2, ..., N ).
%
  a = ( 1 : n );

  return
end
function [ xmin, index ] = i4vec_min ( n, x )

%*****************************************************************************80
%
%% I4VEC_MIN returns the minimum value of an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer X(N), the array.
%
%    Output, integer XMIN, the value of the smallest entry.
%
%    Output, integer INDEX, the index of the smallest entry.
%
  if ( n <= 0 )

    index = 0;
    xmin = 0.0;

  else

    xmin = x(1);
    index = 1;
    for i = 2 : n
      if ( x(i) < xmin )
        xmin = x(i);
        index = i;
      end 
    end

  end

  return
end
function i4vec_print ( n, a, title )

%*****************************************************************************80
%
%% I4VEC_PRINT prints an I4VEC.
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
%    Input, integer A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%6d: %6d\n', i, a(i) );
  end

  return
end
function normal = line_exp_normal_2d ( p1, p2 )

%*****************************************************************************80
%
%% LINE_EXP_NORMAL_2D computes a unit normal vector to a line in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      the line through the points P1 and P2.
%
%    The sign of the normal vector N is chosen so that the normal vector
%    points "to the left" of the direction of the line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), two points on the line.
%
%    Output, real NORMAL(2), a unit normal vector to the line.
%
  dim_num = 2;

  norm = sqrt ( ( p2(1) - p1(1) ).^2 + ( p2(2) - p1(2) ).^2 );

  if ( norm == 0.0 )
    normal(1:dim_num) = sqrt ( 2.0 );
    return
  end

  normal(1) =   ( p2(2) - p1(2) ) / norm;
  normal(2) = - ( p2(1) - p1(1) ) / norm;

  return
end
function value = lrline ( xu, yu, xv1, yv1, xv2, yv2, dv )

%*****************************************************************************80
%
%% LRLINE determines if a point is left of, right or, or on a directed line.
%
%  Discussion:
%
%    The directed line is parallel to, and at a signed distance DV from
%    a directed base line from (XV1,YV1) to (XV2,YV2).
%
%  Modified:
%
%    07 February 2005
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
%    Input, real XU, YU, the coordinates of the point whose
%    position relative to the directed line is to be determined.
%
%    Input, real XV1, YV1, XV2, YV2, the coordinates of two points
%    that determine the directed base line.
%
%    Input, real DV, the signed distance of the directed line
%    from the directed base line through the points (XV1,YV1) and (XV2,YV2).
%    DV is positive for a line to the left of the base line.
%
%    Output, integer VALUE, the result:
%    +1, the point is to the right of the directed line;
%     0, the point is on the directed line;
%    -1, the point is to the left of the directed line.
%
  tol = 100.0 * eps;

  dx = xv2 - xv1;
  dy = yv2 - yv1;
  dxu = xu - xv1;
  dyu = yu - yv1;

  tolabs = tol * max ( abs ( dx ), ...
                 max ( abs ( dy ), ...
                 max ( abs ( dxu ), ...
                 max ( abs ( dyu ), abs ( dv ) ) ) ) );

  t = dy * dxu - dx * dyu + dv * sqrt ( dx * dx + dy * dy );

  if ( tolabs < t )
    value = 1;
  elseif ( -tolabs <= t )
    value = 0;
  else
    value = -1;
  end

  return
end
function p = perm_inverse ( n, p )

%*****************************************************************************80
%
%% PERM_INVERSE inverts a permutation "in place".
%
%  Discussion:
%
%    This algorithm assumes that the entries in the permutation vector are
%    strictly positive.  In particular, the value 0 must not occur.
%
%    When necessary, this function shifts the data temporarily so that
%    this requirement is satisfied.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%
%    Output, integer P(N), the inverse permutation.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'PERM_INVERSE - Fatal error!' );
  end
%
%  Find the least value, and shift data so it begins at 1.
%
  p_min = i4vec_min ( n, p );
  base = 1;
  p(1:n) = p(1:n) - p_min + base;
%
%  Check the permutation.
%
% ierror = perm_check ( n, p, base );

% if ( ierror )
%   fprintf ( 1, '\n' );
%   fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
%   fprintf ( 1, '  The input array does not represent\n' );
%   fprintf ( 1, '  a proper permutation.  In particular, the\n' );
%   fprintf ( 1, '  array is missing the value %d\n', ierror );
%   error ( 'PERM_INVERSE - Fatal error!' );
% end
%
%  Invert the permutation.
%
  is = 1;

  for i = 1 : n

    i1 = p(i);

    while ( i < i1 )
      i2 = p(i1);
      p(i1) = -i2;
      i1 = i2;
    end

    is = -i4_sign ( p(i) );
    p(i) = i4_sign ( is ) * abs ( p(i) );

  end

  for i = 1 : n

    i1 = -p(i);

    if ( 0 <= i1 )

      i0 = i;

      while ( 1 )

        i2 = p(i1);
        p(i1) = i0;

        if ( i2 < 0 )
          break;
        end

        i0 = i1;
        i1 = i2;

      end

    end

  end
%
%  Reverse the shift.
%
  p(1:n) = p(1:n) + p_min - base;

  return
end
function a = r82vec_permute ( n, a, p )

%*****************************************************************************80
%
%% R82VEC_PERMUTE permutes an R82VEC in place.
%
%  Discussion:
%
%    This routine permutes an array of real "objects", but the same
%    logic can be used to permute an array of objects of any arithmetic
%    type, or an array of objects of any complexity.  The only temporary
%    storage required is enough to store a single object.  The number
%    of data movements made is N + the number of cycles of order 2 or more,
%    which is never more than N + N/2.
%
%  Example:
%
%    Input:
%
%      N = 5
%      P = (   2,    4,    5,    1,    3 )
%      A = ( 1.0,  2.0,  3.0,  4.0,  5.0 )
%          (11.0, 22.0, 33.0, 44.0, 55.0 )
%
%    Output:
%
%      A    = (  2.0,  4.0,  5.0,  1.0,  3.0 )
%             ( 22.0, 44.0, 55.0, 11.0, 33.0 ).
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
%    Input, integer N, the number of objects.
%
%    Input, real A(2,N), the array to be permuted.
%
%    Input, integer P(N), the permutation.  P(I) = J means
%    that the I-th element of the output array should be the J-th
%    element of the input array.  P must be a legal permutation
%    of the integers from 1 to N, otherwise the algorithm will
%    fail catastrophically.
%
%    Output, real A(2,N), the permuted array.
%

%
%  Search for the next element of the permutation that has not been used.
%
  for istart = 1 : n

    if ( p(istart) < 0 )

      continue

    elseif ( p(istart) == istart )

      p(istart) = - p(istart);
      continue

    else

      a_temp(1:2) = a(1:2,istart);
      iget = istart;
%
%  Copy the new value into the vacated entry.
%
      while ( 1 )

        iput = iget;
        iget = p(iget);

        p(iput) = - p(iput);

        if ( iget < 1 | n < iget )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'R82VEC_PERMUTE - Fatal error!\n' );
          fprintf ( 1, '  A permutation index is out of range.\n' );
          fprintf ( 1, '  P(%d) = %d\n', iput, iget );
          error ( 'R82VEC_PERMUTE - Fatal error!' );
        end

        if ( iget == istart )
          a(1:2,iput) = a_temp(1:2)';
          break
        end

        a(1:2,iput) = a(1:2,iget);

      end

    end

  end
%
%  Restore the signs of the entries.
%
% p(1:n) = -p(1:n);

  return
end
function indx = r82vec_sort_heap_index_a ( n, a )

%*****************************************************************************80
%
%% R82VEC_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R82VEC.
%
%  Discussion:
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(1:2,INDX(I)), I = 1 to N is sorted,
%
%    or explicitly, by the call
%
%      A = R82VEC_PERMUTE ( N, A, INDX )
%
%    after which A(1:2,I), I = 1 to N is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(2,N), an array to be index-sorted.
%
%    Output, integer INDX(N), the sort index.  The
%    I-th element of the sorted array is A(1:2,INDX(I)).
%
  if ( n < 1 )
    return
  end

  if ( n == 1 )
    indx(1) = 1;
    return
  end

  indx = i4vec_indicator ( n );

  l = floor ( n / 2 ) + 1;
  ir = n;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      aval(1:2) = a(1:2,indxt);

    else

      indxt = indx(ir);
      aval(1:2) = a(1:2,indxt);
      indx(ir) = indx(1);
      ir = ir - 1;

      if ( ir == 1 )
        indx(1) = indxt;
        break
      end

    end

    i = l;
    j = l + l;

    while ( j <= ir )

      if ( j < ir )
        if (   a(1,indx(j)) <  a(1,indx(j+1)) | ...
             ( a(1,indx(j)) == a(1,indx(j+1)) & ...
               a(2,indx(j)) <  a(2,indx(j+1)) ) )
          j = j + 1;
        end
      end

      if (   aval(1) <  a(1,indx(j)) | ...
           ( aval(1) == a(1,indx(j)) & ...
             aval(2) <  a(2,indx(j)) ) )
        indx(i) = indx(j);
        i = j;
        j = j + j;
      else
        j = ir + 1;
      end

    end

    indx(i) = indxt;

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
%    10 September 2009
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
%    Input, string TITLE, a title.
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
%    10 September 2009
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
%    Input, string TITLE, a title.
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

      fprintf ( 1, '%5d:', j );
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
function [ top, btri, bedg, tri_vert, tri_nabe ] = swapec ( ...
  i, top, btri, bedg, point_num, p, tri_num, tri_vert, tri_nabe, work )

%*****************************************************************************80
%
%% SWAPEC swaps diagonal edges until all triangles are Delaunay.
%
%  Discussion:
%
%    The routine swaps diagonal edges in a 2D triangulation, based on
%    the empty circumcircle criterion, until all triangles are Delaunay,
%    given that I is the index of the new vertex added to the triangulation.
%
%  Modified:
%
%    07 February 2005
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
%    Input, integer I, the index of the new vertex.
%
%    Input/output, integer TOP, the index of the top of the stack.
%    On output, TOP is zero.
%
%    Input/output, integer BTRI, BEDG; on input, if positive, are the
%    triangle and edge indices of a boundary edge whose updated indices
%    must be recorded.  On output, these may be updated because of swaps.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real P(2,POINT_NUM), the coordinates of
%    the points.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input/output, integer TRI_VERT(3,TRI_NUM), the triangle incidence list.  
%    May be updated on output because of swaps.
%
%    Input/output, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list; 
%    negative values are used for links of the counter-clockwise linked 
%    list of boundary edges;  May be updated on output because of swaps.
%
%      LINK = -(3*I + J-1) where I, J = triangle, edge index.
%
%    Workspace, integer WORK(MAXST); on input, entries 1 through TOP
%    contain the indices of initial triangles (involving vertex I)
%    put in stack; the edges opposite I should be in interior;  entries
%    TOP+1 through MAXST are used as a stack.
%

%
%  Determine whether triangles in stack are Delaunay, and swap
%  diagonal edge of convex quadrilateral if not.
%
  x = p(1,i);
  y = p(2,i);

  while ( 1 )

    if ( top <= 0 )
      break
    end

    t = work(top);
    top = top - 1;

    if ( tri_vert(1,t) == i )
      e = 2;
      b = tri_vert(3,t);
    elseif ( tri_vert(2,t) == i )
      e = 3;
      b = tri_vert(1,t);
    else
      e = 1;
      b = tri_vert(2,t);
    end

    a = tri_vert(e,t);
    u = tri_nabe(e,t);

    if ( tri_nabe(1,u) == t )
      f = 1;
      c = tri_vert(3,u);
    elseif ( tri_nabe(2,u) == t )
      f = 2;
      c = tri_vert(1,u);
    else
      f = 3;
      c = tri_vert(2,u);
    end

    swap = diaedg ( x, y, p(1,a), p(2,a), p(1,c), p(2,c), p(1,b), p(2,b) );

    if ( swap == 1 )

      em1 = i4_wrap ( e - 1, 1, 3 );
      ep1 = i4_wrap ( e + 1, 1, 3 );
      fm1 = i4_wrap ( f - 1, 1, 3 );
      fp1 = i4_wrap ( f + 1, 1, 3 );

      tri_vert(ep1,t) = c;
      tri_vert(fp1,u) = i;
      r = tri_nabe(ep1,t);
      s = tri_nabe(fp1,u);
      tri_nabe(ep1,t) = u;
      tri_nabe(fp1,u) = t;
      tri_nabe(e,t) = s;
      tri_nabe(f,u) = r;

      if ( 0 < tri_nabe(fm1,u) )
        top = top + 1;
        work(top) = u;
      end

      if ( 0 < s )

        if ( tri_nabe(1,s) == u )
          tri_nabe(1,s) = t;
        elseif ( tri_nabe(2,s) == u )
          tri_nabe(2,s) = t;
        else
          tri_nabe(3,s) = t;
        end

        top = top + 1;

        if ( point_num < top )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'SWAPEC - Fatal error!\n' );
          fprintf ( 1, '  Exceeded stacksize.\n' );
          error ( 'SWAPEC - Fatal error!' );
        end

        work(top) = t;

      else

        if ( u == btri & fp1 == bedg )
          btri = t;
          bedg = e;
        end

        l = - ( 3 * t + e - 1 );
        tt = t;
        ee = em1;

        while ( 0 < tri_nabe(ee,tt) )

          tt = tri_nabe(ee,tt);

          if ( tri_vert(1,tt) == a )
            ee = 3;
          elseif ( tri_vert(2,tt) == a )
            ee = 1;
          else
            ee = 2;
          end

        end

        tri_nabe(ee,tt) = l;

      end

      if ( 0 < r )

        if ( tri_nabe(1,r) == t )
          tri_nabe(1,r) = u;
        elseif ( tri_nabe(2,r) == t )
          tri_nabe(2,r) = u;
        else
          tri_nabe(3,r) = u;
        end

      else

        if ( t == btri & ep1 == bedg )
          btri = u;
          bedg = f;
        end

        l = - ( 3 * u + f - 1 );
        tt = u;
        ee = fm1;

        while ( 0 < tri_nabe(ee,tt) )

          tt = tri_nabe(ee,tt);

          if ( tri_vert(1,tt) == b )
            ee = 3;
          elseif ( tri_vert(2,tt) == b )
            ee = 1;
          else
            ee = 2;
          end

        end

        tri_nabe(ee,tt) = l;

      end

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
function [ v_inf, nodtri ] = tri_augment ( v_num, nodtri )

%*****************************************************************************80
%
%% TRI_AUGMENT augments the triangle data using vertices at infinity.
%
%  Discussion:
%
%    The algorithm simply looks at the list of triangle edges stored
%    in NODTRI, and determines which edges, of the form (P1,P2), do
%    not have a matching (P2,P1) occurrence.  These correspond to
%    boundary edges of the convex hull.  To simplify our computations,
%    we adjust the NODTRI array to accommodate an extra triangle with
%    one vertex at infinity for each such unmatched edge.
%
%    The algorithm used here is ruinously inefficient for large V_NUM.
%    Assuming that this data structure modification is the way to go,
%    the routine should be rewritten to determine the boundary edges
%    more efficiently.
%
%    The fictitious vertices at infinity show up in the augmenting
%    rows of the NODTRI array with negative indices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer V_NUM, the number of Voronoi vertices.
%
%    Input, integer NODTRI(3,V_NUM), the list of nodes that
%    comprise each Delaunay triangle.  On input, there are V_NUM
%    sets of this data.  On output, for every pair of nodes (P1,P2)
%    for which the pair (P2,P1) does not occur, an augmenting triangle
%    has been created with exactly this edge (plus a vertex at infinity).
%    On output, there are V_NUM + V_INF sets of data.
%
%    Output, integer V_INF, the number of augmenting triangles and
%    vertices at infinity that were created.
%
%    Output, integer NODTRI(3,V_NUM+V_INF), the list of 
%    nodes that comprise each Delaunay triangle.  On output, for every pair 
%    of nodes (P1,P2) for which the pair (P2,P1) does not occur, an augmenting 
%    triangle has been created with exactly this edge (plus a vertex at 
%    infinity).
%
  v_inf = 0;

  for v = 1 : v_num
    for i = 1 : 3

      s = nodtri(i,v);
      ip1 = i4_wrap ( i + 1, 1, 3 );
      t = nodtri(ip1,v);

      found = 0;

      for v2 = 1 : v_num

        for i2 = 1 : 3
          s2 = nodtri(i2,v2);
          ip1 = i4_wrap ( i2 + 1, 1, 3 );
          t2 = nodtri(ip1,v2);
          if ( s == t2 && t == s2 )
            found = 1;
            break
          end
        end

        if ( found )
          break
        end

      end

      if ( ~found )
        v_inf = v_inf + 1;
        nodtri(1:3,v_num+v_inf) = [ -v_inf; t; s ];
      end

    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRI_AUGMENT:\n' );
  fprintf ( 1, '  Number of boundary triangles = %d\n', v_inf );

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
function center = triangle_circumcenter_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCENTER_2D computes the circumcenter of a triangle in 2D.
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
%    09 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTER(2), the circumcenter of the triangle.
%
  dim_num = 2;

  f(1) = ( t(1,2) - t(1,1) ).^2 + ( t(2,2) - t(2,1) ).^2;
  f(2) = ( t(1,3) - t(1,1) ).^2 + ( t(2,3) - t(2,1) ).^2;
  
  top(1) =    ( t(2,3) - t(2,1) ) * f(1) - ( t(2,2) - t(2,1) ) * f(2);
  top(2) =  - ( t(1,3) - t(1,1) ) * f(1) + ( t(1,2) - t(1,1) ) * f(2);

  det  =    ( t(2,3) - t(2,1) ) * ( t(1,2) - t(1,1) ) ...
          - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) ) ;

  center(1:2) = t(1:2,1)' + 0.5 * top(1:2) / det;

  return
end
function [ ltri, ledg, rtri, redg ] = vbedg ( x, y, point_num, p, tri_num, ...
  tri_vert, tri_nabe, ltri, ledg, rtri, redg )

%*****************************************************************************80
%
%% VBEDG determines which boundary edges are visible to a point.
%
%  Discussion:
%
%    The point (X,Y) is assumed to be outside the convex hull of the
%    region covered by the 2D triangulation.
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
%  Modified:
%
%    07 February 2005
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point outside the
%    convex hull of the current triangulation.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real P(2,POINT_NUM), the coordinates of the
%    vertices.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer TRI_VERT(3,TRI_NUM), the triangle incidence list.
%
%    Input, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list; negative
%    values are used for links of a counter clockwise linked list of boundary
%    edges;
%      LINK = -(3*I + J-1) where I, J = triangle, edge index.
%
%    Input/output, integer LTRI, LEDG.  If LTRI /= 0 then these values are
%    assumed to be already computed and are not changed, else they are updated.
%    On output, LTRI is the index of boundary triangle to the left of the
%    leftmost boundary triangle visible from (X,Y), and LEDG is the boundary
%    edge of triangle LTRI to the left of the leftmost boundary edge visible
%    from (X,Y).  1 <= LEDG <= 3.
%
%    Input/output, integer RTRI.  On input, the index of the boundary triangle
%    to begin the search at.  On output, the index of the rightmost boundary
%    triangle visible from (X,Y).
%
%    Input/output, integer REDG, the edge of triangle RTRI that is visible
%    from (X,Y).  1 <= REDG <= 3.
%
  ndim = 2;
%
%  Find the rightmost visible boundary edge using links, then possibly
%  leftmost visible boundary edge using triangle neighbor information.
%
  if ( ltri == 0 )
    ldone = 0;
    ltri = rtri;
    ledg = redg;
  else
    ldone = 1;
  end

  while ( 1 )

    l = -tri_nabe(redg,rtri);
    t = floor ( l / 3 );
    e = mod ( l, 3 ) + 1;
    a = tri_vert(e,t);

    if ( e <= 2 )
      b = tri_vert(e+1,t);
    else
      b = tri_vert(1,t);
    end

    lr = lrline ( x, y, p(1,a), p(2,a), p(1,b), p(2,b), 0.0 );

    if ( lr <= 0 )
      break;
    end

    rtri = t;
    redg = e;

  end

  if ( ldone )
    return
  end

  t = ltri;
  e = ledg;

  while ( 1 )

    b = tri_vert(e,t);
    e = i4_wrap ( e-1, 1, 3 );

    while ( 0 < tri_nabe(e,t) )

      t = tri_nabe(e,t);

      if ( tri_vert(1,t) == b )
        e = 3;
      elseif ( tri_vert(2,t) == b )
        e = 1;
      else
        e = 2;
      end

    end

    a = tri_vert(e,t);

    lr = lrline ( x, y, p(1,a), p(2,a), p(1,b), p(2,b), 0.0 );

    if ( lr <= 0 )
      break
    end

  end

  ltri = t;
  ledg = e;

  return
end
function [ g_degree, g_start, g_face, v_num, v_xy, i_num, i_xy ] = ...
  voronoi_data ( g_num, g_xy )

%*****************************************************************************80
%
%% VORONOI_DATA returns data defining the Voronoi diagram.
%
%  Discussion:
%
%    The routine first determines the Delaunay triangulation.
%
%    The Voronoi diagram is then determined from this information.
%
%    In particular, the circumcenter of each Delaunay triangle
%    is a vertex of a Voronoi polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer G_NUM, the number of generators.
%
%    Input, real G_XY(2,G_NUM), the point coordinates.
%
%    Output, integer G_DEGREE(G_NUM), the degree of each
%    Voronoi cell.
%
%    Output, integer G_START(G_NUM), the index in G_FACE of the
%    first vertex at which to begin a traversal of the boundary of the
%    cell associated with each point.
%
%    Output, integer G_FACE(6*G_NUM), the sequence of vertices to
%    be used in a traversal of the boundary of the cell associated with each
%    point.
%
%    Output, integer V_NUM, the number of vertices of the Voronoi
%    diagram.
%
%    Output, real V_XY(2,V_NUM), the coordinates of the vertices
%    of the Voronoi diagram.
%
%    Output, integer I_NUM, the number of vertices at infinity
%    of the Voronoi diagram.
%
%    Output, real I_XY(2,I_NUM), the direction of the
%    vertices at infinity.
%
  debug = 0;
%
%  Compute the Delaunay triangulation.
%
  [ v_num, nodtri, tnbr  ] = dtris2 ( g_num, g_xy );
%
%  Compute and print the areas of the finite triangles.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle    Area\n' );
  fprintf ( 1, '\n' );

  for v = 1 : v_num

    i1 = nodtri(1,v);
    i2 = nodtri(2,v);
    i3 = nodtri(3,v);

    t(1:2,1) = g_xy(1:2,i1);
    t(1:2,2) = g_xy(1:2,i2);
    t(1:2,3) = g_xy(1:2,i3);

    area = triangle_area_2d ( t );

    fprintf ( 1, '  %8d  %14f\n', v, area );

  end
%
%  Extend the NODTRI data structure, adding fictitious vertices at infinity,
%  so that the Delaunay triangulation can be regarded as covering the
%  entire plane.
%
  [ v_inf, nodtri ] = tri_augment ( v_num, nodtri );

  if ( debug )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The generators that form each Delaunay triangle:\n' );
    fprintf ( 1, '  (Negative values are fictitious nodes at infinity.)\n' );

    i4mat_transpose_print ( 3, v_num+v_inf, nodtri, '  Triangle nodes:' );

  end
%
%  Negative entries in TNBR indicate a semi-infinite Voronoi side.
%  However, DTRIS2 uses a peculiar numbering.  Renumber them.
%
  i_num = 0;
  for v = 1 : v_num
    for i = 1 : 3
      if ( tnbr(i,v) < 0 )
        i_num = i_num + 1;
        tnbr(i,v) = - i_num;
      end
    end
  end

  if ( debug )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Neighboring triangles of each Delaunay triangle:\n' );
    fprintf ( 1, '  Negative values indicate no finite neighbor.\n' );

    i4mat_transpose_print ( 3, v_num, tnbr, '  Neighbor triangles:' );

  end
%
%  Determine the degree of each cell.
%
  g_degree(1:g_num) = 0;

  for j = 1 : v_num + v_inf
    for i = 1 : 3
      k = nodtri(i,j);
      if ( 0 < k )
        g_degree(k) = g_degree(k) + 1;
      end
    end
  end

  i4vec_print ( g_num, g_degree, '  Voronoi cell degrees' );
%
%  Each (finite) Delaunay triangle contains a vertex of the Voronoi polygon,
%  at the triangle's circumcenter.
%
  for v = 1 : v_num

    i1 = nodtri(1,v);
    i2 = nodtri(2,v);
    i3 = nodtri(3,v);

    t(1:2,1) = g_xy(1:2,i1);
    t(1:2,2) = g_xy(1:2,i2);
    t(1:2,3) = g_xy(1:2,i3);

    v_xy(1:2,v) = triangle_circumcenter_2d ( t );

  end

  r8mat_transpose_print ( 2, v_num, v_xy, '  The Voronoi vertices:' );
%
%  For each generator G:
%    Determine if its region is infinite.
%      Find a Delaunay triangle containing G.
%      Seek another triangle containing the next node in that triangle.
%
  count = 0;
  g_start(1:g_num) = 0;

  for g = 1 : g_num

    v_next = 0;

    for v = 1 : v_num + v_inf

      for s = 1 : 3
        if ( nodtri(s,v) == g )
          v_next = v;
          s_next = s;
          break
        end
      end

      if ( v_next ~= 0 )
        break
      end

    end

    v_save = v_next;

    while ( 1 )

      s_next = i4_wrap ( s_next + 1, 1, 3 );
      g_next = nodtri(s_next,v_next);

      if ( g_next == g )
        s_next = i4_wrap ( s_next + 1, 1, 3 );
        g_next = nodtri(s_next,v_next);
      end

      v_old = v_next;
      v_next = 0;

      for v = 1 : v_num + v_inf

        if ( v == v_old )
          continue
        end

        for s = 1 : 3

          if ( nodtri(s,v) == g )

            sp1 = i4_wrap ( s + 1, 1, 3 );

            if ( nodtri(sp1,v) == g_next )
              v_next = v;
              s_next = sp1;
              break
            end

            sp1 = i4_wrap ( s + 2, 1, 3 );

            if ( nodtri(sp1,v) == g_next )
              v_next = v;
              s_next = sp1;
              break
            end

          end

        end

        if ( v_next ~= 0 )
          break
        end

      end

      if ( v_next == v_save )
        break
      end

      if ( v_next == 0 )
        v_next = v_old;
        break
      end

    end
%
%  Now, starting in the current triangle, V_NEXT, cycle again,
%  and copy the list of nodes into the array.
%
    v_save = v_next;

    count = count + 1;
    g_start(g) = count;
    g_face(count) = v_next;

    while ( 1 )

      s_next = i4_wrap ( s_next + 1, 1, 3 );
      g_next = nodtri(s_next,v_next);

      if ( g_next == g )
        s_next = i4_wrap ( s_next + 1, 1, 3 );
        g_next = nodtri(s_next,v_next);
      end

      v_old = v_next;
      v_next = 0;

      for v = 1 : v_num + v_inf

        if ( v == v_old )
          continue
        end

        for s = 1 : 3

          if ( nodtri(s,v) == g )

            sp1 = i4_wrap ( s + 1, 1, 3 );

            if ( nodtri(sp1,v) == g_next )
              v_next = v;
              s_next = sp1;
              break
            end

            sp1 = i4_wrap ( s + 2, 1, 3 );

            if ( nodtri(sp1,v) == g_next )
              v_next = v;
              s_next = sp1;
              break
            end

          end

        end

        if ( v_next ~= 0 )
          break
        end

      end

      if ( v_next == v_save )
        break
      end

      if ( v_next == 0 )
        break
      end

      count = count + 1;
      g_face(count) = v_next;

    end
  end
%
%  Mark all the vertices at infinity with a negative sign,
%  so that the data in G_FACE is easier to interpret.
%
  for i = 1 : count
    if ( v_num < g_face(i) )
      g_face(i) = - g_face(i);
    end
  end
%
%  For each (finite) Delaunay triangle, I
%  For each side J,
%
  for i = 1 : v_num
    for j = 1 : 3
      k = tnbr(j,i);

%  If there is no neighboring triangle on that side,
%  extend a line from the circumcenter of I in the direction of the
%  outward normal to that side.  This is an infinite edge of
%  an infinite Voronoi polygon.
%
      if ( k < 0 )

        ix1 = nodtri(j,i);
        x1 = g_xy(1,ix1);
        y1 = g_xy(2,ix1);

        jp1 = i4_wrap ( j+1, 1, 3 );

        ix2 = nodtri(jp1,i);
        x2 = g_xy(1,ix2);
        y2 = g_xy(2,ix2);
%
%  Compute the direction I_XY(1:2,-K).
%
        i_xy(1:2,-k) = line_exp_normal_2d ( g_xy(1:2,ix1), g_xy(1:2,ix2) );

      end

    end
  end

  return
end
