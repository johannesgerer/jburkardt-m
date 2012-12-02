function value = r8vec_diff_norm_l2 ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_DIFF_NORM_L2 returns the L2 norm of the difference of R8VEC's.
%
%  Discussion:
%
%    The vector L2 norm is defined as:
%
%      value = sqrt ( sum ( 1 <= I <= N ) A(I)**2 ).
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
%    Output, real VALUE, the L2 norm of A - B.
%
  value = norm ( a(1:n) - b(1:n) );

  return
end
