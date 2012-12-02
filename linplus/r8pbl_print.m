function r8pbl_print ( n, mu, a, title )

%*****************************************************************************80
%
%% R8PBL_PRINT prints a R8PBL matrix.
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
%    07 April 2006
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
%    Input, integer MU, the upper (and lower) bandwidth.
%    MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(MU+1,N), the R8PBL matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8pbl_print_some ( n, mu, a, 1, 1, n, n, title );

  return
end
