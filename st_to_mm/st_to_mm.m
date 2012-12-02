function st_to_mm ( input_file, output_file )

%*****************************************************************************80
%
%% ST_TO_MM converts sparse matrix data from an ST file to an MM file.
%
%  Usage:
%
%    st_to_mm ( 'file.st', 'file.mm' )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the input ST file.
%
%    Input, string OUTPUT_FILE, the name of the output MM file.
%

%
%  Read information.
%
  [ nrow, ncol, nnzero ] = st_header_read ( input_file );

  [ row, col, a ] = st_data_read ( input_file, nrow, ncol, nnzero );
%
%  Adjust information.
%
  base0 = 0;
  base1 = 1;
  row = st_rebase ( base0, base1, nnzero, row );
  col = st_rebase ( base0, base1, nnzero, col );
%
%  Write information to ST file.
%
  output_unit = fopen ( output_file, 'wt' );
  
  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_TO_MM - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'ST_TO_MM - Fatal error!' );
  end

  mm_header_write ( output_unit, '%%MatrixMarket', 'matrix', 'coordinate', 'real', 'general' );

  mm_size_write ( output_unit, 'coordinate', nrow, ncol, nnzero );

  mm_values_write ( output_unit, 'coordinate', 'real', nnzero, row, col, a );

  fclose ( output_unit );

  return
end
function c2 = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C2, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c2 = c + 'A' - 'a';
  else
    c2 = c;
  end

  return
end
function mm_header_write ( output_unit, id, type, rep, field, symm )

%*****************************************************************************80
%
%% MM_HEADER_WRITE prints header information to a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the output unit identifier.
%
%    Input, character ( len = 14 ) ID, the Matrix Market identifier.
%    This value must be '%%MatrixMarket'.
%
%    Input, character ( len = 6 ) TYPE, the Matrix Market type.
%    This value must be 'matrix'.
%
%    Input, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Input, character ( len = 7 ) FIELD, the Matrix Market 'field'.
%    Possible values include:
%    'real'
%    'double'
%    'complex'
%    'integer'
%    'pattern'
%
%    Input, character ( len = 19 ) SYMM, the Matrix Market symmetry.
%    Possible values include:
%    'symmetric'
%    'hermitian'
%    'skew-symmetric'
%    'general'
%
  fprintf ( output_unit, '%s  %s  %s  %s  %s\n', ...
    id, type, rep, field, symm );

  return
end
function mm_size_write ( output_unit, rep, nrow, ncol, nnz )

%*****************************************************************************80
%
%% MM_SIZE_WRITE writes size information to a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the input file unit.
%
%    Input, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Input, integer NROW, the number of rows in the matrix.
%
%    Input, integer NCOL, the number of columns in the matrix.
%
%    Input, integer NNZ, the number of nonzero entries required to store
%    the matrix.
%
  if ( s_eqi ( rep, 'coordinate' ) )
    fprintf ( output_unit, '%d  %d  %d\n', nrow, ncol, nnz );
  elseif ( s_eqi ( rep, 'array' ) )
    fprintf ( output_unit, '%d  %d\n', nrow, ncol );
  end

  return
end
function mm_values_write ( output_unit, rep, field, nnz, indx, jndx, value )

%*****************************************************************************80
%
%% MM_VALUES_WRITE writes matrix values to a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the output unit identifier.
%
%    Input, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Input, character ( len = 7 ) FIELD, the Matrix Market 'field'.
%    Possible values include:
%    'real'
%    'double'
%    'complex'
%    'integer'
%    'pattern'
%
%    Input, integer NNZ, the number of nonzero entries required to store
%    the matrix, if REP = 'coordinate'.
%
%    Input, integer INDX(NNZ), the row indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Input, integer JNDX(NNZ), the column indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Input, complex VALUE(NNZ), the matrix values.
%
  if ( s_eqi ( rep, 'coordinate' ) )

    if ( s_eqi ( field, 'pattern' ) )
      for i = 1 : nnz
        fprintf ( output_unit, '%d  %d\n', indx(i), jndx(i) );
      end
    else
      for i = 1 : nnz
        fprintf ( output_unit, '%d  %d  %f\n',  indx(i), jndx(i), value(i) );
      end
    end

  elseif ( s_eqi ( rep, 'array' ) )

    for i = 1 : nnz
      fprintf ( output_unit, '%f\n', value(i) );
    end

  end

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = FALSE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = FALSE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  value = TRUE;

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
