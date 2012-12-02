function f = p14_fun ( n, p )

%*****************************************************************************80
%
%% P14_FUN evaluates the integrand for problem 14.
%
%  Integrand:
%
%    f(x,y) = 1 / sqrt ( X ) + 1 / sqrt ( Y ) + 1 / sqrt ( X + Y )
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    10/3
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
  f(1:n) = 3.0 / 10.0 * (      ...
           1.0 ./ sqrt ( p(1,1:n) ) ...
         + 1.0 ./ sqrt ( p(2,1:n) ) ...
         + 1.0 ./ sqrt ( p(1,1:n) + p(2,1:n) ) );

  return
end
