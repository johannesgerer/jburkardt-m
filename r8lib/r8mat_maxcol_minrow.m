function value = r8mat_maxcol_minrow ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MAXCOL_MINROW gets the maximum column minimum row of an R8MAT.
%
%  Discussion:
%
%    value = max ( 1 <= I <= N ) ( min ( 1 <= J <= M ) A(I,J) )
%
%    For a given matrix, MAT_MAXCOL_MINROW <= MAT_MINROW_MAXCOL
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2004
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
%    Output, real VALUE, the maximum column
%    minimum row entry of A.
%
  value = max ( min ( a(1:m,1:n)' ) );

  return
end
