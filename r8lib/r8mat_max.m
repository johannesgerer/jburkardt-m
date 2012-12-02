function value = r8mat_max ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MAX returns the maximum entry of an R8MAT.
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
%    Input, real A(M,N), the M by N matrix.
%
%    Output, real VALUE, the maximum entry of A.
%
  value = max ( max ( a(1:m,1:n) ) );

  return
end
