function r8ge_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8GE_PRINT prints a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
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
%    Input, real A(M,N), the R8GE matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8ge_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
