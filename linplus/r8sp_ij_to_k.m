function k = r8sp_ij_to_k ( nz_num, row, col, i, j )

%*****************************************************************************80
%
%% R8SP_IJ_TO_K seeks the compressed index of the (I,J) entry of A.
%
%  Discussion:
%
%    If A(I,J) is nonzero, then its value is stored in location K.
%
%    This routine searches the R8SP storage structure for the index K
%    corresponding to (I,J), returning -1 if no such entry was found.
%
%    This routine assumes that the data structure has been sorted,
%    so that the entries of ROW are ascending sorted, and that the
%    entries of COL are ascending sorted, within the group of entries
%    that have a common value of ROW.
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NZ_NUM, the number of nonzero elements in
%    the matrix.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and
%    column indices of the nonzero elements.
%
%    Input, integer I, J, the row and column indices of the
%    matrix entry.
%
%    Output, integer K, the R8SP index of the (I,J) entry.
%
  lo = 1;
  hi = nz_num;

  while ( 1 )

    if ( hi < lo )
      k = -1;
      break
    end

    md = floor ( ( lo + hi ) / 2 );

    if ( row(md) < i | ( row(md) == i & col(md) < j ) )
      lo = md + 1;
    elseif ( i < row(md) | ( row(md) == i & j < col(md) ) )
      hi = md - 1;
    else
      k = md;
      break
    end

  end

  return
end
