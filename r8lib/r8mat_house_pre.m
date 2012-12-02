function h = r8mat_house_pre ( n, a, irow, jcol )

%*****************************************************************************80
%
%% R8MAT_HOUSE_PRE computes a Householder pre-multiplier matrix.
%
%  Discussion:
%
%    H(IROW,JCOL) has the property that the JCOL-th column of
%    H(IROW,JCOL)*A is zero from entry IROW+1 to the end.
%
%    In the most common case, where a QR factorization is being computed,
%    IROW = JCOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
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
%    Input, integer IROW, JCOL, specify the location of the
%    entry of the matrix A which is to be preserved.  The entries in
%    the same column, but higher rows, will be zeroed out if A is
%    premultiplied by H.
%
%    Output, real H(N,N), the Householder matrix.
%

%
%  Set up the vector V.
%
  w(1:irow-1) = 0.0;
  w(irow:n) = a(irow:n,jcol);

  v = r8vec_house_column ( n, w, irow );
%
%  Form the matrix H(V).
%
  h = r8mat_house_form ( n, v );

  return
end
