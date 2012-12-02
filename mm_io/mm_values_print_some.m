function mm_values_print_some ( rep, field, nnz, indx, jndx, value, ilo, ihi )

%*****************************************************************************80
%
%% MM_VALUES_PRINT_SOME prints some matrix values of a Matrix Market file.
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
%    Input, integer ILO, IHI, the minimum and maximum indices of
%    the data to print.
%
  if ( s_eqi ( rep, 'coordinate' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Sparse array storage by coordinate.\n' );
    fprintf ( 1, '  Listing entries %d through %d\n', ilo, ihi );
    fprintf ( 1, '\n' );
  elseif ( s_eqi ( rep, 'array' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Dense array storage of all elements.\n' );
    fprintf ( 1, '  Listing entries %d through %d\n', ilo, ihi );
    fprintf ( 1, '\n' );
  end

  for i = max ( ilo, 1 ) : min ( ihi, nnz )

    if ( s_eqi ( rep, 'coordinate' ) )
        
      if ( s_eqi ( field, 'pattern' ) )
        fprintf ( 1, '%4d  %6d  %6d\n', i, indx(i), jndx(i) );
      else
        fprintf ( 1, '%4d  %6d  %6d  %f\n', i, indx(i), jndx(i), value(i) );
      end

    elseif ( s_eqi ( rep, 'array' ) )
        
      fprintf ( 1, '%4d  %f\n', i, value(i) );

    end

  end
  
  return
end
