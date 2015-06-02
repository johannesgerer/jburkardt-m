function st_write ( output_filename, m, n, nst, ist, jst, ast )

%*****************************************************************************80
%
%% ST_WRITE writes an ST file.
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
%    Input, string OUTPUT_FILENAME, the name of the ST file.
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
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'ST_WRITE - Error!' );
    return;
  end

  for k = 1 : nst

    fprintf ( output_unit, '  %8d  %8d  %16.8f\n', ist(k), jst(k), ast(k) );

  end

  fclose ( output_unit );

  return
end
