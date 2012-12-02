function f = p05_fun ( n, p )

%*****************************************************************************80
%
%% P05_FUN evaluates the integrand for problem 5.
%
%  Integrand:
%
%    f(x,y) = 24 * x*y
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
  f(1:n) = 24.0 * p(1,1:n) .* p(2,1:n);

  return
end
