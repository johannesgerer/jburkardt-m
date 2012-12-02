function x = r8pbu_sl ( n, mu, a_lu, b )

%*****************************************************************************80
%
%% R8PBU_SL solves a R8PBU system factored by R8PBU_FA.
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
%    28 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, Philadelphia, 1979.
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
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);
%
%  Solve L * Y = B.
%
  for k = 1 : n
    ilo = max ( 1, k - mu );
    x(k) = ( x(k) - x(ilo:k-1) * a_lu(mu+1+ilo-k:mu,k)  ) ...
      / a_lu(mu+1,k);
  end
%
%  Solve U * X = Y.
%
  for k = n : -1 : 1

    x(k) = x(k) / a_lu(mu+1,k);

    ilo = max ( 1, k - mu );
    for i = ilo : k-1
      x(i) = x(i) - x(k) * a_lu(mu+1+i-k,k);
    end

  end

  return
end
