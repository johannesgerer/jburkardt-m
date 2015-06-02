function l4mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% L4MAT_PRINT prints an L4MAT.
%
%  Discussion:
%
%    An L4MAT is an array of L4 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, logical A(M,N), the matrix.
%
%    Input, string TITLE, a title.
%
  l4mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
