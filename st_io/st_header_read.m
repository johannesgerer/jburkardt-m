function [ nrow, ncol, nnzero ] = st_header_read ( input_filename )

%*****************************************************************************80
%
%% ST_HEADER_READ reads the header of an ST file.
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
%    Output, integer NROW, the assumed number of rows in the matrix.
%
%    Output, integer NCOL, the assumed number of columns in the matrix.
%
%    Output, integer NNZERO, the assumed number of nonzeros in the matrix.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_HEADER_READ - Error%\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'ST_HEADER_READ - Error%' );
    return
  end

  nnzero = 0;
  nrow = 0;
  ncol = 0;

  string = '  %d  %d  %f';

  while ( 1 )

    line = fgets ( input_unit );

    if ( line == -1 )
      break
    end

    [ x, count ] = sscanf ( line, string );

    i = x(1);
    j = x(2);
    aij = x(3);

    nnzero = nnzero + 1;
    nrow = max ( nrow, i + 1 );
    ncol = max ( ncol, j + 1 );

  end

  fclose ( input_unit );

  return
end
