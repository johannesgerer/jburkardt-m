function det = r8pbu_det ( n, mu, a_lu )

%*****************************************************************************80
%
%% R8PBU_DET computes the determinant of a matrix factored by R8PBU_FA.
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
%    27 March 2004
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
%    Input, real A_LU(MU+1,N), the LU factors from R8PBU_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = prod ( a_lu(mu+1,1:n) );
  det = det * det;

  return
end
