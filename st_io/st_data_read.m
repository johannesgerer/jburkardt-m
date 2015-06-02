function [ ist, jst, ast ] = st_data_read ( input_filename, m, n, nst )

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
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the ST file.
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, integer NST, the number of nonzeros.
%
%    Output, integer IST(NST), JST(NST), the row and column indices.
%
%    Output, real AST(NST), the nonzero values.
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

  for k = 1 : nst

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ST_DATA_READ - Error!\n' );
      fprintf ( 1, '  Premature end of input data.\n' );
      error ( 'ST_DATA_READ - Error!' );
      break
    end

    [ x, count ] = sscanf ( line, string );

    ist(k) = x(1);
    jst(k) = x(2);
    ast(k) = x(3);

  end

  fclose ( input_unit );

  return
end
