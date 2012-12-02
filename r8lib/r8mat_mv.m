function y = r8mat_mv ( m, n, a, x )

%*****************************************************************************80
%
%% R8MAT_MV multiplies a matrix times a vector.
%
%  Discussion:
%
%    In FORTRAN90, this operation can be more efficiently carried
%    out by the command
%
%      Y(1:M) = MATMUL ( A(1:M,1:N), X(1:N) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
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
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real Y(M), the product A*X.
%
  y(1:m) = a(1:m,1:n) * x(1:n);

  return
end
