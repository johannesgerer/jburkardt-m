function fx = p09_fun ( n, x )

%*****************************************************************************80
%
%% P09_FUN evaluates the integrand for problem 9.
%
%  Discussion:
%
%    The integrand is oscillatory, going through 5 periods in [0,1].
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    2 / ( 2 + sin ( 10 * pi * X ) )
%
%  Antiderivative:
%
%    1 / ( 5 * pi * sqrt ( 3 ) ) *
%    arctan ( ( 1 + 2 * tan ( 5 * pi * X ) ) / sqrt ( 3 ) )
%
%  Exact Integral:
%
%    2 / sqrt ( 3 )
%
%  Approximate Integral (20 digits):
%
%    1.1547005383792515290...
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
  fx = 2.0 ./ ( 2.0 + sin ( 10.0 * pi * x ) );

  return
end
