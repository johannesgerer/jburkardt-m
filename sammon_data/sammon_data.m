function sammon_data ( )

%*****************************************************************************80
%
%% SAMMON_DATA generates data for SAMMON tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SAMMON_DATA:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Generate data for SAMMON tests.\n' );

  n = 9;
  x = data_circle ( n );

  n = 20;
  x = data_helix ( n );

  x = data_iris ( );

  m = 9;
  n = 9;
  x = data_linear ( m, n );

  n = 29;
  x = data_nonlinear ( n );

  m = 4;
  n = 75;
  s = 0.2;
  x = data_simplex ( m, n, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SAMMON_DATA:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function x = data_circle ( n )

%*****************************************************************************80
%
%% DATA_CIRCLE writes the circle test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(2,N), the points.
%
  m = 2;

  if ( nargin < 1 )
    n = 9;
  end

  c = 5.0 * rand ( 2, 1 );
  r = 2.5 * rand ( 1, 1 );
  theta0 = 2.0 * pi * rand ( 1, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_CIRCLE\n' );
  fprintf ( 1, '  Generate %d data points around a circle\n', n - 1 );
  fprintf ( 1, '  of radius R = %f\n', r )
  fprintf ( 1, '  and center C = ( %f, %f )\n', c(1:2) )
  fprintf ( 1, '  with initial angle THETA0 = %f\n', theta0 );
  fprintf ( 1, '  plus the center point.\n' );

  x = zeros ( m, n );

  for j = 1 : n - 1
    theta = theta0 + ( j - 1 ) * 2.0 * pi / ( n - 1 );
    x(1,j) = c(1) + r * cos ( theta );
    x(2,j) = c(2) + r * sin ( theta );
  end

  x(1:2,n) = c(1:2,1);

  filename = 'sammon_circle.txt';

  r8mat_write ( filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function x = data_helix ( n )

%*****************************************************************************80
%
%% DATA_HELIX writes the helix test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(3,N), the points.
%
  m = 3;

  if ( nargin < 1 )
    n = 30;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_HELIX\n' );
  fprintf ( 1, '  Generate %d data points along a helix.\n', n );

  x = zeros ( m, n );

  z = ( 0 : n - 1 ) / sqrt ( 2.0 );
  x(1,1:n) = cos ( z );
  x(2,1:n) = sin ( z );
  x(3,1:n) = z;

  filename = 'sammon_helix.txt';

  r8mat_write ( filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function x = data_iris ( )

%*****************************************************************************80
%
%% DATA_IRIS writes the Iris test data.
%
%  Discussion:
%
%    This is Fisher's Iris data.
%
%    1 - sepal length in cm
%    2 - sepal width in cm
%    3 - petal length in cm
%    4 - petal width in cm
%    5 - class: 1 for Iris setosa, 2 for Iris Versicolour, 3 for Iris Virginica.
%
%    Three of the records are duplicates; to keep the SAMMON algorithm
%    happy, we delete those.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ronald Fisher,
%    The use of multiple measurements in taxonomic problems,
%    Annual Eugenics,
%    Volume 7, part II, 1936, pages 179-188.
%
%  Parameters:
%
%    Input, real X(5,147), the points.
%
  m = 5;
  n = 147;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_IRIS\n' );
  fprintf ( 1, '  Fisher''s iris data.\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N = %d\n', n );

  x = [ 5.1 3.5 1.4 0.2 1 ; 4.9 3.0 1.4 0.2 1 ; 4.7 3.2 1.3 0.2 1 ;
         4.6 3.1 1.5 0.2 1 ; 5.0 3.6 1.4 0.2 1 ; 5.4 3.9 1.7 0.4 1 ;
         4.6 3.4 1.4 0.3 1 ; 5.0 3.4 1.5 0.2 1 ; 4.4 2.9 1.4 0.2 1 ;
         4.9 3.1 1.5 0.1 1 ; 5.4 3.7 1.5 0.2 1 ; 4.8 3.4 1.6 0.2 1 ;
         4.8 3.0 1.4 0.1 1 ; 4.3 3.0 1.1 0.1 1 ; 5.8 4.0 1.2 0.2 1 ;
         5.7 4.4 1.5 0.4 1 ; 5.4 3.9 1.3 0.4 1 ; 5.1 3.5 1.4 0.3 1 ;
         5.7 3.8 1.7 0.3 1 ; 5.1 3.8 1.5 0.3 1 ; 5.4 3.4 1.7 0.2 1 ;
         5.1 3.7 1.5 0.4 1 ; 4.6 3.6 1.0 0.2 1 ; 5.1 3.3 1.7 0.5 1 ;
         4.8 3.4 1.9 0.2 1 ; 5.0 3.0 1.6 0.2 1 ; 5.0 3.4 1.6 0.4 1 ;
         5.2 3.5 1.5 0.2 1 ; 5.2 3.4 1.4 0.2 1 ; 4.7 3.2 1.6 0.2 1 ;
         4.8 3.1 1.6 0.2 1 ; 5.4 3.4 1.5 0.4 1 ; 5.2 4.1 1.5 0.1 1 ;
         5.5 4.2 1.4 0.2 1 ; 4.9 3.1 1.5 0.1 1 ; 5.0 3.2 1.2 0.2 1 ;
         5.5 3.5 1.3 0.2 1 ; 4.9 3.1 1.5 0.1 1 ; 4.4 3.0 1.3 0.2 1 ;
         5.1 3.4 1.5 0.2 1 ; 5.0 3.5 1.3 0.3 1 ; 4.5 2.3 1.3 0.3 1 ;
         4.4 3.2 1.3 0.2 1 ; 5.0 3.5 1.6 0.6 1 ; 5.1 3.8 1.9 0.4 1 ;
         4.8 3.0 1.4 0.3 1 ; 5.1 3.8 1.6 0.2 1 ; 4.6 3.2 1.4 0.2 1 ;
         5.3 3.7 1.5 0.2 1 ; 5.0 3.3 1.4 0.2 1 ; 7.0 3.2 4.7 1.4 2 ;
         6.4 3.2 4.5 1.5 2 ; 6.9 3.1 4.9 1.5 2 ; 5.5 2.3 4.0 1.3 2 ;
         6.5 2.8 4.6 1.5 2 ; 5.7 2.8 4.5 1.3 2 ; 6.3 3.3 4.7 1.6 2 ;
         4.9 2.4 3.3 1.0 2 ; 6.6 2.9 4.6 1.3 2 ; 5.2 2.7 3.9 1.4 2 ;
         5.0 2.0 3.5 1.0 2 ; 5.9 3.0 4.2 1.5 2 ; 6.0 2.2 4.0 1.0 2 ;
         6.1 2.9 4.7 1.4 2 ; 5.6 2.9 3.6 1.3 2 ; 6.7 3.1 4.4 1.4 2 ;
         5.6 3.0 4.5 1.5 2 ; 5.8 2.7 4.1 1.0 2 ; 6.2 2.2 4.5 1.5 2 ;
         5.6 2.5 3.9 1.1 2 ; 5.9 3.2 4.8 1.8 2 ; 6.1 2.8 4.0 1.3 2 ;
         6.3 2.5 4.9 1.5 2 ; 6.1 2.8 4.7 1.2 2 ; 6.4 2.9 4.3 1.3 2 ;
         6.6 3.0 4.4 1.4 2 ; 6.8 2.8 4.8 1.4 2 ; 6.7 3.0 5.0 1.7 2 ;
         6.0 2.9 4.5 1.5 2 ; 5.7 2.6 3.5 1.0 2 ; 5.5 2.4 3.8 1.1 2 ;
         5.5 2.4 3.7 1.0 2 ; 5.8 2.7 3.9 1.2 2 ; 6.0 2.7 5.1 1.6 2 ;
         5.4 3.0 4.5 1.5 2 ; 6.0 3.4 4.5 1.6 2 ; 6.7 3.1 4.7 1.5 2 ;
         6.3 2.3 4.4 1.3 2 ; 5.6 3.0 4.1 1.3 2 ; 5.5 2.5 4.0 1.3 2 ;
         5.5 2.6 4.4 1.2 2 ; 6.1 3.0 4.6 1.4 2 ; 5.8 2.6 4.0 1.2 2 ;
         5.0 2.3 3.3 1.0 2 ; 5.6 2.7 4.2 1.3 2 ; 5.7 3.0 4.2 1.2 2 ;
         5.7 2.9 4.2 1.3 2 ; 6.2 2.9 4.3 1.3 2 ; 5.1 2.5 3.0 1.1 2 ;
         5.7 2.8 4.1 1.3 2 ; 6.3 3.3 6.0 2.5 3 ; 5.8 2.7 5.1 1.9 3 ;
         7.1 3.0 5.9 2.1 3 ; 6.3 2.9 5.6 1.8 3 ; 6.5 3.0 5.8 2.2 3 ;
         7.6 3.0 6.6 2.1 3 ; 4.9 2.5 4.5 1.7 3 ; 7.3 2.9 6.3 1.8 3 ;
         6.7 2.5 5.8 1.8 3 ; 7.2 3.6 6.1 2.5 3 ; 6.5 3.2 5.1 2.0 3 ;
         6.4 2.7 5.3 1.9 3 ; 6.8 3.0 5.5 2.1 3 ; 5.7 2.5 5.0 2.0 3 ;
         5.8 2.8 5.1 2.4 3 ; 6.4 3.2 5.3 2.3 3 ; 6.5 3.0 5.5 1.8 3 ;
         7.7 3.8 6.7 2.2 3 ; 7.7 2.6 6.9 2.3 3 ; 6.0 2.2 5.0 1.5 3 ;
         6.9 3.2 5.7 2.3 3 ; 5.6 2.8 4.9 2.0 3 ; 7.7 2.8 6.7 2.0 3 ;
         6.3 2.7 4.9 1.8 3 ; 6.7 3.3 5.7 2.1 3 ; 7.2 3.2 6.0 1.8 3 ;
         6.2 2.8 4.8 1.8 3 ; 6.1 3.0 4.9 1.8 3 ; 6.4 2.8 5.6 2.1 3 ;
         7.2 3.0 5.8 1.6 3 ; 7.4 2.8 6.1 1.9 3 ; 7.9 3.8 6.4 2.0 3 ;
         6.4 2.8 5.6 2.2 3 ; 6.3 2.8 5.1 1.5 3 ; 6.1 2.6 5.6 1.4 3 ;
         7.7 3.0 6.1 2.3 3 ; 6.3 3.4 5.6 2.4 3 ; 6.4 3.1 5.5 1.8 3 ;
         6.0 3.0 4.8 1.8 3 ; 6.9 3.1 5.4 2.1 3 ; 6.7 3.1 5.6 2.4 3 ;
         6.9 3.1 5.1 2.3 3 ; 5.8 2.7 5.1 1.9 3 ; 6.8 3.2 5.9 2.3 3 ;
         6.7 3.3 5.7 2.5 3 ; 6.7 3.0 5.2 2.3 3 ; 6.3 2.5 5.0 1.9 3 ;
         6.5 3.0 5.2 2.0 3 ; 6.2 3.4 5.4 2.3 3 ; 5.9 3.0 5.1 1.8 3 ];
%
%  We need to remove duplicate data.
%
  x = unique ( x(:,1:5), 'rows' );

  x = x';

  filename = 'sammon_iris.txt';

  r8mat_write ( filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function x = data_linear ( m, n )

%*****************************************************************************80
%
%% DATA_LINEAR writes the straight line test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the points.
%
  if ( nargin < 1 )
    m = 9;
  end

  if ( nargin < 2 )
    n = 9;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_LINEAR\n' );
  fprintf ( 1, '  Generate %d data points along a straight line\n', n );
  fprintf ( 1, '  in %d-dimensional space.\n', m );

  a = rand ( m, 1 );
  b = rand ( m, 1 );

  x = zeros ( m, n );

  for j = 1 : n
    x(1:m,j) = ( ( n - j     ) * a(1:m,1) ...
               +       j - 1   * b(1:m,1) ) ...
               / ( n     - 1 );
  end

  filename = 'sammon_linear.txt';

  r8mat_write ( filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function x = data_nonlinear ( n )

%*****************************************************************************80
%
%% DATA_NONLINEAR writes the nonlinear test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(5,N), the points.
%
  m = 5;

  if ( nargin < 1 )
    n = 29;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_NONLINEAR\n' );
  fprintf ( 1, '  Generate %d data points along a nonlinear curve.\n', n );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );

  x = zeros ( m, n );

  z = ( 0 : n - 1 ) / sqrt ( 2.0 );
  x(1,1:n) = cos ( z );
  x(2,1:n) = sin ( z );
  x(3,1:n) = 0.5 * cos ( 2.0 * z );
  x(4,1:n) = 0.5 * sin ( 2.0 * z );
  x(5,1:n) = z;

  filename = 'sammon_nonlinear.txt';

  r8mat_write ( filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function x = data_simplex ( m, n, s )

%*****************************************************************************80
%
%% DATA_SIMPLEX writes the nonlinear test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real S, the standard deviation of sample points from a vertex.
%
%    Input, real X(M,N), the points.
%
  if ( nargin < 1 )
    m = 4;
  end

  if ( nargin < 2 )
    n = 75;
  end

  if ( nargin < 3 )
    s = 0.2;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DATA_SIMPLEX\n' );
  fprintf ( 1, '  Generate %d data points at vertices of a simplex\n', n );
  fprintf ( 1, '  with a standard deviation of %f\n', s );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );

  x = zeros ( m + 1, n );

  v = simplex_coordinates2 ( m );
%
%  Rescale so intervertex distance is sqrt (5/4).
%
  s = norm ( v(1:m,1) - v(1:m,2) );
  v = ( sqrt ( 5.0 / 4.0 ) / s ) * v;
%
%  For point J of N points, choose one of M+1 vertices.
%  Evaluate a Gaussian distribution centered at that vertex
%  with a standard deviation of 0.2 units in each dimension.
%
%  Add an M+1-th coordinate that remembers the associated vertex.
%
  for j = 1 : n
    k = 1 + randint ( 1, 1, m + 1 );
    x(1:m,j) = v(1:m,k) + s * randn ( m, 1 );
    x(m+1,j) = k;
  end

  filename = 'sammon_simplex.txt';

  r8mat_write ( filename, m + 1, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test data written to "%s".\n', filename );

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
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
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For more precision, try:
%
%     fprintf ( output_unit, '  %24.16e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14.6e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function x = simplex_coordinates2 ( n )

%*****************************************************************************80
%
%% SIMPLEX_COORDINATES2 computes the Cartesian coordinates of simplex vertices.
%
%  Discussion:
%
%    This routine uses a simple approach to determining the coordinates of
%    the vertices of a regular simplex in n dimensions.
%
%    We want the vertices of the simplex to satisfy the following conditions:
%
%    1) The centroid, or average of the vertices, is 0.
%    2) The distance of each vertex from the centroid is 1.
%       By 1), this is equivalent to requiring that the sum of the squares
%       of the coordinates of any vertex be 1.
%    3) The distance between any pair of vertices is equal (and is not zero.)
%    4) The dot product of any two coordinate vectors for distinct vertices
%       is -1/N; equivalently, the angle subtended by two distinct vertices
%       from the centroid is arccos ( -1/N).
%
%    Note that if we choose the first N vertices to be the columns of the
%    NxN identity matrix, we are almost there.  By symmetry, the last column
%    must have all entries equal to some value A.  Because the square of the
%    distance between the last column and any other column must be 2 (because
%    that's the distance between any pair of columns), we deduce that
%    (A-1)^2 + (N-1)*A^2 = 2, hence A = (1-sqrt(1+N))/N.  Now compute the
%    centroid C of the vertices, and subtract that, to center the simplex
%    around the origin.  Finally, compute the norm of one column, and rescale
%    the matrix of coordinates so each vertex has unit distance from the origin.
%
%    This approach devised by John Burkardt, 19 September 2010.  What,
%    I'm not the first?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Output, real X(N,N+1), the coordinates of the vertices
%    of a simplex in N dimensions.
%
  x(1:n,1:n+1) = 0.0;

  for j = 1 : n
    x(j,j) = 1.0;
  end

  a = ( 1.0 - sqrt ( 1.0 + n ) ) / n;

  x(1:n,n+1) = a;
%
%  Now adjust coordinates so the centroid is at zero.
%
  c(1:n,1) = sum ( x(1:n,1:n+1), 2 ) / ( n + 1 );

  for j = 1 : n + 1
    x(1:n,j) = x(1:n,j) - c(1:n,1);
  end
%
%  Now scale so each column has norm 1.
%
  s = norm ( x(1:n,1) );

  x(1:n,1:n+1) = x(1:n,1:n+1) / s;

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
