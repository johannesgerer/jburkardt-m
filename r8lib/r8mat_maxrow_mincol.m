function value = r8mat_maxrow_mincol ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MAXROW_MINCOL gets the maximum row minimum column of an R8MAT.
%
%  Discussion:
%
%    value = max ( 1 <= J <= N ) ( min ( 1 <= I <= M ) A(I,J) )
%
%    For a given matrix, MAT_MAXROW_MINCOL <= MAT_MINCOL_MAXROW
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
%    Output, real VALUE, the maximum row
%    minimum column entry of A.
%
  value = max ( min ( a(1:m,1:n) ) );

  return
end
