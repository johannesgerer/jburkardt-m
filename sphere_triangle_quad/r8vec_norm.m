function value = r8vec_norm ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM returns the L2 norm of an R8VEC.
%
%  Discussion:
%
%    The vector L2 norm is defined as:
%
%      value = sqrt ( sum ( 1 <= I <= N ) A(I)^2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the vector dimension.
%
%    Input, real A(N), the vector.
%
%    Output, real VALUE, the L2 norm.
%
  value = sqrt ( sum ( a(1:n).^2 ) );

  return
end
