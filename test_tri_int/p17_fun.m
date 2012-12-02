function f = p17_fun ( n, p )

%*****************************************************************************80
%
%% P17_FUN evaluates the integrand for problem 17.
%
%  Integrand:
%
%    f(x,y) = 1/sqrt(|x-1/4|) + 1/sqrt(|y-1/2|)
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    3.11357229949...
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
  f(1:n) = ( 1.0 / 3.11357229949 ) * ...
    ( 1.0 ./ sqrt ( abs ( p(1,1:n) - 0.25 ) ) ...
    + 1.0 ./ sqrt ( abs ( p(2,1:n) - 0.50 ) ) );

  return
end
