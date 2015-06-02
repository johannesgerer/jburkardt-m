function x = r8row_to_r8vec ( m, n, a )

%*****************************************************************************80
%
%% R8ROW_TO_R8VEC converts an R8ROW into an R8VEC.
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
%    X = ( 11, 12, 13, 14, 21, 22, 23, 24, 31, 32, 33, 34 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the R8ROW.
%
%    Output, real X(M*N), a vector containing the M rows of A.
%
  j = 1;
  for i = 1 : m
    x(j:j+n-1) = a(i,1:n);
    j = j + n;
  end

  return
end
