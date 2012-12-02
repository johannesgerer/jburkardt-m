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
