function fx = p15_fun ( n, x )

%*****************************************************************************80
%
%% P15_FUN evaluates the integrand for problem 15.
%
%  Interval:
%
%    0 <= x <= 10
%
%  Integrand:
%
%    25 * exp ( - 25 * x )
%
%  Antiderivative:
%
%    - exp ( - 25 * X )
%
%  Exact Integral:
%
%    1 - exp ( - 250 )
%
%  Approximate Integral:
%
%    1.00000000...
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
  fx = 25.0 * exp ( - 25.0 * x );

  return
end
