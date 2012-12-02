function st_data_print_some ( row1, row2, col1, col2, nnzero, row, col, a, ...
  title )

%*****************************************************************************80
%
%% ST_DATA_PRINT_SOME prints some of the data in an ST file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
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
%    Input, integer NNZERO, the assumed number of nonzeros in the matrix.
%
%    Input, integer ROW(NNZERO), COL(NNZERO), the 0-based row and column
%    index of a nonzero matrix entry.
%
%    Input, real A(NNZERO), the value of a nonzero matrix entry.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for k = 1 : nnzero
    if ( row1 <= row(k) & row(k) <= row2 & col1 <= col(k) & col(k) <= col2 )
      fprintf ( 1, '  %8d  %8d  %8d  %16.8f\n', k, row(k), col(k), a(k) );
    end
  end

  return
end
