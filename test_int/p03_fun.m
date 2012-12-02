function fx = p03_fun ( n, x )

%*****************************************************************************80
%
%% P03_FUN evaluates the integrand for problem 3.
%
%  Discussion:
%
%    The integrand is not differentiable at X = 0.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    sqrt ( x )
%
%  Antiderivative:
%
%    ( 2 / 3 ) * x^(3/2)
%
%  Exact Integral:
%
%    2 / 3
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
  fx = sqrt ( x );

  return
end
