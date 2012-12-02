function value = r8vec_rms ( n, a )

%*****************************************************************************80
%
%% R8VEC_RMS returns the RMS norm of an R8VEC.
%
%  Discussion:
%
%    The vector RMS norm is defined as:
%
%      value = sqrt ( sum ( 1 <= I <= N ) A(I)^2 / N ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2011
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
%    Output, real VALUE, the RMS norm.
%
  value = sqrt ( sum ( a(1:n).^2 ) / n );

  return
end
