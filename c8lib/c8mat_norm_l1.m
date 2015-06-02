function value = c8mat_norm_l1 ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_NORM_L1 returns the matrix L1 norm of a C8MAT.
%
%  Discussion:
%
%    The matrix L1 norm is defined as:
%
%      C8MAT_NORM_L1 = max ( 1 <= J <= N )
%        sum ( 1 <= I <= M ) abs ( A(I,J) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, complex A(M,N), the matrix.
%
%    Output, real VALUE, the norm of A.
%
  value = 0.0;

  for j = 1 : n
    col_sum = sum ( abs ( a(1:m,j) ) );
    value = max ( value, col_sum );
  end

  return
end
