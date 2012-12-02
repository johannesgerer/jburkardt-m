function [ nrow, ncol, nnz ] = mm_size_read_string ( string, rep, symm )

%*****************************************************************************80
%
%% MM_SIZE_READ_STRING reads size information from a string.
%
%  Discussion:
%
%    The string is presumed to be the "size" record from a valid
%    Matrix Market file.
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
%    Input, string STRING, the string to be read.
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

    [ a, count ] = sscanf ( string, '%d %d %d', 3 );

    if ( count < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_SIZE_READ_STRING - Fatal error!\n' );
      fprintf ( '  I/O error while reading size information.\n' );
      fprintf ( '  Expecting "NROW NCOL NNZ" values.\n' );
      error ( 'MM_SIZE_READ_STRING - Fatal error!' );
    end

    nrow = a(1);
    ncol = a(2);
    nnz = a(3);
    
  elseif ( s_eqi ( rep, 'array' ) )

    [ a, count ] = sscanf ( string, '%d %d', 2 );
    
    if ( count < 2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_SIZE_READ_STRING - Fatal error!\n' );
      fprintf ( '  I/O error while reading size information.\n' );
      fprintf ( '  Expecting "NROW NCOL" values.\n' );
      error ( 'MM_SIZE_READ_STRING - Fatal error!' );
    end

    nrow = a(1);
    ncol = a(2);
    nnz = mm_nnz_set ( rep, symm, nrow, ncol );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_SIZE_READ_STRING - Fatal error!\n' );
    fprintf ( 1, '  Unexpected value of REP.\n' );
    error ( 'MM_SIZE_READ_STRING - Fatal error!' );

  end

  return
end
