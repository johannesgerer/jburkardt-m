function fx = p10_fun ( n, x )

%*****************************************************************************80
%
%% P10_FUN evaluates the integrand for problem 10.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    1 / ( 1 + x )
%
%  Antiderivative:
%
%    ln ( 1 + x )
%
%  Exact Integral:
%
%    ln ( 2 )
%
%  Approximate Integral (25 digits):
%
%    0.6931471805599453094172321...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
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
  fx = 1.0 ./ ( 1.0 + x );

  return
end
