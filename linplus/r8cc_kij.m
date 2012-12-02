function [ i, j ] = r8cc_kij ( m, n, nz_num, colptr, rowind, k )

%*****************************************************************************80
%
%% R8CC_KIJ seeks (I,J), the full index of K, the sparse index of a R8CC matrix.
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
%    Input, integer K, the sparse index of an entry of the matrix.
%    1 <= K <= NZ_NUM.
%
%    Output, integer I, J, the full indices corresponding to the sparse
%    index K.
%
  i = -1;
  j = -1;

  if ( k < 1 | nz_num < k )
    return
  end
%
%  The row index is easy.
%
  i = rowind(k);
%
%  Determine the column by bracketing in COLPTR.
%
  for jj = 1 : n
    k1 = colptr(jj);
    k2 = colptr(jj+1)-1;
    if ( k1 <= k & k <= k2 )
      j = jj;
      break
    end
  end

  if ( j == -1 )
    return;
  end

  return
end
