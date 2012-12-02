function b = r8mat_inverse ( n, a )

%*****************************************************************************80
%
%% R8MAT_INVERSE computes the inverse of a matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the orderof the matrix A.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real B(N,N), the inverse matrix.
%
  b(1:n,1:n) = a(1:n,1:n);

  [ b, pivot, info ] = r8mat_gefa ( b, n );

  b = r8mat_geinverse ( b, n, pivot );

  return
end
