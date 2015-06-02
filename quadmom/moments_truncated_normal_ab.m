function w = moments_truncated_normal_ab ( m, mu, s, a, b )

%*****************************************************************************80
%
%% MOMENTS_TRUNCATED_NORMAL_AB: moments of the truncated normal distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%    0 < S.
%
%    Input, real A, B, the lower and upper truncation limits.
%    A < B.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for order = 0 : m - 1
    w(order+1) = truncated_normal_ab_moment ( order, mu, s, a, b );
  end

  return
end

