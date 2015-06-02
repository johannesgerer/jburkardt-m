function value = r8mat_norm_l1 ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NORM_L1 returns the matrix L1 norm of an R8MAT.
%
%  Discussion:
%
%    The matrix L1 norm is defined as:
%
%      value = max ( 1 <= J <= N ) sum ( 1 <= I <= M ) abs ( A(I,J) ).
%
%    The matrix L1 norm is derived from the vector L1 norm, and
%    satisifies:
%
%      vec_norm_l1 ( A * x ) <= mat_norm_l1 ( A ) * vec_norm_l1 ( x ).
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
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix whose L1 norm is desired.
%
%    Output, real VALUE, the L1 norm of A.
%
  value = 0.0;

  for j = 1 : n
    value = max ( value, sum ( abs ( a(1:m,j) ) ) );
  end

  return
end
