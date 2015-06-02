function w = moments_normal ( m, mu, sigma )

%*****************************************************************************80
%
%% MOMENTS_NORMAL returns moments of the standard Normal distribution.
%
%  Discussion:
%
%    pdf(x) = exp ( -((x-mu)/sigma)^2/2 ) / sigma / sqrt ( pi * 2 )
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
%    Input, real MU, SIGMA, the mean and standard deviation.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for k = 1 : m
    n = k - 1;
    t = 0.0;
    for j = 0 : floor ( n / 2 )
      t = t + r8_choose ( n, 2 * j ) * r8_factorial2 ( 2 * j - 1 ) ...
        * sigma ^ ( 2 * j ) * mu ^ ( n - 2 * j );
    end
    w(k) = t;
  end

  return
end

