function r8vm_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8VM_PRINT prints a R8VM matrix.
%
%  Discussion:
%
%    The R8VM storage format is used for an M by N Vandermonde matrix.
%    An M by N Vandermonde matrix is defined by the values in its second
%    row, which will be written here as X(1:N).  The matrix has a first 
%    row of 1's, a second row equal to X(1:N), a third row whose entries
%    are the squares of the X values, up to the M-th row whose entries
%    are the (M-1)th powers of the X values.  The matrix can be stored
%    compactly by listing just the values X(1:N).
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(N), the R8VM matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8vm_print_some ( m, n, a, 1, 1, n, n, title );

  return
end
