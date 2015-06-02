function h = r8mat_house_pre ( n, a, row, col )

%*****************************************************************************80
%
%% R8MAT_HOUSE_PRE computes a Householder pre-multiplier matrix.
%
%  Discussion:
%
%    H(ROW,COL) has the property that the COL-th column of
%    H(ROW,COL)*A is zero from entry ROW+1 to the end.
%
%    In the most common case, where a QR factorization is being computed,
%    ROW = COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%
%    Input, real A(N,N), the matrix whose Householder matrix
%    is to be computed.
%
%    Input, integer ROW, COL, specify the location of the
%    entry of the matrix A which is to be preserved.  The entries in
%    the same column, but higher rows, will be zeroed out if A is
%    premultiplied by H.
%
%    Output, real H(N,N), the Householder matrix.
%

%
%  Set up the vector V.
%
  a_col(1:row-1,1) = 0.0;
  a_col(row:n,1) = a(row:n,col);

  v = r8vec_house_column ( n, a_col, row );
%
%  Form the matrix H(V).
%
  h = r8mat_house_form ( n, v );

  return
end
