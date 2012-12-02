function x = simplex_coordinates1 ( n )

%*****************************************************************************80
%
%% SIMPLEX_COORDINATES1 computes the Cartesian coordinates of simplex vertices.
%
%  Discussion:
%
%    The simplex will have its centroid at 0;
%
%    The sum of the vertices will be zero.
%
%    The distance of each vertex from the origin will be 1.
%
%    The length of each edge will be constant.
%
%    The dot product of the vectors defining any two vertices will be - 1 / N.
%    This also means the angle subtended by the vectors from the origin
%    to any two distinct vertices will be arccos ( - 1 / N ).
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
%    Input, integer N, the spatial dimension.
%
%    Output, real X(N,N+1), the coordinates of the vertices
%    of a simplex in N dimensions.
%
  x(1:n,1:n+1) = 0.0;

  for i = 1 : n
%
%  Set X(I,I) so that sum ( X(1:I,I)^2 ) = 1.
%
    x(i,i) = sqrt ( 1.0 - sum ( x(1:i-1,i).^2 ) );
%
%  Set X(I,J) for J = I+1 to N+1 by using the fact that XI dot XJ = - 1 / N
%
    for j = i + 1 : n + 1
      x(i,j) = ( - 1.0 / n - ( x(1:i-1,i)' * x(1:i-1,j) ) ) / x(i,i);
    end

  end

  return
end
