function lmat_transpose_print ( m, n, a, title )

%*****************************************************************************80
%
%% LMAT_TRANSPOSE_PRINT prints an LMAT, transposed.
%
%  Discussion:
%
%    An LMAT is an array of L values.
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
%    Input, integer M, N, the number of rows and columns.
%
%    Input, logical A(M,N), an M by N matrix to be printed.
%
%    Input, string TITLE, a title.
%
  lmat_transpose_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
