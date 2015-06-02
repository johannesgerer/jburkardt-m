function w = moments_normal_01 ( m )

%*****************************************************************************80
%
%% MOMENTS_NORMAL_01 returns moments of the standard Normal distribution.
%
%  Discussion:
%
%    pdf(x) = exp ( -x^2/2 ) / sqrt ( pi * 2 )
%    mu(k) = integral ( -oo < x < +oo ) x^k pdf(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  w(1) = 1.0;

  for k = 3 : 2: m
    w(k) = r8_factorial2 ( k - 2 );
  end

  for k = 2 : 2 : m
    w(k) = 0.0;
  end

  return
end

