function k = r8cc_ijk ( m, n, nz_num, colptr, rowind, i, j )

%*****************************************************************************80
%
%% R8CC_IJK seeks K, the sparse index of (I,J), the full index of a R8CC matrix.
%
%  Discussion:
%
%    The R8CC format is the double precision sparse compressed column
%    format.  Associated with this format, we have an M by N matrix
%    with NZ_NUM nonzero entries.  We construct the column pointer
%    vector COL of length N+1, such that entries of column J will be
%    stored in positions COL(J) through COL(J+1)-1.  This indexing
%    refers to both the ROW and A vectors, which store the row indices
%    and the values of the nonzero entries.  The entries of the
%    ROW vector corresponding to each column are assumed to be
%    ascending sorted.
%
%    The R8CC format is equivalent to the MATLAB "sparse" format,
%    and the Harwell Boeing "real unsymmetric assembled" (RUA) format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%
%    Input, integer N, the number of columns of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero entries.
%
%    Input, integer COLPTR(N+1), indicate where each column's data begins.
%
%    Input, integer ROWIND(NZ_NUM), the row indices.
%
%    Input, integer I, J, the indices of the value to retrieve.
%
%    Output, integer K, the index of the sparse matrix in which entry
%    (I,J) is stored, or -1 if no such entry exists.
%

%
%  Determine the part of ROW containing row indices of entries
%  in column J.
%
  k1 = colptr(j);
  k2 = colptr(j+1)-1;
%
%  Seek the location K for which ROWIND(K) = I.
%
  k = i4vec_search_binary_a ( k2+1-k1, rowind(k1:k2), i );

  if ( k ~= -1 )
    k = k + k1 - 1;
  end

  return
end
