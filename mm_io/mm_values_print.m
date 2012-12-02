function mm_values_print ( rep, field, nnz, indx, jndx, value )

%*****************************************************************************80
%
%% MM_VALUES_PRINT prints the matrix values of a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
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
  ilo = 1;
  ihi = nnz;

  mm_values_print_some ( rep, field, nnz, indx, jndx, value, ilo, ihi );

  return
end
