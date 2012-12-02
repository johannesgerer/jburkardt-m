function i4mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% I4MAT_PRINT prints an I4MAT.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, string TITLE, a title.
%
  i4mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
