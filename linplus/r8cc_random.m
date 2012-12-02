function [ a, seed ] = r8cc_random ( m, n, nz_num, colptr, rowind, seed )

%*****************************************************************************80
%
%% R8CC_RANDOM randomizes a R8CC matrix.
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
%    Input, integer NZ_NUM, the number of nonzero elements in A.
%
%    Input, integer COLPTR(N+1), points to the first element of each column.
%
%    Input, integer ROWIND(NZ_NUM), contains the row indices of the elements.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(NZ_NUM), the matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for j = 1 : n
    for k = colptr(j) : colptr(j+1) - 1
      [ a(k), seed ] = r8_uniform_01 ( seed );
    end
  end

  return
end
