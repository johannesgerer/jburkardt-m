function r8ci_print ( n, a, title )

%*****************************************************************************80
%
%% R8CI_PRINT prints a R8CI matrix.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The R8CI format simply records the first row of the matrix.
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
%    Input, real A(N), the R8CI matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8ci_print_some ( n, a, 1, 1, n, n, title );

  return
end
