function mom = line_monomial_moments ( a, b, m )

%*****************************************************************************80
%
%% LINE_MONOMIAL_MOMENTS computes monomial moments in [A,B].
%
%  Discussion:
%
%    We use the uniform weight and the shifted and scaled monomial basis:
%
%      P(a,b,i;x) = xi(a,b;x)^(i-1)
%       xi(a,b;x) = ( - ( b - x ) + ( x - a ) ) / ( b - a )
%
%    The i-th moment is
%
%      mom(i) = integral ( a <= x <= b ) P(a,b,i;x) dx
%             = integral ( a <= x <= b ) xi(a,b;x)^(i-1) dx
%             = 0.5 * ( b - a ) * integral ( -1 <= xi <= +1 ) xi^(i-1) dxi
%             = 0.5 * ( b - a ) * xi^i / i | ( -1 <= xi <= +1 )
%             = 0.5 * ( b - a ) * ( 1 - (-1)^i ) / i
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, integer M, the number of basis polynomials.
%
%    Output, real MOM(M), the moments.
%
  mom = zeros ( m, 1 );

  for i = 1 : m
    mom(i) = ( b - a ) * mod ( i, 2 ) / i;
  end

  return
end
