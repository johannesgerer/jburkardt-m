function b = r8pbu_ml ( n, mu, a_lu, x )

%*****************************************************************************80
%
%% R8PBU_ML multiplies a vector times a matrix that was factored by R8PBU_FA.
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
%    Input, integer MU, the number of superdiagonals of the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Input, real A_LU(MU+1,N), the matrix, as factored by R8PBU_FA.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  b(1:n) = x(1:n);
%
%  Multiply U * X = Y.
%
  for k = 1 : n

    ilo = max ( 1, k - mu );
    for i = ilo : k - 1
      b(i) = b(i) + a_lu(mu+1+i-k,k) * b(k);
    end

    b(k) = a_lu(mu+1,k) * b(k);

  end
%
%  Multiply L * Y = B.
%
  for k = n : -1 : 1

    jhi = min ( k + mu, n );
    for j = k + 1 : jhi
      b(j) = b(j) + a_lu(mu+1+k-j,j) * b(k);
    end

    b(k) = a_lu(mu+1,k) * b(k);

  end

  return
end
