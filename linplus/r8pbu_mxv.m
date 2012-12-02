function b = r8pbu_mxv ( n, mu, a, x )

%*****************************************************************************80
%
%% R8PBU_MXV multiplies a R8PBU matrix times a vector.
%
%  Discussion:
%
%    The R8PBU storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and upper triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Input, real A(MU+1,N), the R8PBU matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the result vector A * x.
%

%
%  Multiply X by the diagonal of the matrix.
%
  b(1:n) = a(mu+1,1:n) .* x(1:n);
%
%  Multiply X by the superdiagonals of the matrix.
%
  for i = mu : -1 : 1
    for j = mu+2-i : n
      ieqn = i + j - mu - 1;
      b(ieqn) = b(ieqn) + a(i,j) * x(j);
      b(j) = b(j) + a(i,j) * x(ieqn);
    end
  end

  return
end
