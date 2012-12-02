function f = p02_fun ( n, p )

%*****************************************************************************80
%
%% P02_FUN evaluates the integrand for problem 2.
%
%  Integrand:
%
%    f(x,y) = 6 * x
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
%    09 April 2007
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
  f(1:n) = 6.0 * p(1,1:n);

  return
end
