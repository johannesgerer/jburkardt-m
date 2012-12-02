function value = r8mat_minrow_maxcol ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_MINROW_MAXCOL gets the minimum row maximum column of an R8MAT.
%
%  Discussion:
%
%    value = min ( 1 <= J <= N ) ( max ( 1 <= I <= M ) A(I,J) )
%
%    For a given matrix, MAT_MAXCOL_MINROW <= MAT_MINROW_MAXCOL
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
%    Output, real VALUE, the minimum row
%    maximum column entry of A.
%
  value = min ( max ( a(1:m,1:n) ) );

  return
end
