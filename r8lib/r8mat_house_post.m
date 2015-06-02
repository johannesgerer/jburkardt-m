function h = r8mat_house_post ( n, a, row, col )

%*****************************************************************************80
%
%% R8MAT_HOUSE_POST computes a Householder post-multiplier matrix.
%
%  Discussion:
%
%    H(ROW,COL) has the property that the ROW-th column of
%    A*H(ROW,COL) is zero from entry COL+1 to the end.
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
%    27 April 2013
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
%    the same row, but higher column, will be zeroed out if
%    A is postmultiplied by H.
%
%    Output, real H(N,N), the Householder matrix.
%

%
%  Set up the vector V.
%
  a_row(1,1:col-1) = 0.0;
  a_row(1,col:n) = a(row,col:n);

  a_row = a_row';

  v = r8vec_house_column ( n, a_row, col );
%
%  Form the matrix H(V).
%
  h = r8mat_house_form ( n, v );

  return
end
