function mean = r8col_mean ( m, n, a )

%*****************************************************************************80
%
%% R8COL_MEAN returns the column means of an R8COL.
%
%  Example:
%
%    A =
%      1  2  3
%      2  6  7
%
%    MEAN =
%      1.5  4.0  5.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
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
%    Output, real MEAN(N), the means, or averages, of the columns.
%
  for j = 1 : n
    mean(j) = sum ( a(1:m,j) );
  end

  mean(1:n) = mean(1:n) / m;

  return
end
