function mm_file_write ( output_unit, id, type, rep, field, symm, nrow, ...
  ncol, nnz, indx, jndx, value )

%*****************************************************************************80
%
%% MM_FILE_WRITE writes data to a Matrix Market file.
%
%  Discussion:
%
%    The data may be either sparse coordinate format, or dense array format.
%
%    The unit OUTPUT_UNIT must be open.
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
%    'pattern' (for REP = 'coordinate' only)
%
%    Input, character ( len = 19 ) SYMM, the Matrix Market symmetry.
%    Possible values include:
%    'symmetric'
%    'hermitian'
%    'skew-symmetric'
%    'general'
%
%    Input, integer NROW, the number of rows in the matrix.
%
%    Input, integer NCOL, the number of columns in the matrix.
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

%
%  Test the header values.
%
  ok = mm_header_check ( id, type, rep, field, symm );
  
  if ( ~ok )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_FILE_WRITE - Fatal error!\n' );
    fprintf ( 1, '  MM_HEADER_CHECKER failed the header information.\n' );
    error ( 'MM_FILE_WRITE - Fatal error!' );
  end
%
%  Write the header line.
%
  mm_header_write ( output_unit, id, type, rep, field, symm );
%
%  Write some comment lines.
%
  mm_comment_write ( output_unit, ' ' );
  mm_comment_write ( output_unit, ...
    'This file created by MM_FILE_WRITE of MM_IO.M.' );
  mm_comment_write ( output_unit, ' ' );
%
%  Write the size line.
%
  mm_size_write ( output_unit, rep, nrow, ncol, nnz )
%
%  Determine NNZ where necessary.
%
  nnz2 = mm_nnz_set ( rep, symm, nrow, ncol );
%
%  Write the data.
%
  if ( s_eqi ( rep, 'coordinate' ) )
    mm_values_write ( output_unit, rep, field, nnz, indx, jndx, value );
  else
    mm_values_write ( output_unit, rep, field, nnz2, indx, jndx, value );
  end

  return
end
