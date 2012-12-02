function [ nrow, ncol, nnz ] = mm_size_read_file ( input_unit, rep, symm )

%*****************************************************************************80
%
%% MM_SIZE_READ_FILE reads size information from a Matrix Market file.
%
%  Discussion:
%
%    This routine assumes that the next line of the file is the size
%    record.  However, a Matrix Market file may contain comment lines
%    between the first record and the size record.  In that case, you
%    might prefer using MM_COMMENT_READ to read each line until you
%    find the first noncomment (comment lines must begin with the
%    percent character) and then passing that line to MM_SIZE_READ_STRING.
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
%    Input, integer INPUT_FILE, the input file unit.
%
%    Input, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Input, character ( len = 19 ) SYMM, the Matrix Market symmetry.
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
  if ( s_eqi ( rep, 'coordinate' ) )

    [ a, count ] = fscanf ( input_unit, '(%d %d %d)', 3 );

    if ( count < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_SIZE_READ_FILE - Fatal error!\n' );
      fprintf ( '  I/O error while reading size information.\n' );
      fprintf ( '  Expecting "NROW NCOL NNZ" values.\n' );
      error ( 'MM_SIZE_READ_FILE - Fatal error!' );
    end

    nrow = a(1);
    ncol = a(2);
    nnz = a(3);
    
  elseif ( s_eqi ( rep, 'array' ) )

    [ a, count ] = fscanf ( input_unit, '(%d %d)', 2 );

    if ( count < 2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_SIZE_READ_FILE - Fatal error!\n' );
      fprintf ( '  I/O error while reading size information.\n' );
      fprintf ( '  Expecting "NROW NCOL" values.\n' );
      error ( 'MM_SIZE_READ_FILE - Fatal error!' );
    end

    nrow = a(1);
    ncol = a(2);
    nnz = mm_nnz_set ( rep, symm, nrow, ncol );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_SIZE_READ_FILE - Fatal error!\n' );
    fprintf ( 1, '  Unexpected value of REP.\n' );
    error ( 'MM_SIZE_READ_FILE - Fatal error!' );

  end

  return
end
