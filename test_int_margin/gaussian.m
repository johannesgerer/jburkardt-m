function f = gaussian ( mu, sigma, n, x )

%*****************************************************************************80
%
%% GAUSSIAN evaluates a Gaussian function.
%
%  Discussion:
%
%    Integral ( a <= x <= b ) exp ( - ( x - m )^2 / sigma^2 ) dx
%
%    = sqrt ( pi ) * s / 2 * ( erf ( ( m - a ) / s ) - erf ( ( m - b ) / s ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real MU, the mean.
%
%    Input, real SIGMA, the standard deviation.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N), the values of the gaussian.
%
  x = x(:);

  f = exp ( - ( ( x - mu ) / sigma ).^2 );

  return
end
