function r8pbu_print ( n, mu, a, title )

%*****************************************************************************80
%
%% R8PBU_PRINT prints a R8PBU matrix.
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
%    Input, real A(MU+1,N), the R8PBU matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8pbu_print_some ( n, mu, a, 1, 1, n, n, title );

  return
end
