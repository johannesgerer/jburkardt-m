function w = moments_laguerre ( m )

%*****************************************************************************80
%
%% MOMENTS_LAGUERRE returns moments of the Laguerre distribution.
%
%  Discussion:
%
%    pdf(x) = exp ( -x )
%    mu(k) = integral ( 0 <= x < +oo ) x^k pdf(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2013
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

  for k = 1 : m
    w(k) = r8_factorial ( k - 1 );
  end

  return
end

