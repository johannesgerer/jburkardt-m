function f = p03_fun ( n, p, f )

%*****************************************************************************80
%
%% P03_FUN evaluates the integrand for problem 3.
%
%  Integrand:
%
%    f(x,y) = 6 * y
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
  f(1:n) = 6.0 * p(2,1:n);

  return
end
