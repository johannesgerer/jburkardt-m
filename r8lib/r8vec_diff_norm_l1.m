function value = r8vec_diff_norm_l1 ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_DIFF_NORM_L1 returns the L1 norm of the difference of R8VEC's.
%
%  Discussion:
%
%    The vector L1 norm is defined as:
%
%      value = sum ( 1 <= I <= N ) abs ( A(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, real A(N), B(N), the vectors.
%
%    Output, real VALUE, the L1 norm of A - B.
%
  value = sum ( abs ( a(1:n) - b(1:n) ) );

  return
end
