function g = r8mat_givens_pre ( n, a, irow, jcol )

%*****************************************************************************80
%
%% R8MAT_GIVENS_PRE computes the Givens premultiplier rotation matrix.
%
%  Discussion:
%
%    The Givens premultiplier rotation matrix G(IROW,JCOL) has the
%    property that the (IROW,JCOL)-th entry of G*A is zero.
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
%    Input, integer N, the order of the matrices A and G.
%
%    Input, real A(N,N), the matrix to be operated upon.
%
%    Input, integer IROW, JCOL, the row and column of the
%    entry of the G*A which is to be zeroed out.
%
%    Output, real G(N,N), the Givens rotation matrix.
%    G is an orthogonal matrix, that is, the inverse of
%    G is the transpose of G.
%
  g = r8mat_identity ( n );

  theta = atan2 ( a(irow,jcol), a(jcol,jcol) );

  g(irow,irow) =  cos ( theta );
  g(irow,jcol) = -sin ( theta );
  g(jcol,irow) =  sin ( theta );
  g(jcol,jcol) =  cos ( theta );

  return
end
