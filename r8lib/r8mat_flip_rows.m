function b = r8mat_flip_rows ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_FLIP_ROWS reverses the order of the rows of an R8MAT.
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
  b(m:-1:1,1:n) = a(1:m,1:n);

  return
end

