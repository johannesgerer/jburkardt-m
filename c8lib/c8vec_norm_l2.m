function value = c8vec_norm_l2 ( n, a )

%*****************************************************************************80
%
%% C8VEC_NORM_L2 returns the L2 norm of a C8VEC.
%
%  Discussion:
%
%    The vector L2 norm is defined as:
%
%      C8VEC_NORM_L2 = sqrt ( sum ( 1 <= I <= N ) conjg ( A(I) ) * A(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, complex A(N), the vector whose L2 norm is desired.
%
%    Output, real VALUE, the L2 norm of A.
%
  value = sqrt ( a(1:n) * a(1:n)' );

  return
end
