function value = r8mat_mincol_maxrow ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MINCOL_MAXROW gets the minimum column maximum row of an R8MAT.
%
%  Discussion:
%
%    value = min ( 1 <= I <= N ) ( max ( 1 <= J <= M ) A(I,J) )
%
%    For a given matrix, R8MAT_MAXROW_MINCOL <= R8MAT_MINCOL_MAXROW
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
%    Output, real VALUE, the minimum column
%    maximum row entry of A.
%
  value = max ( min ( a(1:m,1:n)' ) );

  return
end
