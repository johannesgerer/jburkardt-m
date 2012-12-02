function y = r8mat_mtv ( m, n, a, x )

%*****************************************************************************80
%
%% R8MAT_MTV multiplies a transposed matrix times a vector
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), the M by N matrix.
%
%    Input, real X(M), the vector to be multiplied by A.
%
%    Output, real Y(N), the product A'*X.
%
  y(1:n) = a(1:m,1:n)' * x(1:m);

  return
end
