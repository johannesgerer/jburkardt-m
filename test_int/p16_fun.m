function fx = p16_fun ( n, x )

%*****************************************************************************80
%
%% P16_FUN evaluates the integrand for problem 16.
%
%  Interval:
%
%    0 <= x <= 10
%
%  Integrand:
%
%    50.0 / ( pi * ( 2500.0 * x * x + 1.0 ) )
%
%  Antiderivative:
%
%    ( 1 / PI ) * arctan ( 50 * X )
%
%  Approximate Integral (20 digits):
%
%    0.49936338107645674464...
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
  fx = 50.0 ./ pi ./ ( 2500.0 * x .* x + 1.0 );

  return
end
