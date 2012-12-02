function f = p20_fun ( n, p )

%*****************************************************************************80
%
%% P20_FUN evaluates the integrand for problem 20.
%
%  Integrand:
%
%    f(x,y) = sin ( 11 x ) * cos ( y )
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    ( 11 * sin ( 1 ) - sin ( 11 ) / 120 = 0.085468091995313041919
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
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
  c = 0.085468091995313041919;

  f(1:n) = sin ( 11.0 * p(1,1:n) ) .* cos ( p(2,1:n) ) / c;

  return
end
