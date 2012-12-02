function det = r8pbl_det ( n, mu, a_lu )

%*****************************************************************************80
%
%% R8PBL_DET computes the determinant of a matrix factored by R8PBL_FA.
%
%  Discussion:
%
%    The R8PBL storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and lower triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row 1 of the array.
%    The first subdiagonal in row 2, columns 1 through MU.
%    The second subdiagonal in row 3, columns 1 through MU-1.
%    The MU-th subdiagonal in row MU+1, columns 1 through 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2004
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
%    Input, integer MU, the upper (and lower) bandwidth.
%    MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(MU+1,N), the LU factors from R8PBL_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = prod ( a_lu(1,1:n).^2 );

  return
end
