function value = r8vec_norm_l1 ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM_L1 returns the L1 norm of an R8VEC.
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
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, real A(N), the vector whose L1 norm is desired.
%
%    Output, real VALUE, the L1 norm of A.
%
  value = sum ( abs ( a(1:n) ) );

  return
end
