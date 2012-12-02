function f = p19_fun ( n, p )

%*****************************************************************************80
%
%% P19_FUN evaluates the integrand for problem 19.
%
%  Integrand:
%
%    f(x,y) = sin ( x ) * cos ( 5 * y )
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    ( 3 + 2 * cos ( 2 ) ) * sin ( 1 )**3 / 30 = 0.043052326655855175018
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
  c = 0.043052326655855175018;

  f(1:n) = sin ( p(1,1:n) ) .* cos ( 5.0 * p(2,1:n) ) / c;

  return
end
