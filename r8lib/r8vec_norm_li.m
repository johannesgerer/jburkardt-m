function value = r8vec_norm_li ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM_LI returns the L-infinity norm of an R8VEC.
%
%  Discussion:
%
%    The vector L-infinity norm is defined as:
%
%      value = max ( 1 <= I <= N ) abs ( A(I) ).
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
%    Input, real A(N), the vector whose L-infinity norm is desired.
%
%    Output, real VALUE, the L-infinity norm of A.
%
  value = max ( abs ( a(1:n) ) );

  return
end
