function st_print ( m, n, nst, ist, jst, ast, title )

%*****************************************************************************80
%
%% ST_PRINT prints an ST file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, integer NST, the number of nonzeros.
%
%    Input, integer IST(NST), JST(NST), the row and column indices.
%
%    Input, real AST(NST), the nonzero values.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for k = 1 : nst
    fprintf ( 1, '  %8d  %8d  %8d  %16.8f\n', k, ist(k), jst(k), ast(k) );
  end

  return
end
