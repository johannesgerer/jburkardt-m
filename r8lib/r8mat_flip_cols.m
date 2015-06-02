function b = r8mat_flip_cols ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_FLIP_COLS reverses the order of the columns of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Output, real B(M,N), the reordered matrix.
%
  b(1:m,n:-1:1) = a(1:m,1:n);

  return
end

