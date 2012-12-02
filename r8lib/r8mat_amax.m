function value = r8mat_amax ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_AMAX returns the maximum absolute value entry of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2012
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
%    Output, real VALUE, the maximum absolute value entry of A.
%
  value = max ( max ( abs ( a(1:m,1:n) ) ) );

  return
end
