function fx = p54_fun ( n, x )

%*****************************************************************************80
%
%% P54_FUN evaluates the integrand for problem 54.
%
%  Discussion:
%
%    The reference claims that this integrand is more closely approximated
%    by the trapezoid rule than by Gauss-Legendre quadrature.
%
%    Points  Trapezoid  Gauss-Legendre
%     4      1.91667    2.53883
%    12      2.1594     2.25809
%
%    However, the stated results hardly give one confindence in
%    the convergence of the trapezoid results, and I am unable to
%    confirm them, because my results for 4 points give good results
%    (about 1.14) for BOTH Trapezoid and Gauss-Legendre%
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    2 / ( 2 + sin ( 10 * PI * x ) )
%
%  Exact Integral:
%
%    2 / sqrt ( 3 ) = 1.1547...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Prem Kythe, Pratap Puri,
%    Computational Methods for Linear Integral Equations,
%    Birkhaeuser, 2002.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = 2.0 ./ ( 2.0 + sin ( 10.0 * pi * x(1:n) ) );

  return
end
