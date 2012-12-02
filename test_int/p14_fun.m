function fx = p14_fun ( n, x )

%*****************************************************************************80
%
%% P14_FUN evaluates the integrand for problem 14.
%
%  Discussion:
%
%    For X's that aren't actually very big, the function becomes very
%    small.  Some compilers may product code that fails in these cases.
%    An attempt has been made to return a value of 0 when the computed
%    value of F(X) would be extremely small.
%
%  Interval:
%
%    0 <= x <= 10
%
%  Integrand:
%
%    sqrt ( 50 ) * exp ( - 50 * pi * x * x )
%
%  Exact Integral:
%
%    0.5 * erf ( 50 * sqrt ( 2 * pi ) )
%
%  Approximate Integral:
%
%    0.500000211166...
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
  fx = sqrt ( 50.0 ) * exp ( - 50.0 * pi * x .* x );

  return
end
