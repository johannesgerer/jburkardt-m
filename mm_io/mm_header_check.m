function value = mm_header_check ( id, type, rep, field, symm )

%*****************************************************************************80
%
%% MM_HEADER_CHECK checks the header strings for a Matrix Market file.
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
%    Output, logical VALUE, is TRUE if the header checks out.
%
  FALSE = 0;
  TRUE = 1;
%
%  Test the input qualifiers.
%
  if ( s_neqi ( id, '%%MatrixMarket' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The value of ID was illegal:\n' );
    fprintf ( 1, '    "%s".\n', id );
    fprintf ( 1, '  Legal values are:\n' );
    fprintf ( 1, '    "%%MatrixMarket"\n' );
    value = FALSE;
    return;
  end

  if ( s_neqi ( type, 'matrix' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The value of TYPE was illegal:\n' );
    fprintf ( 1, '    "%s".\n', type );
    fprintf ( 1, '  Legal values are:\n' );
    fprintf ( 1, '    "matrix"\n' );
    value = FALSE;
    return
  end

  if ( ...
    s_neqi ( rep, 'coordinate' ) & ...
    s_neqi ( rep, 'array'      ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The value of REP was illegal:\n' );
    fprintf ( 1, '    "%s".\n', rep );
    fprintf ( 1, '  Legal values are:\n' );
    fprintf ( 1, '    "array"\n' );
    fprintf ( 1, '    "coordinate"\n' );
    value = FALSE;
    return
  end

  if ( s_eqi ( rep, 'coordinate' ) )

    if ( ...
      s_neqi ( field, 'integer' ) & ...
      s_neqi ( field, 'real'    ) & ...
      s_neqi ( field, 'double'  ) & ...
      s_neqi ( field, 'complex' ) & ...
      s_neqi ( field, 'pattern' ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The value of FIELD was illegal:\n' );
      fprintf ( 1, '    "%s".\n', field );
      value = FALSE;
      return
    end

  elseif ( s_eqi ( rep, 'array' ) )

    if ( ...
      s_neqi ( field, 'integer' ) & ...
      s_neqi ( field, 'real'    ) & ...
      s_neqi ( field, 'double'  ) & ...
      s_neqi ( field, 'complex' ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The value of FIELD was illegal:\n' );
      fprintf ( 1, '    "%s".\n', field );
      value = FALSE;
      return
    end

  end

  if ( ...
    s_neqi ( symm, 'general'        ) & ...
    s_neqi ( symm, 'symmetric'      ) & ...
    s_neqi ( symm, 'hermitian'      ) & ...
    s_neqi ( symm, 'skew-symmetric' ) ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_HEADER_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The value of SYMM was illegal:\n' );
    fprintf ( 1, '    "%s".\n', symm );
    value = FALSE;
    return
  end
      
  value = TRUE;

  return
end
