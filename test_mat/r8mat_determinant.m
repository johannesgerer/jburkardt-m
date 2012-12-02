function determ = r8mat_determinant ( n, a )

%*****************************************************************************80
%
%% R8MAT_DETERMINANT computes the determinant of a matrix.
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
%    Output, real DETERM, the determinant.
%
  b(1:n,1:n) = a(1:n,1:n);

  [ b, pivot, info ] = r8mat_gefa ( b, n );

  determ = r8mat_gedet ( b, n, pivot );

  return
end
