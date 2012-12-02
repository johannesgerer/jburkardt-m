function st_data_print ( nrow, ncol, nnzero, row, col, a, title )

%*****************************************************************************80
%
%% ST_DATA_PRINT prints the data in an ST file.
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
%    Input, integer NROW, the assumed number of rows in the matrix.
%
%    Input, integer NCOL, the assumed number of columns in the matrix.
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
  st_data_print_some ( 0, nrow-1, 0, ncol-1, nnzero, row, col, a, title );

  return
end
