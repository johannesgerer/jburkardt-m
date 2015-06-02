function value = c8vec_norm_l1 ( n, a )

%*****************************************************************************80
%
%% C8VEC_NORM_L1 returns the L1 norm of a C8VEC.
%
%  Discussion:
%
%    The vector L1 norm is defined as:
%
%      C8VEC_NORM_L1 =  sum ( 1 <= I <= N ) abs ( A(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, complex A(N), the vector.
%
%    Output, real VALUE, the norm.
%
  value = sum ( abs ( a(1:n) ) );

  return
end
