function value = r8mat_sum ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_SUM returns the sum of the entries of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the array.
%
%    Output, real VALUE, the sum of the entries.
%
  value = sum ( sum ( a(1:m,1:n) ) );

  return
end
