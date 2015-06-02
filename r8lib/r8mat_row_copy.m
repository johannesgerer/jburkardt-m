function a = r8mat_row_copy ( m, n, i, v, a )

%******************************************************************************/
%
%% R8MAT_ROW_COPY copies a vector into a row of an R8MAT.
%
%  Discussion:
%
%    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, integer I, the index of the row.
%    1 <= I <= M.
%
%    Input, real V(N), the row to be copied.
%
%    Input/output, real A(M,N), the matrix into which
%    the row is to be copied.
%
  v = v(:);
  a(i,1:n) = v(1:n)';

  return
end
