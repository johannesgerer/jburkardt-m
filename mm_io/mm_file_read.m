function [ id, type, rep, field, symm, nrow, ncol, nnz, indx, jndx, value ] ...
  = mm_file_read ( input_unit )

%*****************************************************************************80
%
%% MM_FILE_READ reads data from a Matrix Market file.
%
%  Discussion:
%
%    The data may be either sparse coordinate format, or dense array format.
%
%    The unit input_unit must be open, and the file will be rewound on return.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the input unit identifier.
%
%    Output, character ( len = 14 ) ID, the Matrix Market identifier.
%    This value must be '%%MatrixMarket'.
%
%    Output, character ( len = 6 ) TYPE, the Matrix Market type.
%    This value must be 'matrix'.
%
%    Output, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Output, character ( len = 7 ) FIELD, the Matrix Market 'field'.
%    Possible values include:
%    'real'
%    'double'
%    'complex'
%    'integer'
%    'pattern'
%
%    Output, character ( len = 19 ) SYMM, the Matrix Market symmetry.
%    Possible values include:
%    'symmetric'
%    'hermitian'
%    'skew-symmetric'
%    'general'
%
%    Output, integer NROW, the number of rows in the matrix.
%
%    Output, integer NCOL, the number of columns in the matrix.
%
%    Output, integer NNZ, the number of nonzero entries required to store
%    the matrix, if REP = 'coordinate'.
%
%    Output, integer INDX(NNZ), the row indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Output, integer JNDX(NNZ), the column indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Output, complex VALUE(NNZ), the matrix values.
%

%
%  Read and check the header line.
%
  [ id, type, rep, field, symm ] = mm_header_read ( input_unit );

  ok = mm_header_check ( id, type, rep, field, symm );
  
  if ( ~ok ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_FILE_READ - Fatal error!\n' );
    fprintf ( 1, '  The header information was not acceptable.\n' );
    error ( 'MM_FILE_READ - Fatal error!' );
  end
%
%  Read through the comment lines:
%
  while ( 1 )

    comment = mm_comment_read ( input_unit );

    if ( comment(1) ~= '%' )
      break;
    end

  end
%
%  The line we just read is not a comment.  It is presumably the SIZE line.
%
  [ nrow, ncol, nnz ] = mm_size_read_string ( comment, rep, symm );
%
%  Read the data values.
%
  [ value, indx, jndx ] = mm_values_read ( input_unit, rep, field, nnz );

  return
end
