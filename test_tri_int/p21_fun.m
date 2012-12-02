function f = p21_fun ( n, p )

%*****************************************************************************80
%
%% P21_FUN evaluates the integrand for problem 21.
%
%  Discussion:
%
%    To do this integral by hand, convert to polar coordinates:
%
%    Integral ( 0 <= t <= Pi/2 )
%      Integral ( 0 <= r <= 1/(cos(t)+sin(t)) ) 1/r * r dr dt
%
%  Integrand:
%
%    f(x,y) = 1 / sqrt ( x * x + y * y )
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    sqrt ( 2 ) * atanh ( 1/sqrt(2) ) = 1.246450480...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Elise deDoncker, Ian Robinson,
%    Algorithm 612:
%    Integration over a Triangle Using Nonlinear Extrapolation,
%    ACM Transactions on Mathematical Software,
%    Volume 10, Number 1, March 1984, pages 17-22.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  c = 1.2464504802804610268;

  f(1:n) = 1.0 ./ sqrt ( p(1,1:n).^2 + p(2,1:n).^2 ) / c;

  return
end
