function value = c8vec_norm_li ( n, a )

%*****************************************************************************80
%
%% C8VEC_NORM_LI returns the Loo norm of a C8VEC.
%
%  Discussion:
%
%    The vector Loo norm is defined as:
%
%      C8VEC_NORM_LI = max ( 1 <= I <= N ) abs ( A(I) ).
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
  value = max ( abs ( a(1:n) ) );

  return
end
