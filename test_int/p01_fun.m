function fx = p01_fun ( n, x )

%*****************************************************************************80
%
%% P01_FUN evaluates the integrand for problem 1.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    exp ( x )
%
%  Antiderivative:
%
%    exp ( x )
%
%  Exact Integral:
%
%    exp ( 1 ) - 1
%
%  Approximate Integral (25 digits):
%
%    1.718281828459045235360287...
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
  fx(1:n) = exp ( x(1:n) );

  return
end
