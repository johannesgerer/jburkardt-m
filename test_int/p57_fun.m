function fx = p57_fun ( n, x )

%*****************************************************************************80
%
%% P57_FUN evaluates the integrand for problem 57.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    x^(3/2)
%
%  Antiderivative:
%
%    (2/5) * x^(5/2)
%
%  Exact Integral:
%
%    0.4
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
%    David Kahaner,
%    Comparison of Numerical Quadrature Formulas,
%    in Mathematical Software, edited by John R Rice,
%    Academic Press, 1971.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = sqrt ( x(1:n).^3 );

  return
end
