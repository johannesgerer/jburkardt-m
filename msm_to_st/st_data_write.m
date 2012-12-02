function st_data_write ( output_filename, nrow, ncol, nnzero, row, col, a )

%*****************************************************************************80
%
%% ST_DATA_WRITE writes the data of an ST file.
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
%    Input, string OUTPUT_FILENAME, the name of the ST file.
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
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_DATA_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'ST_DATA_WRITE - Error!' );
    return;
  end

  for k = 1 : nnzero

    fprintf ( output_unit, '  %8d  %8d  %16.8f\n', row(k), col(k), a(k) );

  end

  fclose ( output_unit );

  return
end
