function st_print_some ( row1, row2, col1, col2, nst, ist, jst, ast, title )

%*****************************************************************************80
%
%% ST_PRINT_SOME prints some of an ST file.
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
%    Input, integer ROW1, ROW2, the first and last rows to print.
%
%    Input, integer COL1, COL2, the first and last columns to print.
%
%    Input, integer NST, the number of nonzeros.
%
%    Input, integer IST(NST), COL(NST), the row and column indices.
%
%    Input, real A(NST), the nonzero values.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for k = 1 : nst
    if ( row1 <= ist(k) & ist(k) <= row2 & col1 <= jst(k) & jst(k) <= col2 )
      fprintf ( 1, '  %8d  %8d  %8d  %16.8f\n', k, ist(k), jst(k), ast(k) );
    end
  end

  return
end
