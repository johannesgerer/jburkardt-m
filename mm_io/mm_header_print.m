function mm_header_print ( input_filename, id, type, rep, field, symm )

%*****************************************************************************80
%
%% MM_HEADER_PRINT prints header information from a Matrix Market file.
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
%    Input, character ( len = * ) INPUT_FILENAME, the input file name.
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
  fprintf ( 1, '\n');
  fprintf ( 1, 'MM_HEADER_PRINT:\n' );
  fprintf ( 1, '  Header information from Matrix Market file "%s".\n', ...
    input_filename );
  fprintf ( 1, '\n');
  fprintf ( 1, '  Matrix Market ID = "%s".\n', id );
  fprintf ( 1, '    "%%%%MatrixMarket" is only allowed value.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '  Matrix Market TYPE = "%s".\n', type );
  fprintf ( 1, '    "matrix" is only allowed value.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '  Representation type REP = "%s".\n', rep );
  fprintf ( 1, '    "coordinate" for sparse matrices,\n' );
  fprintf ( 1, '    "array"      for dense matrices,\n' );
  fprintf ( 1, '    "elemental"  for unassembled finite element matrices.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '  Numeric FIELD = "%s".\n', field );
  fprintf ( 1, '    "integer" for integer values,\n' );
  fprintf ( 1, '    "real"    for real values,\n' );
  fprintf ( 1, '    "double"  for double precision real values,\n' );
  fprintf ( 1, '    "complex" for complex values,\n' );
  fprintf ( 1, '    "pattern" for nonzero pattern only.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '  Symmetry type SYMM = "%s".\n', symm );
  fprintf ( 1, '    "general"         no symmetry,\n' );
  fprintf ( 1, '    "symmetric"       A(I,J) = A(J,I),\n' );
  fprintf ( 1, '                      input only lower triangle.\n' );
  fprintf ( 1, '    "skew-symmetric"  A(I,J) = - A(J,I),\n' );
  fprintf ( 1, '                      input only strict lower triangle.\n' );
  fprintf ( 1, '    "Hermitian"       A(I,J) = A*(J,I),\n' );
  fprintf ( 1, '                      input only lower triangle.\n' );

  return
end
