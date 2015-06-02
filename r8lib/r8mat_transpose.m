function at = r8mat_transpose ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE transposes an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real A(M,N), the matrix to be transposed.
%
%    Output, real AT(N,M), the transposed matrix.
%
  at = a';

  return
end
