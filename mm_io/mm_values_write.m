function mm_values_write ( output_unit, rep, field, nnz, indx, jndx, value )

%*****************************************************************************80
%
%% MM_VALUES_WRITE writes matrix values to a Matrix Market file.
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
  if ( s_eqi ( rep, 'coordinate' ) )

    if ( s_eqi ( field, 'pattern' ) )
      for i = 1 : nnz
        fprintf ( output_unit, '%d  %d\n', indx(i), jndx(i) );
      end
    else
      for i = 1 : nnz
        fprintf ( output_unit, '%d  %d  %f\n',  indx(i), jndx(i), value(i) );
      end
    end

  elseif ( s_eqi ( rep, 'array' ) )

    for i = 1 : nnz
      fprintf ( output_unit, '%f\n', value(i) );
    end

  end

  return
end
