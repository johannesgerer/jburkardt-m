function value = r8vec_norm_l2 ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM_L2 returns the L2 norm of an R8VEC.
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
%    Input, real A(N), the vector whose L2 norm is desired.
%
%    Output, real VALUE, the L2 norm of A.
%
  value = sqrt ( sum ( a(1:n).^2 ) );

  return
end
