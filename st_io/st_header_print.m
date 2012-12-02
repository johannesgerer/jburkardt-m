function st_header_print ( nrow, ncol, nnzero )

%*****************************************************************************80
%
%% ST_HEADER_PRINT prints the header of an ST file.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ST header information:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows =     %d\n', nrow );
  fprintf ( 1, '  Number of columns =  %d\n', ncol );
  fprintf ( 1, '  Number of nonzeros = %d\n', nnzero );

  return
end
