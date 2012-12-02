function r8lt_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8LT_PRINT prints a R8LT matrix.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
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
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, real A(M,N), the R8LT matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8lt_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
