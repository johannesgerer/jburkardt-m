function value = r8mat_min ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MIN returns the minimum entry of an M by N R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Output, real VALUE, the minimum entry of A.
%
  value = min ( min ( a(1:m,1:n) ) );

  return
end
