function nnz = mm_nnz_set ( rep, symm, nrow, ncol )

%*****************************************************************************80
%
%% MM_NNZ_SET sets the value of NNZ for the ARRAY representation.
%
%  Discussion:
%
%    If the representation is not "ARRAY", then NNZ is returned as 0.
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
%    Output, integer NNZ, the number of nonzero entries required to store
%    the matrix.
%
  nnz = 0;
  
  if ( s_eqi ( rep, 'coordinate' ) )

  elseif ( s_eqi ( rep, 'array' ) )

    if ( s_eqi ( symm, 'general' ) )
      nnz = nrow * ncol;
    elseif ( s_eqi ( symm, 'symmetric' ) || s_eqi ( symm, 'hermitian' ) )
      nnz = floor ( ( nrow * ncol - nrow ) / 2 ) + nrow;
    elseif ( s_eqi ( symm, 'skew-symmetric' ) )
      nnz = floor ( ( nrow * ncol - nrow ) / 2 );
    end

  end

  return
end
