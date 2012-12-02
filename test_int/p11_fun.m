function fx = p11_fun ( n, x )

%*****************************************************************************80
%
%% P11_FUN evaluates the integrand for problem 11.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    1 / ( 1 + exp ( x ) )
%
%  Antiderivative:
%
%    ln ( exp ( x ) / ( 1 + exp ( x ) ) )
%
%  Exact Integral:
%
%    ln ( 2 * E / ( 1 + E ) )
%
%  Approximate Integral (20 digits):
%
%    0.37988549304172247537...
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
  fx = 1.0 ./ ( 1.0 + exp ( x ) );

  return
end
