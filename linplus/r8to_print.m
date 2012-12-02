function r8to_print ( n, a, title )

%*****************************************************************************80
%
%% R8TO_PRINT prints a R8TO matrix.
%
%  Discussion:
%
%    The R8TO storage format is used for a Toeplitz matrix, which is constant
%    along diagonals.  Thus, in an N by N Toeplitz matrix, there are at most 
%    2*N-1 distinct entries.  The format stores the N elements of the first
%    row, followed by the N-1 elements of the first column (skipping the
%    entry in the first row).
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
%    Input, real A(2*N-1), the R8TO matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8to_print_some ( n, a, 1, 1, n, n, title );

  return
end
