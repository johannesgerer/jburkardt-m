function a = creation ( m, n )

%*****************************************************************************80
%
%% CREATION returns the creation matrix.
%
%  Example:
%
%    M = 5, N = 5
%
%    0  0  0  0  0
%    1  0  0  0  0
%    0  2  0  0  0
%    0  0  3  0  0
%    0  0  0  4  0
%
%  Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is strictly lower triangular.
%
%  Square properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is singular.
%
%    A has the null vector ( 0, 0, ..., 0, 1 ).
%
%    det ( A ) = 0.
%
%    LAMBDA(1:N) = 0
%
%    A is zero except for the first lower diagonal. A^2 is zero except for
%    the second lower diagonal.  A^(N-1) is the last nonzero power of A,
%    with a single nonzero entry in the (N,1) position.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j + 1 )
        a(i,j) = j;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
