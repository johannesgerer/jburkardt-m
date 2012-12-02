function colsum = r8col_sum ( m, n, a )

%*****************************************************************************80
%
%% R8COL_SUM sums the columns of an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the array to be examined.
%
%    Output, real COLSUM(N), the sums of the columns.
%
  for j = 1 : n
    colsum(j) = sum ( a(1:m,j) );
  end

  return
end
