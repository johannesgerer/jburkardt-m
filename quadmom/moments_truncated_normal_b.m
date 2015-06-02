function w = moments_truncated_normal_b ( m, mu, s, b )

%*****************************************************************************80
%
%% MOMENTS_TRUNCATED_NORMAL_B: moments of the upper truncated normal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2013
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
%    Input, real B, the upper truncation limit.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for order = 0 : m - 1
    w(order+1) = truncated_normal_b_moment ( order, mu, s, b );
  end

  return
end

