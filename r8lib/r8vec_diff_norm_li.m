function value = r8vec_diff_norm_li ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_DIFF_NORM_LI returns the L-infinity norm of the difference of R8VEC's.
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
%    Output, real VALUE, the L-infinity norm of A - B.
%
  value = max ( abs ( a(1:n) - b(1:n) ) );

  return
end
