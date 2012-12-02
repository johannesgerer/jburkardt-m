function h = r8mat_house_post ( n, a, irow, jcol )

%*****************************************************************************80
%
%% R8MAT_HOUSE_POST computes a Householder post-multiplier matrix.
%
%  Discussion:
%
%    H(IROW,JCOL) has the property that the IROW-th column of
%    A*H(IROW,JCOL) is zero from entry JCOL+1 to the end.
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
%    the same row, but higher column, will be zeroed out if
%    A is postmultiplied by H.
%
%    Output, real H(N,N), the Householder matrix.
%

%
%  Set up the vector V.
%
  w(1:jcol-1) = 0.0;
  w(jcol:n) = a(irow,jcol:n);

  v = r8vec_house_column ( n, w, jcol );
%
%  Form the matrix H(V).
%
  h = r8mat_house_form ( n, v );

  return
end
