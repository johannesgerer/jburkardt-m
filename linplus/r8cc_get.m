function aij = r8cc_get ( m, n, nz_num, colptr, rowind, a, i, j )

%*****************************************************************************80
%
%% R8CC_GET gets a value of a R8CC matrix.
%
%  Discussion:
%
%    It is legal to request entries of the matrix for which no storage
%    was set aside.  In that case, a zero value will be returned.
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
%    Input, real A(NZ_NUM), the nonzero entries.
%
%    Input, integer I, J, the indices of the value to retrieve.
%
%    Output, real AIJ, the value of A(I,J).
%

%
%  Seek sparse index K corresponding to full index (I,J).
%
  k = r8cc_ijk ( m, n, nz_num, colptr, rowind, i, j );
%
%  If no K was found, then be merciful, and simply return 0.
%
  if ( k == -1 )
    aij = 0.0;
  else
    aij = a(k);
  end

  return
end
