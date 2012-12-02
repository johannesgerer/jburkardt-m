function f = p08_fun ( n, p )

%*****************************************************************************80
%
%% P08_FUN evaluates the integrand for problem 8.
%
%  Integrand:
%
%    f(x,y) = 30 * x^4
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    1.0
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
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  f(1:n) = 30.0 * p(1,1:n).^4;

  return
end
