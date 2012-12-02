function  [ id, type, rep, field, symm ] = mm_header_read ( input_unit )

%*****************************************************************************80
%
%% MM_HEADER_READ reads the header line from a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2004
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
  header = fgets ( input_unit );
  
  if ( header == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  An empty header line was read.\n' );
    error ( 'MM_HEADER_READ - Fatal error!' )
  end

  [ id,    header ] = strtok ( header );
  [ type,  header ] = strtok ( header );
  [ rep,   header ] = strtok ( header );
  [ field, header ] = strtok ( header );
  [ symm,  header ] = strtok ( header );
  
  return
end
