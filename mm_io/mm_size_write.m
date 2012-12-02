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
