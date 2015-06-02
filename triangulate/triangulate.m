function triangulate ( prefix, animate )

%*****************************************************************************80
%
%% TRIANGULATE triangulates a polygon using the ear slicing algorithm.
%
%  Discussion:
%
%    The polygon is described by a file which lists the coordinates of the
%    vertices in consecutive order during a counterclockwise traversal.
%
%    Note that no two successive vertices can be equal, nor can the first
%    and last vertices be equal.
%
%    Information about the polygon is stored as a structure we will call
%    a "vertex array".
%
%    There is one entry in the array for each of the N vertices in the
%    polygon.  The I-th entry is a structure with the following fields:
%
%      vertex(i).index  the index of the node.
%      vertex(i).next   the index of the next node.
%      vertex(i).prev   the index of the previous node.
%      vertex(i).x      the X coordinate.
%      vertex(i).y      the Y coordinate.
%      vertex(i).ear    1 if the vertex represents an "ear" that can
%                       be sliced off.
%
%  Usage:
%
%    triangulate ( 'prefix', 'animate' )
%
%    where
%
%    * 'prefix' is the filename prefix
%    * 'animate' is 'y' if you want to see an animation of the triangulation.
%
%    reads
%
%    * 'prefix'_nodes.txt, the node coordinate file,
%
%    creates
%
%    * 'prefix'_diagonals.txt, the internal diagonals file.
%    * 'prefix'_elements.txt, the triangle file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2013
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, string PREFIX, the filename prefix.
%
%    Input, string ANIMATE, is 'y' if the user wants to see the triangulation
%    process animated.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a file listing the coordinates of the vertices\n' );
  fprintf ( 1, '  of a polygon, and determine a triangulation.\n' );
%
%  If the user did not supply the filename prefix, request it.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATE:\n' );
    prefix = input ( '  Enter the filename prefix (in ''quotes''!).\n' );
  end
%
%  If the user did not supply the animation option, assume it is NO.
%
  if ( nargin < 2 )
    animate = 'n';
  end
%
%  Create filenames.
%
  node_filename     = strcat ( prefix, '_nodes.txt' );
  diagonal_filename = strcat ( prefix, '_diagonals.txt' );
  triangle_filename = strcat ( prefix, '_elements.txt' );
%
%  Read the node coordinates.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Processing the vertex coordinate file "%s".\n', node_filename )
  direction = +1;
  vertex = read_vertices ( node_filename, direction );

  vertex = ear_init ( vertex );

  area = area_poly2 ( vertex );
%
%  If area is zero, refuse to go on.
%
  if ( area == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATE - Fatal area!\n' );
    fprintf ( 1, '  The area is computed to be exactly zero.\n' );
    return
  end
%
%  If area is NEGATIVE, reverse the ordering.
%
  if ( area < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Polygon area is negative!\n' );
    fprintf ( 1, '  Will try reversing vertex ordering.\n' );
    direction = -1;
    vertex = read_vertices ( node_filename, direction );
    vertex = ear_init ( vertex );
    area = area_poly2 ( vertex );
  end

  n = length ( vertex );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of vertices is %d\n', n );

  print_vertices ( vertex );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Area of polygon is %g\n', area );
%
%  Refuse to triangulate a region in which two successive vertices are equal.
%
  for i = 1 : n
    j = vertex(i).next;
    if ( vertex(i).x == vertex(j).x && vertex(i).y == vertex(j).y )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGULATE - Fatal error!\n' );
      fprintf ( 1, '  Two neighbor vertices are equal.\n' );
      fprintf ( 1, '  Vertex(%d) = Vertex(%d)\n', i, j );
      error ( 'TRIANGULATE - Fatal error!' );
    end
  end
%
%  Determine a reasonable scale for the plot.
%
  xmin = vertex(1).x;
  xmax = vertex(1).x;
  ymin = vertex(1).y;
  ymax = vertex(1).y;
  for i = 2 : n
    xmin = min ( xmin, vertex(i).x );
    xmax = max ( xmax, vertex(i).x );
    ymin = min ( ymin, vertex(i).y );
    ymax = max ( ymax, vertex(i).y );
  end

  dx = 0.0125 * max ( xmax - xmin, ymax - ymin );
%
%  Draw the (non-triangulated) polygon.
%
%  You might think a single PLOT command would suffice to display
%  the vertices.  However, the proper way of extracting a vector of
%  values from a structure eludes me.
%
  figure ( 1 )

  clf

  grid on

  hold on
%
%  Make the plot a little bigger than the data.
%
  plot ( xmin - 2 * dx, ymin - 2 * dx, 'w.' );
  plot ( xmax + 2 * dx, ymin + 2 * dx, 'w.' );

  for i = 1 : n
    plot ( vertex(i).x, vertex(i).y, 'k.', 'MarkerSize', 25 )
  end

  for i = 1 : n 
    text ( vertex(i).x + dx, vertex(i).y + dx, num2str ( i ) );
  end

  for i = 1 : n
    line ( [ vertex(i).x, vertex(vertex(i).next).x ], ...
           [ vertex(i).y, vertex(vertex(i).next).y ], ...
           'LineWidth', 3, 'Color', 'r' )
  end

  xlabel ( '<-- X -->' )
  ylabel ( '<-- Y -->' )
  title ( prefix );
  axis equal
%
%  Triangulate the polygon.
%
  triangles = polygon_triangulate ( vertex );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Internal diagonals for triangulation:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n - 3
    fprintf ( 1, '  %2d  %2d\n', triangles(i,1:2) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangles:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n - 2
    fprintf ( 1, '  %2d  %2d  %2d\n', triangles(i,1:3) );
  end
%
%  Draw the triangulated polygon.
%
  figure ( 2 )

  clf

  grid on

  hold on
%
%  Make the plot a little bigger than the data.
%
  plot ( xmin - 2 * dx, ymin - 2 * dx, 'w.' );
  plot ( xmax + 2 * dx, ymin + 2 * dx, 'w.' );

  for i = 1 : n
    plot ( vertex(i).x, vertex(i).y, 'k.', 'MarkerSize', 25 )
  end

  for i = 1 : n 
    text ( vertex(i).x + dx, vertex(i).y + dx, num2str ( i ) );
  end

  for i = 1 : n
    line ( [ vertex(i).x, vertex(vertex(i).next).x ], ...
           [ vertex(i).y, vertex(vertex(i).next).y ], 'LineWidth', 2, 'Color', 'r' )
  end

  for i = 1 : n - 3
    i1 = triangles(i,1);
    i2 = triangles(i,2);
    line ( [ vertex(i1).x, vertex(i2).x ], ...
           [ vertex(i1).y, vertex(i2).y ], 'LineWidth', 3, 'Color', 'b' )
  end

  xlabel ( '<-- X -->' )
  ylabel ( '<-- Y -->' )
  title ( sprintf ( 'Triangulation of "%s"', prefix ) );
  axis equal
%
%  Optionally, animate the triangulation.
%
  if ( animate == 'y' )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  ANIMATION OPTION SELECTED!\n' );
    fprintf ( 1, '  Press return to see each diagonal added.\n' );

    figure ( 3 )

    clf

    grid on

    hold on
%
%  Make the plot a little bigger than the data.
%
    plot ( xmin - 2 * dx, ymin - 2 * dx, 'w.' );
    plot ( xmax + 2 * dx, ymin + 2 * dx, 'w.' );

    for i = 1 : n
      plot ( vertex(i).x, vertex(i).y, 'k.', 'MarkerSize', 25 )
    end

    for i = 1 : n 
      text ( vertex(i).x + dx, vertex(i).y + dx, num2str ( i ) );
    end

    for i = 1 : n
      line ( [ vertex(i).x, vertex(vertex(i).next).x ], ...
             [ vertex(i).y, vertex(vertex(i).next).y ], 'LineWidth', 2, 'Color', 'r' )
    end

    for i = 1 : n - 3
      i1 = triangles(i,1);
      i2 = triangles(i,2);
      i3 = triangles(i,3);
      axis equal
      pause

      patch ( [ vertex(i1).x, vertex(i2).x, vertex(i3).x ], ...
              [ vertex(i1).y, vertex(i2).y, vertex(i3).y ], 'g' );

      line ( [ vertex(i1).x, vertex(i2).x ], ...
             [ vertex(i1).y, vertex(i2).y ], 'LineWidth', 3, 'Color', 'b' )

      axis equal

    end

    pause
    i = n - 2;
    i1 = triangles(i,1);
    i2 = triangles(i,2);
    i3 = triangles(i,3);
    line ( [ vertex(i1).x, vertex(i2).x ], ...
           [ vertex(i1).y, vertex(i2).y ], 'LineWidth', 3, 'Color', 'b' )

    patch ( [ vertex(i1).x, vertex(i2).x, vertex(i3).x ], ...
            [ vertex(i1).y, vertex(i2).y, vertex(i3).y ], 'g' );

    xlabel ( '<-- X -->' )
    ylabel ( '<-- Y -->' )
    title ( sprintf ( 'Triangulation of "%s"', prefix ) );
    axis equal

  end
%
%  Write the diagonals to a file.
%
  i4mat_write ( diagonal_filename, 2, n-3, triangles(1:n-3,1:2)' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Diagonals written to "%s".\n', diagonal_filename );
%
%  Write the triangles to a file.
%
  i4mat_write ( triangle_filename, 3, n-2, triangles(1:n-2,1:3)' );

  fprintf ( 1, '  Triangles written to "%s".\n', triangle_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATE\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function area = area_poly2 ( vertex )

%*****************************************************************************80
%
%% AREA_POLY2 computes the area of a polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex array VERTEX(*).
%
%    Output, real AREA, the area of the polygon.
%
  area = 0.0;

  first = 1;

  i = first;

  ip1 = vertex(i).next;
  if ( ip1 == first )
    return
  end

  ip2 = vertex(ip1).next;
  if ( ip2 == first )
    return
  end

  while ( 1 )

    area = area + triangle_area ( vertex(i), vertex(ip1), vertex(ip2) );

    i = ip1;
    ip1 = ip2;
    ip2 = vertex(ip1).next;

    if ( ip2 == first )
      break
    end

  end

  return
end
function value = between ( va, vb, vc )

%*****************************************************************************80
%
%% BETWEEN is TRUE if vertex VC is between vertices VA and VB.
%
%  Discussion:
%
%    The points must be (numerically) collinear.
%
%    Given that condition, we take the greater of VA.X - VB.X and VA.Y - VB.Y
%    as a "scale" and check where VC's value lies.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, real VA, VB, VC, the vertices.
%
%    Output, integer VALUE, is 1 if VC is between VA and VB,
%    and 0 otherwise.
%
  if ( ~collinear ( va, vb, vc ) )
    value = 0;
    return
  end

  if ( abs ( va.y - vb.y ) < abs ( va.x - vb.x ) )
    xmax = max ( va.x, vb.x );
    xmin = min ( va.x, vb.x );
    value = ( xmin <= vc.x && vc.x <= xmax );
  else
    ymax = max ( va.y, vb.y );
    ymin = min ( va.y, vb.y );
    value = ( ymin <= vc.y && vc.y <= ymax );
  end

  return
end
function value = collinear ( va, vb, vc )

%*****************************************************************************80
%
%% COLLINEAR returns a measure of collinearity for three points.
%
%  Discussion:
%
%    In order to deal with collinear points whose coordinates are not
%    numerically exact, we compare the area of the largest square
%    that can be created by the line segment between two of the points
%    to (twice) the area of the triangle formed by the points.
%
%    If the points are collinear, their triangle has zero area.
%    If the points are close to collinear, then the area of this triangle
%    will be small relative to the square of the longest segment.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, real VA, VB, VC, the vertices.
%
%    Output, integer VALUE, is 1 if the points are judged to be collinear,
%    and 0 otherwise.
%
  area = 0.5 * ( ( vb.x - va.x ) * ( vc.y - va.y ) ...
               - ( vc.x - va.x ) * ( vb.y - va.y ) );
%
%  MATLAB's MAX function has decided to be unfriendly, and I am
%  too annoyed to try to figure out how to placate it when all
%  I want to say is M = max ( A, B, C )!
%
  area_max =                 ( va.x - vb.x )^2 + ( va.y - vb.y )^2;
  area_max = max ( area_max, ( vb.x - vc.x )^2 + ( vb.y - vc.y )^2 );
  area_max = max ( area_max, ( vc.x - va.x )^2 + ( vc.y - va.y )^2 );

  if ( area_max <= eps )
    value = 1;
  elseif ( 2.0 * abs ( area ) <= eps * area_max )
    value = 1;
  else
    value = 0;
  end

  return
end
function value = diagonal ( im1, ip1, vertex )

%*****************************************************************************80
%
%% DIAGONAL: VERTEX(IM1):VERTEX(IP1) is a proper internal diagonal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2014
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, integer IM1, IP1, the indices of two vertices.
%
%    Input, vertex array VERTEX(*).
%
%    Output, integer VALUE, the value of the test.
%
  value = in_cone ( im1, ip1, vertex ) && ...
          in_cone ( ip1, im1, vertex ) && ...
          diagonalie ( im1, ip1, vertex );

  return
end
function value = diagonalie ( im1, ip1, vertex )

%*****************************************************************************80
%
%% DIAGONALIE: VERTEX(IM1):VERTEX(IP1) is a proper diagonal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, integer IM1, IP1, the indices of two vertices.
%
%    Input, vertex array VERTEX(*).
%
%    Output, int VALUE, the value of the test.
%
  first = im1;

  j = vertex(first).index;
  jp1 = vertex(first).next;

  value = 1;
%
%  For each edge VERTEX(J):VERTEX(JP1) of the polygon:

  while ( 1 )
%
%  Skip any edge that includes vertex IM1 or IP1.
%
    if ( j == im1 || j == ip1 || jp1 == im1 || jp1 == ip1 )

    else
      if ( intersect ( vertex(im1), vertex(ip1), vertex(j), vertex(jp1) ) )
        value = 0;
        return
      end
    end

    j = jp1;
    jp1 = vertex(j).next;

    if ( j == vertex(first).index )
      break
    end

  end

  return
end
function vertex = ear_init ( vertex )

%*****************************************************************************80
%
%% EAR_INIT initializes the "earity" of each vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input/output, vertex array VERTEX(*).  On output, the "ear" field
%    of the vertex array has been initialized.
%
  im1 = vertex(1).prev;
  i   = vertex(1).index;
  ip1 = vertex(1).next;

  while ( 1 )

    vertex(i).ear = diagonal ( im1, ip1, vertex );

    im1 = i;
    i   = ip1;
    ip1 = vertex(i).next;

    if ( i == vertex(1).index )
      break
    end

  end

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
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
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
%    26 June 2010
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
%    Input, integer TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %12d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function value = in_cone ( im1, ip1, vertex )

%*****************************************************************************80
%
%% IN_CONE is TRUE if the diagonal VERTEX(IM1):VERTEX(IP1) is strictly internal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, integer IM1, IP1, the indices of two vertices.
%
%    Input, vertex array VERTEX(*).
%
%    Output, int VALUE, the value of the test.
%
  im2 = vertex(im1).prev;
  i = vertex(im1).next;

  if ( left_on ( vertex(im1), vertex(i), vertex(im2) ) )

    value = left ( vertex(im1), vertex(ip1), vertex(im2) ) && ...
            left ( vertex(ip1), vertex(im1), vertex(i) );

  else

    value = ~ ( left_on ( vertex(im1), vertex(ip1), vertex(i) ) && ...
                left_on ( vertex(ip1), vertex(im1), vertex(im2) ) );

  end

  return
end
function value = intersect ( va, vb, vc, vd )

%*****************************************************************************80
%
%% INTERSECT is true if lines VA:VB and VC:VD intersect.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex VA, VB, VC, VD, four vertices.
%
%    Output, integer VALUE, the value of the test.
%
  if ( intersect_prop ( va, vb, vc, vd ) )
    value = 1;
  elseif ( between ( va, vb, vc ) || ...
           between ( va, vb, vd ) || ...
           between ( vc, vd, va ) || ...
           between ( vc, vd, vb ) )
    value = 1;
  else
    value = 0;
  end

  return
end
function value = intersect_prop ( va, vb, vc, vd )

%*****************************************************************************80
%
%% INTERSECT_PROP is TRUE if lines VA:VB and VC:VD have a proper intersection.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex VA, VB, VC, VD, four vertices.
%
%    Output, integer VALUE, the result of the test.
%
  if ( collinear ( va, vb, vc ) || ...
       collinear ( va, vb, vd ) || ...
       collinear ( vc, vd, va ) || ...
       collinear ( vc, vd, vb ) )
    value = 0;
  else
    value = xor ( left ( va, vb, vc ), left ( va, vb, vd ) ) && ...
            xor ( left ( vc, vd, va ), left ( vc, vd, vb ) );
  end

  return
end
function value = left ( va, vb, vc )

%*****************************************************************************80
%
%% LEFT is true if VC is to the left of the line VA:VB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex VA, VB, VC, three vertices.
%
%    Output, integer VALUE, the result of the test.
%
  value = ( 0 < triangle_area ( va, vb, vc ) );

  return
end
function value = left_on ( va, vb, vc )

%*****************************************************************************80
%
%% LEFT_ON is TRUE if VC is to the left of, or on, the line VA:VB.
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
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex VA, VB, VC, three vertices.
%
%    Output, integer VALUE, the result of the test.
%
  value = ( 0 <= triangle_area ( va, vb, vc ) );

  return
end
function triangles = polygon_triangulate ( vertex )

%*****************************************************************************80
%
%% POLYGON_TRIANGULATE determines a triangulation of a polygon.
%
%  Discussion:
%
%    There are N-3 triangles in the triangulation.
%
%    For the first N-2 triangles, the first edge listed is always an
%    internal diagonal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2011
%
%  Author:
%
%    Original C version by Joseph ORourke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry in C,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, vertex array VERTEX(N).
%
%    Output, integer TRIANGLES(N-2,3), the triangles of the triangulation.
%
  n = length ( vertex );
  first = 1;

  triangles = zeros ( n - 2, 3 );
  triangle_num = 0;

  i2 = first;

  while ( triangle_num < n - 3 )
%
%  If I2 is an ear, gather information necessary to carry out
%  the slicing operation and subsequent "healing".
%
    if ( vertex(i2).ear )

      i3 = vertex(i2).next;
      i4 = vertex(i3).next;
      i1 = vertex(i2).prev;
      i0 = vertex(i1).prev;
%
%  Make vertex I2 disappear.
%
      vertex(i1).next = i3;
      vertex(i2).index = 0;
      vertex(i3).prev = i1;
%
%  Update the earity of I1 and I3, because I2 disappeared.
%
      vertex(i1).ear = diagonal ( i0, i3, vertex );
      vertex(i3).ear = diagonal ( i1, i4, vertex );
%
%  Add the diagonal [I3, I1, I2] to the list.
%
      triangle_num = triangle_num + 1;
      triangles(triangle_num,1) = i3;
      triangles(triangle_num,2) = i1;
      triangles(triangle_num,3) = i2;

    end
%
%  Try the next vertex.
%
    i2 = vertex(i2).next;

  end
%
%  The last triangle is formed from the three remaining vertices.
%
  i3 = vertex(i2).next;
  i1 = vertex(i2).prev;
  triangle_num = triangle_num + 1;
  triangles(triangle_num,1) = i3;
  triangles(triangle_num,2) = i1;
  triangles(triangle_num,3) = i2;

  return
end
function print_vertices ( vertex )

%*****************************************************************************80
%
%% PRINT_VERTICES prints the vertex information.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, vertex array VERTEX(*).
%
  n = length ( vertex );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I IM1 IP1      X           Y       Earity\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n

    if ( vertex(i).ear == -1 )
      earity = 'Unknown';
    elseif ( vertex(i).ear == 0 )
      earity = 'No';
    else
      earity = 'Yes';
    end

    fprintf ( 1, '  %2d  %2d  %2d  %10f  %10f  %s\n', ...
      vertex(i).index, vertex(i).prev, vertex(i).next, ...
      vertex(i).x, vertex(i).y, earity );

  end

  return
end
function vertex = read_vertices ( filename, direction )

%*****************************************************************************80
%
%% READ_VERTICES reads vertex coordinates and initializes the vertex structure.
%
%  Discussion:
%
%    If the polygon was found to have negative area on the first pass,
%    we try again, reversing the vertex ordering, and hoping the user simply
%    listed the vertices in clockwise order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the file to be read.
%
%    Input, integer DIRECTION, the ordering for the vertices.
%    +1, first vertex is 1, and count up.
%    -1, first vertex is N, and count down.
%
%    Output, vertex array VERTEX(*).
%
  xy = load ( filename );

  [ n, dim ] = size ( xy );

  if ( direction == -1 )
    xy(1:n,1) = xy(n:-1:1,1);
    xy(1:n,2) = xy(n:-1:1,2);
  end
 
  for i = 1 : n
    vertex(i).index = i;
    vertex(i).prev = i4_wrap ( i - 1, 1, n );
    vertex(i).next = i4_wrap ( i + 1, 1, n );
    vertex(i).x = xy(i,1);
    vertex(i).y = xy(i,2);
    vertex(i).ear = -1;
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
function area = triangle_area ( v1, v2, v3 )

%*****************************************************************************80
%
%% TRIANGLE_AREA computes the signed area of a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, vertex V1, V2, V3, three vertices.
%
%    Output, real AREA, the signed area of the triangle.
%
  area = 0.5 * ( ( v2.x - v1.x ) * ( v3.y - v1.y ) ...
               - ( v3.x - v1.x ) * ( v2.y - v1.y ) );

  return
end
