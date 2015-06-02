function [ row, col, a ] = st_data_read ( input_filename, nrow, ncol, nnzero )

%*****************************************************************************80
%
%% ST_DATA_READ reads the data of an ST file.
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
%    Input, string INPUT_FILENAME, the name of the ST file.
%
%    Input, integer NROW, the assumed number of rows in the matrix.
%
%    Input, integer NCOL, the assumed number of columns in the matrix.
%
%    Input, integer NNZERO, the assumed number of nonzeros in the matrix.
%
%    Output, integer ROW(NNZERO), COL(NNZERO), the 0-based row and column
%    index of a nonzero matrix entry.
%
%    Output, real A(NNZERO), the value of a nonzero matrix entry.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'ST_DATA_READ - Error!' );
    return
  end

  string = '  %d  %d  %f';

  for k = 1 : nnzero

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ST_DATA_READ - Error!\n' );
      fprintf ( 1, '  Premature end of input data.\n' );
      error ( 'ST_DATA_READ - Error!' );
      break
    end

    [ x, count ] = sscanf ( line, string );

    row(k) = x(1);
    col(k) = x(2);
    a(k) = x(3);

  end

  fclose ( input_unit );

  return
end
