function b = st_to_msm ( input_file )

%*****************************************************************************80
%
%% ST_TO_MSM converts an ST file to a MATLAB Sparse Matrix.
%
%  Usage:
%
%    a = st_to_msm ( 'file.st' )
%
%    where
%
%    'file.st' is the name of the ST file to be read.
%    a is the name of the MATLAB Sparse Matrix created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the input ST file.
%
%    Output, real sparse B(), the MATLAB Sparse Matrix.
%
  [ nrow, ncol, nnzero ] = st_header_read ( input_file );

  [ row, col, a ] = st_data_read ( input_file, nrow, ncol, nnzero );

  base0 = 0;
  base1 = 1;
  row = st_rebase ( base0, base1, nnzero, row );
  col = st_rebase ( base0, base1, nnzero, col );
%
%  Make a sparse version of the matrix.
%
  b = sparse ( row, col, a, nrow, ncol, nnzero );

  return
end
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
function indx = st_rebase ( base1, base2, nnzero, indx )

%*****************************************************************************80
%
%% ST_REBASE changes the base of an index array.
%
%  Discussion:
%
%    Both the ROW and COL arrays are ordinarily 0-based in the ST format.
%    FORTRAN and MATLAB expect 1-based indices.
%
%    To convert ROW and COL from 0-based to 1-based form, call this routine
%    with BASE1=0, BASE2=1.
%
%    If ROW and COL from FORTRAN or MATLAB are to be converted to ST format,
%    call this routine with BASE1=1 and BASE2=0.
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
%    Input, integer BASE1, BASE2, the old and new bases.
%
%    Input, integer NNZERO, the number of nonzeros in the matrix.
%
%    Input, integer INDX(NNZERO), the index vector to be rebased.
%
%    Output, integer INDX(NNZERO), the index vector
%    to be rebased.
%
  indx(1:nnzero) = indx(1:nnzero) - base1 + base2;

  return
end

