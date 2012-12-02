function mm_size_print ( input_filename, rep, symm, nrow, ncol, nnz )

%*****************************************************************************80
%
%% MM_SIZE_PRINT prints size information from a Matrix Market file.
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
%    Input, character ( len = * ) INPUT_FILENAME, the input file name.
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
%    Input, integer NROW, the number of rows in the matrix.
%
%    Input, integer NCOL, the number of columns in the matrix.
%
%    Input, integer NNZ, the number of nonzero entries required to store
%    the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_SIZE_PRINT:\n' );
  fprintf ( 1, '  Size information from Matrix Market file "%s"\n', ...
    input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of rows    NROW = %d\n', nrow );
  fprintf ( 1, '  Number of columns NCOL = %d\n', ncol );

  if ( s_eqi ( rep, 'coordinate' ) ) 
    fprintf ( 1, '  Declared number of nonzeros NNZ = %d\n', nnz );
  elseif ( s_eqi ( rep, 'array' ) ) 
    nnz = mm_nnz_set ( rep, symm, nrow, ncol );
    fprintf ( 1, '  Inferred number of nonzeros NNZ = %d\n', nnz );
  end

  return
end
