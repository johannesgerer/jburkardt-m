function x = r8col_to_r8vec ( m, n, a )

%*****************************************************************************80
%
%% R8COL_TO_R8VEC converts an R8COL to an R8VEC.
%
%  Example:
%
%    M = 3, N = 4
%
%    A =
%      11 12 13 14
%      21 22 23 24
%      31 32 33 34
%
%    X = ( 11, 21, 31, 12, 22, 32, 13, 23, 33, 14, 24, 34 )
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
%    Input, real A(M,N), the M by N array.
%
%    Output, real X(M*N), a vector containing the N columns of A.
%
  i = 1;
  for j = 1 : n
    x(i:i+m-1) = a(1:m,j);
    i = i + m;
  end

  return
end
