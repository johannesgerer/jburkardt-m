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
