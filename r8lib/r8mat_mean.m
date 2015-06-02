function value = r8mat_mean ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MEAN returns the mean of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2013
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
%    Output, real VALUE, the mean of A.
%
  value = sum ( sum ( a(1:m,1:n) ) ) / m / n;

  return
end
