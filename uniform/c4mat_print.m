function c4mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% C4MAT_PRINT prints a C4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, complex A(M,N), the matrix.
%
%    Input, string TITLE, a title.
%
  c4mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
